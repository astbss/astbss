Coding rules and guidelines ensure that software is:

- **Safe:** It can be used without causing harm.
- **Secure:** It can’t be hacked.
- **Reliable:** It functions as it should, every time.
- **Testable:** It can be tested at the code level.
- **Maintainable:** It can be maintained, even as our codebase grows.
- **Portable:** It works the same in every environment.

# Security Guidelines
- [We always follow our guidelines for Secure Software Development](Guidelines-for-secure-software-development)

# PEP 8 -- Style Guide for Python Code
- [We follow the PHP 8 Style Guide](https://www.python.org/dev/peps/pep-0008/#string-quotes)
- Function and Variable names '''should be lowercase''', with words separated by underscores as necessary to improve readability.

# Docstring Conventions
- https://www.python.org/dev/peps/pep-0257/ 
- _We use a Dockstring in every function to explain the purpose of the function_

# Prevent SQL Injection Attach (SQLi)
- SQL injection is a code injection technique that might destroy your database.
- SQL injection is one of the most common web hacking techniques.
- SQL injection is the placement of malicious code in SQL statements, via web page input.
- **We only use Parameterized Query parameters**. The most important reason to use parameterized queries is to avoid SQL injection attacks.
#### Example:
```python
sql = """SELECT *, concat(temporary_domain,'.',temporary_host) domain 
FROM appservices where uuid = %s  ORDER BY sid"""
bgmysql.sql_exec(cur, sql, uuid)
```
- https://pynative.com/python-mysql-execute-parameterized-query-using-prepared-statement/
- https://www.acunetix.com/websitesecurity/sql-injection/
- The OWASP organization (Open Web Application Security Project) lists SQL injections in their OWASP Top 10 2017 document as the number one threat to web application security.
# Use DataTables for HTML tables
- Normally all our html tables are using Datatables.
- We normally have DataTables pagination and search enabled, exept if there is a good reason not to
- https://datatables.net/  DataTables advanced interaction controls for HTML tables

# Always enable CSRF Protection
- https://flask-wtf.readthedocs.io/en/stable/csrf.html

# Insecure forms? Always use https on FORM POST
- This applies to production as we do not have HTTPS during development. The developer still need to code this
- https://blog.chromium.org/2020/08/protecting-google-chrome-users-from.html
- https://github.com/BraatheGruppenAS/Dev_Tasks_Docs/issues/913

# Never trust data from the browser
> Important: The single most important lesson you can learn about website security is to never trust data from the browser. This includes, but is not limited to data in URL parameters of GET requests, POST requests, HTTP headers and cookies, and user-uploaded files. Always check and sanitize all incoming data. Always assume the worst.

# Always Strip Spaces and Bad Characters from an HTML Forms
- We always need to strip space from the start and the end of every text box
- We also need to remove other bad Chars
- Some fields like domain name or active directory demand more aggressive strip procedure
- We have a simple function for this pycoreutils.remove_bad_chars(ss)
- The following code in pycoreutils.py is easy to use and will strip every field in the form automatically
```
for k in form:
    if type(form[k]).__name__ == 'str':
        form[k] = remove_bad_chars(form[k])
```

# Modal Placement and rules
- Modals normally need to be placed in the middle of the screen for better user experience. Remember to set focus to the first user input control.

# Separation of concerns (SoC) 
- https://en.wikipedia.org/wiki/Separation_of_concerns

Inside an application, there are multiple components. Their code is divided into other subcomponents, such as modules or packages, and the modules into classes or functions, and the classes into methods. Particularly in the case of functions - **functions should do one thing**, and be small.

Small functions that do one thing are easier to understand, follow, and debug. They are also easier to test. The smaller the pieces in our code, the easier it will be to write unit tests for it.

# Don't repeat yourself (DRY)
- https://en.wikipedia.org/wiki/Don%27t_repeat_yourself
- We do not code the same thing multiple times. Write functions or views that do the task and use them again and again

# Keep It Simple, Stupid (Kiss)
- https://www.interaction-design.org/literature/topics/keep-it-simple-stupid
- https://en.wikipedia.org/wiki/Overengineering
- Keep everything as simple and consistent as possible. Always remember all software has to be changed in the future. Make it easy for others to use and change your work.
> Everything Should Be Made as Simple as Possible, But Not Simpler -- Albert Einstein

> Simple is better than complex. Complex is better than complicated. -- The Zen of Python

> Complexity is the enemy. Complexity usually means there are many unknowns and that the team has too many variables to work on. A complex problem requires a complex plan which is not easily understood and not easily executed.”

# Security Requirements
- https://dev.to/azure/pushing-left-like-a-boss-part-2-security-requirements-549a

**Trust no one:** validate and sanitize all data, even from your own database
all sanitation of input should be performed on the server-side. You can validate on the client-side AND the server-side, but the final decision must always be made server-side.

A whitelist is always recommended when performing input validation. A whitelist is a a list of “known good” characters that you will accept. Do not blacklist.

Forbid passing variables that are of any importance in the URL. For example, you can pass which language (“en”, “fr”, “sp”) but not your userid, bank account number or anything of any importance within your application or your life

Allow users to cut and paste into the password field, which will allow for use of password managers. Disable password autocomplete features in browsers, to ensure users do not save their passwords into the browser.

The one thing that you should always remember when coding defensively, is that you need to assume that users will do something that you did not plan on.

When sending queries to the database it is important that we use parameterized queries (also known as prepared statements), rather than inline SQL or other database languages. Inline SQL is the pasting of user input together with database query language, then submitting it directly to the database for execution, which is a highly dangerous activity.

https://www.owasp.org/index.php/Top_10-2017_A1-Injection

For those of you who are unaware, [injection attacks are the #1](https://www.owasp.org/index.php/Top_10-2017_A1-Injection) most damaging and dangerous type of web application attack, and are generally considered to be rated as “critical” if found in a live application.

Allowing files to be uploaded to your applications (and therefore your network) is risky business. In fact, it just may be the riskiest functionality that you can add to a web application.

Never put information in the parameters in the URL of your application that are important. When I say “important”, I mean something that would potentially be used to make a decision in your application that is not trivial. The same goes for hidden fields, don’t store or pass anything valuable there either. Important information must be transmitted in a secure manner, and hidden fields and URL parameters are not the place for that

Trust data from…. No one. Not the database, not APIs, not even your mom.

Any data sent to your application needs to be treated as untrusted, and thus validated before it is used or saved. When I say this, I mean ALL DATA. Whoever saved the data to that database may have made an error while validating that input

 I realize that generally we assume that we are guarding against only malicious actors, but this is not true: even well-meaning, well-educated and computer-literate users can cause problems if your application is too trusting of the data it receives. If you treat all data as potentially malicious you will ensure that your application is not only battle-ready, but also error-proof.
 
Validate data from all sources, including:
    Parameters in the URL
    The database
    APIs (internal and external)
    Other Applications
    Users. Especially users.
- https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Input_Validation_Cheat_Sheet.md

When writing code for authorization within applications, use the features in your framework, and re-verify access for every feature and/or page of your application. Test your implementation thoroughly, with each role, for best results.

- https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Authorization_Testing_Automation.md
- https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Access_Control_Cheat_Sheet.md
- https://github.com/OWASP/CheatSheetSeries/blob/master/Index.md
- https://pages.nist.gov/800-63-3/sp800-63b.html NIST Password Standard
- https://dev.to/azure/pushing-left-like-a-boss-part-5-14-secure-coding-summary-5dd2

