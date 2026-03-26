# Entra ID OAuth2 checklist

Here’s a practical checklist for a frontend using **Microsoft Entra ID / OAuth2 bearer tokens** to call a REST API.

## 1. Transport

* Serve the frontend and API over **HTTPS only**. OWASP recommends HTTPS for REST services to protect credentials and tokens in transit. ([OWASP Cheat Sheet Series][1])
* Redirect or reject plain HTTP.
* Enable HSTS on the frontend domain.

## 2. Authentication flow

* Use a standard Entra flow for browser apps, typically **authorization code flow with PKCE**.
* Use **access tokens** for the API, not ID tokens.
* Do not let the frontend invent trust from UI state alone.

## 3. Token handling in the frontend

* Send the token in `Authorization: Bearer <token>`.
* Prefer keeping tokens **in memory** where practical.
* Be careful with `localStorage` or other long-lived browser storage, because if you get XSS, the attacker may be able to steal or use tokens.
* Never put access tokens in URLs.

## 4. CSRF

* If your API is authenticated by a bearer token sent in the `Authorization` header, **CSRF is usually not the main concern**, because CSRF relies on the browser automatically sending credentials such as cookies. OWASP’s CSRF guidance is aimed at those automatically sent credentials. ([OWASP Cheat Sheet Series][2])
* If you later switch to **cookie-based auth**, session cookies, or a BFF pattern with browser cookies, then reassess CSRF immediately.

## 5. CORS

* Allow only your real frontend origins.
* Do **not** use `*` for a protected API.
* Allow only the methods and headers you actually need, especially `Authorization` and `Content-Type`.
* Avoid overly broad cross-origin exposure just because login works.

## 6. Validate tokens in the API

Microsoft says apps that validate access tokens should validate the **signature** and **issuer** using the OpenID metadata / discovery document. ([Microsoft Learn][3])

For each incoming access token, validate at least:

* signature
* issuer (`iss`)
* audience (`aud`)
* expiration (`exp`)
* not-before if used (`nbf`)
* token version / expected format if relevant
* tenant expectations, if your API is single-tenant vs multi-tenant

Also:

* reject malformed tokens
* reject unsigned or wrong-algorithm tokens
* use the Entra metadata / JWKS keys, not hardcoded guesses

## 7. Check authorization, not just authentication

A valid token only proves the caller got a token. Your API still needs to check whether the caller is allowed to perform the action.

Check:

* scopes (`scp`) for delegated user access
* app roles / role claims where applicable
* object ownership / tenant boundaries in your own data model
* per-endpoint authorization rules

Do not rely only on “token exists”.

## 8. Accept only tokens meant for your API

* The `aud` must be your API, not Microsoft Graph, not another internal API, not the SPA app registration.
* If you have multiple APIs, each must validate that the token is intended for that API.
* Do not accept an ID token as proof for API access.

## 9. Multi-tenant and tenant isolation

Since you work with Entra and likely tenant-aware data:

* decide whether your API is **single-tenant** or **multi-tenant**
* if multi-tenant, make tenant boundaries explicit in your authorization logic
* do not trust a tenant ID in the request body if the token and your server-side mapping disagree
* enforce row-level or service-level tenant isolation consistently

## 10. Downstream APIs

If your API calls another API on behalf of the user:

* use the proper **On-Behalf-Of** flow rather than forwarding the original token blindly. Microsoft documents OBO specifically for this middle-tier API scenario. ([Microsoft Learn][4])
* avoid turning your API into a token pass-through layer

## 11. Input and output security

* validate all input server-side
* apply allowlists where possible
* encode output correctly in the frontend
* do not trust claims to replace normal validation
* log validation failures, but not sensitive contents

OWASP recommends strong input validation as part of secure API design. ([OWASP Cheat Sheet Series][5])

## 12. XSS hardening

For your architecture, XSS is often a bigger browser risk than CSRF because XSS can abuse or steal tokens stored in the app context.

Do:

* strong output encoding
* CSP where possible
* avoid unsafe HTML rendering
* sanitize rich text if you must render it
* keep dependencies updated
* add security headers

OWASP’s HTTP security headers guidance covers useful browser protections such as CSP and related headers. ([OWASP Cheat Sheet Series][6])

## 13. Error handling

* return generic auth errors like 401/403 without leaking internals
* do not expose full token validation reasons to the client
* do detailed logging server-side only

## 14. Logging and observability

* log token validation failures, issuer/audience mismatches, denied scopes, and tenant mismatches
* never log full bearer tokens
* mask sensitive claims if needed
* include correlation/request IDs

## 15. Token lifetime and refresh

* prefer short-lived access tokens
* let the frontend obtain new tokens through the proper Entra/MSAL flow
* do not build your own insecure refresh mechanism unless you really need one

## 16. Frontend app registration hygiene

* separate app registrations clearly where needed: SPA vs API
* expose only the scopes your API actually uses
* grant only the minimum delegated permissions necessary
* review consent and app roles regularly

## 17. API gateway / APIM

If you use Azure API Management, Microsoft provides Entra token validation policies so the gateway can enforce JWT validity before traffic reaches the backend. ([Microsoft Learn][7])

## 18. Quick “am I safe?” test

For your setup, these should all be true:

* frontend gets token from Entra
* frontend sends `Authorization: Bearer ...`
* API validates signature, issuer, audience, expiry
* API checks scopes/roles
* API enforces tenant isolation
* API has strict CORS
* no browser-auth cookies are used for API auth

If that is true, then:

* **CSRF is usually low relevance**
* **XSS, token validation, and authorization are high relevance**

## 19. Common mistakes

* accepting **ID tokens** at the API
* not checking `aud`
* trusting any Entra-issued token instead of one meant for your API
* using broad CORS
* treating authentication as authorization
* passing user tokens downstream incorrectly instead of OBO
* storing tokens carelessly in the browser
* leaking tokens in logs

## 20. Very short version

For your architecture:

* **CSRF:** usually not needed
* **Must get right:** HTTPS, CORS, token validation, scopes/roles, tenant isolation, XSS prevention

If you want, I can turn this into a **FastAPI-specific checklist** with concrete middleware/config patterns for Entra bearer tokens.

[1]: https://cheatsheetseries.owasp.org/cheatsheets/REST_Security_Cheat_Sheet.html?utm_source=chatgpt.com "REST Security - OWASP Cheat Sheet Series"
[2]: https://cheatsheetseries.owasp.org/cheatsheets/Cross-Site_Request_Forgery_Prevention_Cheat_Sheet.html?utm_source=chatgpt.com "Cross-Site Request Forgery Prevention Cheat Sheet"
[3]: https://learn.microsoft.com/en-us/entra/identity-platform/access-tokens?utm_source=chatgpt.com "Access tokens in the Microsoft identity platform"
[4]: https://learn.microsoft.com/en-us/entra/identity-platform/v2-oauth2-on-behalf-of-flow?utm_source=chatgpt.com "Microsoft identity platform and OAuth2.0 On-Behalf-Of flow"
[5]: https://cheatsheetseries.owasp.org/cheatsheets/Input_Validation_Cheat_Sheet.html?utm_source=chatgpt.com "Input Validation - OWASP Cheat Sheet Series"
[6]: https://cheatsheetseries.owasp.org/cheatsheets/HTTP_Headers_Cheat_Sheet.html?utm_source=chatgpt.com "HTTP Security Response Headers Cheat Sheet"
[7]: https://learn.microsoft.com/en-us/azure/api-management/validate-azure-ad-token-policy?utm_source=chatgpt.com "validate-azure-ad-token - API Management"

---

# IMPORTANT checking aud

`aud` = **audience**

It’s one of the most important fields in an OAuth2 / JWT access token.

---

## What `aud` means

The `aud` claim tells you:

> **“Who is this token intended for?”**

In your case:

* It should be **your REST API**
* Not your frontend
* Not Microsoft Graph
* Not another API

---

## Example token (simplified)

```json
{
  "iss": "https://login.microsoftonline.com/...",
  "aud": "api://my-api-app-id",
  "scp": "user.read",
  "exp": 1710000000
}
```

Here:

* `aud = api://my-api-app-id` → this token is meant for **your API**

---

## Why checking `aud` is critical

If you **don’t check `aud`**, your API might accept tokens that were **never meant for it**.

### Real problem example

Frontend gets a token for:

* Microsoft Graph (`aud = https://graph.microsoft.com`)

Then calls your API with that token.

If your API:

* only checks signature
* but NOT `aud`

👉 Your API might accept it

---

## Why that is bad

That token proves:

* the user authenticated with Entra

But it does **NOT** prove:

* the user was granted access to **your API**

So you’re basically saying:

> “Any valid Microsoft token is fine”

That’s a **serious security issue**

---

## What you should do

Your API must enforce:

```text
aud == your API identifier
```

In Entra this is usually:

* `api://<app-id>`
* or your configured Application ID URI

---

## Practical rule

Always validate:

* signature ✅
* issuer (`iss`) ✅
* expiration (`exp`) ✅
* **audience (`aud`) ← critical**

---

## Simple mental model

* `iss` → who issued the token
* `sub` → who the user is
* `aud` → **who is allowed to accept this token**

---

## One-liner takeaway

> If you don’t check `aud`, your API might accept tokens issued for completely different services.

---


