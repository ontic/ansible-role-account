# Documentation

## Example

```
account_groups:
  - name: sudo
    system: yes
  - name: admin
    system: yes
    sudoer: true
  - name: www-data
    system: yes
  - name: vagrant
account_users:
  - name: vagrant
    createhome: yes
    sudoer: true
    group: vagrant
    groups:
      - sudo
      - www-data
    authorized_keys:
      - key: https://github.com/username.keys
  - name: johndoe
    remove: true
    state: absent
```

## Role Variables

Available variables are listed below, along with default values (see [defaults/main.yml](/defaults/main.yml)):

```
account_groups: []
```

The account groups you would like to manage. Each group supports all parameters from the
[group](http://docs.ansible.com/ansible/user_module.html) module. An additional parameter `sudoer` can be
specified, valid values are `true` or `false`. When defined and the value is `true` the group will be added to
the `/etc/sudoers` file, users belonging to that group will not need to provide a password when privileges need
to be elevated. If defined and the value is `false` the group will be removed from the `/etc/sudoers` file.

```
account_users: []
```

The account users you would like to manage. Each user supports all parameters from the
[user](http://docs.ansible.com/ansible/user_module.html) module. An additional parameter `sudoer` can be
specified, valid values are `true` or `false`. When defined and the value is `true` the user will be added to
the `/etc/sudoers` file, the user will not need to provide a password when privileges need to be elevated. If 
defined and the value is `false` the user will be removed from the `/etc/sudoers` file.

There's one more additional parameter `authorized_keys` available, where each key supports all parameters
from the [authorized_key](http://docs.ansible.com/ansible/authorized_key_module.html) module.

> The parameter `authorized_keys` is required and must be defined for every user in `account_users`
even when no keys are required. In that case, simply set `authorized_keys` to `[]`.