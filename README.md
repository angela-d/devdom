# Devdom Virtualhost Generator for Linux Desktop
###### *dev*elopment  *dom*ains

Devdom is a command-line tool that was inspired by the simplicity of Valet on Mac, so I wanted to bring the same functionality to my local development environment on Linux, without actually having to bring in any additional components like dnsmasq -- so it is in no way a replacement for the [Valet Linux Project](https://github.com/cpriego/valet-linux).


### Devdom is a beta release.

The "beta" state is what I originally sought to solve while writing it:
* Utilize a concise CLI command to generate local domains
* Automate the process as much as possible

Eventually I'd like to add more flexibility to the overall script, so those in production environments without access to automated management tools could utilize it.  In it's current state, I totally do not recommend using it on boxes that serve content to the outside world.  (It has not been tested for production environments.)

Devdom assumes a few things about your environment:
* You already have an active LAMP stack
* Devdom can only be ran with **root** or sudo/su access
* An SSL cert is already in place (self-signed works!)
* You're in a Debian/Ubuntu (or deriatives) environment


#### What does it do?
***
Instead of copying a bunch of existing conf files *or* going the lazy route and having all of your domains run under `https://localhost/devsite1` and `https://localhost/devsite2` - you can create custom top-level domains on the fly and have them instantly accessible.

`https://devsite1.test` is way better than `https://localhost/devsite1` and is easier to keep organized when jumping from domain to domain.


#### How does it work?
***
Create a domain:
```bash
devdom domain mysite.test
```
* Devdom goes through the system and generates .conf files in `/etc/apache2/sites-available`
* Enables the virtualhost with `a2ensite mysite` for you
* Adds entries in `/etc/hosts` so the domain is accessible as a TLD
* Also creates a hosts modifier, so if you regularly update your [Ad-blocking capabilities](https://github.com/StevenBlack/hosts), your dev environment won't be affected.


Updated /etc/hosts with a new Adblocking list?
```bash
devdom hosts
```


Uninstall:
```bash
devdom uninstall
```

That's it!  Seconds worth of commands vs several minutes worth of running cp & sed commands!


#### Want to help, or found a bug?
[Report a bug](../issues) on the issues tracker

[Project pipelne](../projects) for features planned