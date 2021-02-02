## User management

### Remote root logins are a bad idea

By default, the root user is created as the first user on every Linux system. You should disable it via Secure Shell (SSH). Disabling this root user via SSH makes it harder for a bad actor to gain access to the system. Because the root user is created by default on every Linux server, bad actors already have half the information they need to log in to your server if the root user is enabled via SSH. This situation allows for brute-force SSH attacks until the password hash breaks.

I can understand why this feature is set by default on newly installed systems, but it should be disabled once the system is up, and accounts with sudo access have been created.

### Each user their own login

To avoid this situation, you should create a secondary user for when you need to log in and administer the system. Each user on the system should have their own login credentials for logging purposes. Depending on the actions that the user needs to perform, they might need sudo permission to complete administrative actions. 

## Use SSH-keys instead of passwords

SSH has a flexible authentication model that allows you to sign in using a number of different methods. The two most popular choices are password and SSH-key authentication.

Passwords are the default way to authenticate to almost everything, and while secure to a point they can often be guessed using brute-forcing or dictionary lists by simply trying multiple variations of common passwords. Password logins allow a potential intruder to continuously guess passwords until a successful combination is found. This is known as brute-forcing and can easily be automated by would-be attackers with modern tools.

SSH-keys, on the other hand, operate by generating a secure key pair. A public key is created as a type of test to identify a user. It can be shared publicly without issues, and cannot be used for anything other than identifying a user and allowing login to the user with the matching private key. The private key should be kept secret and is used to pass the test of its associated public key.

The public key can only be used to identify the user who has the private part of the pair.

The private key must be kept safe, ensuring that only you have access to it.

To be more secure disable password authentication for users.

## Generate an SSH key pair

To create an SSH key pair to use with the user that you previously created. These instructions work with any Linux distribution.

Run the following command to generate a key pair on your local Linux, Mac®, or Windows 10 computer. When asked where to save the key, use the default location. Adding a password is more secure and strongly recommended, Use ssh Agent to make authentication more convenient. Both Windows 10, Mac, and Linux have excellent ssh-agent tools.

`ssh-keygen -t rsa -b 4096 -a 100`

To specify the ssh key file name

`ssh-keygen -t rsa -b 4096 -a 100 -f kobor_rsa`

This operation creates two files. The default names are id_rsa for your private key and id_rsa.pub for your public key.

After you have created the key pair on your local computer, upload the public key to your remote server for the user that you created previously.

Warning: Be sure to upload the public key, and not the private key.

`ssh-copy-id -i ~/.ssh/id_rsa.pub {username}@{remotePublicIPAddress}`

## SSH configuration options

SSH uses port 22 by default for communication. Bad actors try port 22 with the username root on every server that they attack. For this reason, disabling the root user via SSH and changing SSH to listen on a nonstandard port helps prevent a breach.

Changing the port won’t stop a determined intruder, but it does cause most superficial scans for SSH connection opportunities to overlook your server. Similarly, removing SSH access for the root user interferes with casual brute-force attacks via SSH.

I realize that many people will argue with me that **“Security Through Obscurity”** is not a true defense tactic, but I beg to differ. It should never be your only defense, but if it is one of many, why not? -- Tanya Janca @shehackspurple

## Listen on only one internet protocol

The SSH daemon listens for incoming connections over both IPv4 and IPv6 by default. Unless you need to SSH into your VM using both protocols, disable whichever you do not need. This does not disable the protocol system-wide, it is only for the SSH daemon. Depending on the Linux distribution, the line AddressFamily may need to be added, or uncommented.

Use the option:
```
AddressFamily inet to listen only on IPv4.
AddressFamily inet6 to listen only on IPv6.
```

`sudo nano /etc/ssh/sshd_config`

```
#Port 22
#PermitRootLogin yes
PasswordAuthentication yes

To:

Port 2233
PermitRootLogin no
PasswordAuthentication no
AddressFamily inet
```
Replace 2233 with the port you want to use


### References and Recommended Reading
- https://docs.rackspace.com/support/how-to/linux-server-security-best-practices/
- https://www.linode.com/docs/guides/securing-your-server/
- https://www.digitalocean.com/community/tutorials/an-introduction-to-securing-your-linux-vps
- https://dev.to/azure/pushing-left-like-a-boss-part-3-secure-design-4dm6
