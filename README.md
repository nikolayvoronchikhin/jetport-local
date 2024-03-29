# jetport-local

Create development VM using Vagrant and install required software using
Ansible to initialize complete development environment.

## Installation

Install [Virtualbox](https://www.virtualbox.org/wiki/Downloads)

Install [Vagrant](http://www.vagrantup.com/downloads.html)

Clone [jetport-local](https://github.com/kenjones-cisco/jetport-local):

```bash
    git clone git@github.com:kenjones-cisco/jetport-local.git
```

Get into the cloned directory and run Vagrant:

```bash
    cd jetport-local

    # takes about 15 minutes
    vagrant up
```

Login to VM:

```bash
    vagrant ssh
    # ssh vagrant@localhost -p 2222
    # password: *vagrant*
```

```bash
    # just execute once on local
    cat << EOF > ~/.ssh/config
    HOST jetport
        Hostname localhost
        Port 2222
        User vagrant
    EOF

    # easy from now on
    ssh jetport
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
    export DEV_MODE=1
```

Reload VM:

```bash
    vagrant reload --provision
```

There should now be a directory two levels up from jetport-local
with the name `../../cloud/jetport`. It is a shared directory with
the VM, and the corresponding location on your VM is
`/home/USER/projects/cloud/jetport`.

*(This is only possible because `DEV_MODE` is set to 1. Make sure to
always set `DEV_MODE` to 1. Otherwise, the shared folder functionality
will not remain)*

From there you can run tox or other commands against the project. And all changes
from inside the VM or on host machine will be reflected in both directions. To execute
these commands, you do not want to be user `vagrant`. There are a couple users to choose
from:

- `USER` and password defaults to `jetport.123`
- `jetport` and password defaults to `jetport.123`
- `root` and password defaults to `vagrant`

Observe your local machine. The `jetport` directory within
the clone of jetport-local initially had nothing inside; it should now
have the entire Jetport backend project.

Congratulations!
