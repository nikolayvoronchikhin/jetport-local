# jetport-local

Create development VM using vagrant and install required software using ansible to initialize complete development environment.


## Installation

Install [Virtualbox](https://www.virtualbox.org/wiki/Downloads)

Install [Vagrant](http://www.vagrantup.com/downloads.html)

Clone [jetport-local](https://github.com/kenjones-cisco/jetport-local):

```bash
        git clone git@github.com:kenjones-cisco/jetport-local.git
```

Run Vagrant:

```bash
        # takes about 15 minutes
        vagrant up
```

Login to VM:

```bash
        vagrant ssh
        # ssh vagrant@localhost:2222
        # password: *vagrant*
```

### Verification

Change to user `jetport`:

```bash
        su jetport
        # password: *jetport.123*
```

Verify environment:

```bash
        cd /opt/stack
        source bin/activate
        cd jetport
        tox
```

### For Developers

**Do the following after completing steps above**

Copy private/public SSH keys [*(How to create SSH keys)*](https://help.github.com/articles/generating-ssh-keys):

```bash
        cp ~/.ssh/id_rsa* provision/roles/developer/files/
```

Set the environment variable `DEV_MODE` of your local OS to 1 or '1':

```bat
        REM works for Windows
        set DEV_MODE=1
```

```bash
        # works for Linux and Mac
        DEV_MODE=1
```

Reload VM:

```bash
        vagrant reload --provision
```

Now there will exist a directory two levels up from jetport-local
with the following name: `../../cloud/jetport`

It is a shared directory with the VM. This is the corresponding location on your VM: `/home/USER/projects/cloud/jetport`.

You can `su USER` and password defaults to `jetport.123`. From there you can run
tox or other commands against the project. And all changes from inside the VM or on host
machine will be reflected in both directions.

Observe your local machine. The `jetport` directory within the clone of jetport-local
initially had nothing inside; it should now have the entire jetport backend project.

Congratulations!
