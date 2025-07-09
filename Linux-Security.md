# Minimal Linux Server Best Practices

## User Management

**Disable root SSH access immediately.** The root user exists on every Linux system by default, giving attackers half the login credentials they need. This makes brute-force attacks trivial.

**Create individual user accounts** with sudo privileges instead. Each person should have their own login for proper audit trails and accountability.

## SSH Key Authentication

**Replace password authentication with SSH keys.** Passwords can be brute-forced or guessed using dictionary attacks. SSH keys use cryptographic key pairs that are virtually impossible to crack.

**Generate a key pair:**
```bash
ssh-keygen -t rsa -b 4096 -a 100
ssh-keygen -t rsa -b 4096 -a 100 -f kobor_rsa  # custom filename
```

**Upload the public key** (never the private key) to your server:
```bash
ssh-copy-id -i ~/.ssh/id_rsa.pub username@server-ip
```

## SSH Configuration Hardening

**Change the default port** from 22 to something non-standard. While not foolproof, this eliminates most automated scanning attempts.

**Restrict IP protocol support** to only what you need (IPv4 or IPv6, not both).

**Edit `/etc/ssh/sshd_config`:**
```
Port 2233
PermitRootLogin no
PasswordAuthentication no
AddressFamily inet
```

These changes force attackers to work harder while maintaining usability for legitimate users.

## References
- [Rackspace Security Guide](https://docs.rackspace.com/support/how-to/linux-server-security-best-practices/)
- [Linode Server Security](https://www.linode.com/docs/guides/securing-your-server/)
- [DigitalOcean VPS Security](https://www.digitalocean.com/community/tutorials/an-introduction-to-securing-your-linux-vps)
- [Azure Security Design](https://dev.to/azure/pushing-left-like-a-boss-part-3-secure-design-4dm6)
