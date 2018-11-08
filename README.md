phpdevtools script installer
===

This is a simple provisioning structure that installs devsoul.phpdevtools

Requirements
---
  - `ansible > 2.0`
  - `php >= 7.1`

Clone the repo & run the installer
---
    git clone git@github.com:devsoul/phpdevtools-installer.git phpdevtools-installer
    cd phpdevtools-installer
    make install

Delete the installed phpdevtools
---
    make remove

Reinstall phpdevtools
---

    make reinstall

Check if the suite is installed:
---
    ls -lt /usr/local/bin | head -20

Please visit https://github.com/devsoul/ansible-role-phpdevtools and get list of the supported php tools

License
---
MIT

Author Information
---

:-)
