Ansible Role :art: :memo: Vim
=========
[![Galaxy Role](https://img.shields.io/ansible/role/44928.svg)](https://galaxy.ansible.com/0x0I/vim)
[![Downloads](https://img.shields.io/ansible/role/d/44928.svg)](https://galaxy.ansible.com/0x0I/vim)
[![Build Status](https://travis-ci.org/0x0I/ansible-role-vim.svg?branch=master)](https://travis-ci.org/0x0I/ansible-role-vim)

**Table of Contents**
  - [Supported Platforms](#supported-platforms)
  - [Requirements](#requirements)
  - [Role Variables](#role-variables)
      - [Install](#install)
      - [Config](#config)
      - [Launch](#launch)
  - [Dependencies](#dependencies)
  - [Example Playbook](#example-playbook)
  - [License](#license)
  - [Author Information](#author-information)

Ansible role that installs and configures vim (vi-Improved), a powerful and flexible text editor
and development environment.

##### Supported Platforms:
```
* Debian
* Redhat(CentOS/Fedora)
* Ubuntu
```

Requirements
------------

...*description of provisioning requirements*...

Role Variables
--------------
Variables are available and organized according to the following software & machine provisioning stages:
* _install_
* _config_
* _launch_

#### Install

...*description of installation related vars*...

#### Config

...*description of configuration related vars*...

#### Launch

...*description of service launch related vars*...

Dependencies
------------

...*list dependencies*...

Example Playbook
----------------
default example:
```
- hosts: all
  roles:
  - role: 0xOI.vim
```

License
-------

Apache, BSD, MIT

Author Information
------------------

This role was created in 2019 by O1.IO.
