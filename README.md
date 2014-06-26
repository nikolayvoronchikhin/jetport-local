# jetport-local

Create development VM using vagrant and install required software using ansible to initialize complete development environment.


## How to use

Install Virtualbox:

        https://www.virtualbox.org/wiki/Downloads


Install Vagrant:

        http://www.vagrantup.com/downloads.html


Clone jetport-local:

        git clone git@github.com:kenjones-cisco/jetport-local.git


Copy private/public SSH keys [*(How to create SSH keys)*](https://help.github.com/articles/generating-ssh-keys):

        cp ~/.ssh/id_rsa* provision/roles/jetport/files/




Run Vagrant:

        vagrant up


Login to VM:

        ssh vagrant@localhost:2222

password: *vagrant*


Change to user `jetport`:

        su jetport

password: *jetport.123*


Verify environment:

        cd /opt/stack
        source bin/activate
        cd jetport
        python setup.py develop
        tox

Back on your local machine if you look into what was an empty `jetport` directory within clone of jetport-local
should now have the entire jetport backend project.

Congratulations!


