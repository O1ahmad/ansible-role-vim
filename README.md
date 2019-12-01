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

None

Role Variables
--------------
Variables are available and organized according to the following software & machine provisioning stages:
* _install_
* _config_

#### Install

`vim`can be installed using OS package management systems provided by the supported platforms (e.g `apt`, `yum/dnf`).

_The following variables can be customized to control various aspects of this installation process:_

`package_name: <package-name-and-version>` (**default**: *vim-enhanced*[-latest])
- name and version of the vim package to download and install. [Reference](http://fr2.rpmfind.net/linux/rpm2html/search.php?query=vim&submit=Search+...&system=&arch=) or run something like `dnf --showduplicates list vim(-enhanced)` in a terminal to display a list of available packages for your platform

#### Config

Using this role, configuration of either a globally scoped or per-user scope of `vim` is managed with the `vimrc_config` user variable and can be expressed within a hash, keyed by user account. The value of these user account keys are either dicts, list of dicts or a combination thereof (set according to operator yaml syntax and customization preferences). Each represents associated vim startup/configuration commands as well as an `optional` comment.

The following provides an overview and example configurations for reference:

`[vimrc_config:  {global | user-account} : {entry} :] comment: <string>` (**default**: see *none*)
- [optional] comment associated with configuration command

##### Example

 ```yaml
  vimrc_config:
    global:
      - comment: "This comment provides context around the command(s) below. In this case, enable syntax-highlighting."
        commands:
          - syntax: "enable"
  ```
  
  The above configuration setting will be rendered within the globally scoped `vimrc` configuration file with surrounding [comment fold markings](http://vimdoc.sourceforge.net/htmldoc/fold.html#folds) like so:
  
  ```bash
 " This comment provides context around the command(s) below. In this case, enable syntax-highlighting {{{
 syntax enable
 " }}}
  ``` 

`[vimrc_config:  {global | user-account} : {entry} :] commands: <key: value,...>` (**default**: see `defaults/main.yml`)
- a collection of configuration commands to render within the specified *account's* vimrc config. A list of available commands can be found [here](https://vimhelp.org/usr_05.txt.html#usr_05.txt)

**Typically each key:value pair represents the `{command}: {flags}` components of a vim command respectively:**

 ```yaml
  vimrc_config:
    global:
      - comment: "advanced searching settings"
        commands:
          # {command}: {flags} format
          - set: "incsearch"
          - set: "hlsearch"
          - set: "ignorecase"
          - set: "smartcase"
          - set: "showmatch"
  ```
  
However, technically any splitting of the vim command syntax is allowed and should result in the correct rendering of the desired configuration:

 ```yaml
  vimrc_config:
    user-account-1:
      - commands:
          - set: "wildmenu"
          - filetype indent: "on"
        comment: "adjust UI settings"
      -  comment: "re-bind certain movements"
         commands:
          - "": "nnoremap B ^"
            "nnoremap E $": ""
  ```

Dependencies
------------

None

Example Playbook
----------------
default example:
```
- hosts: all
  roles:
  - role: 0xOI.vim
```

Install and manage a specific version:
```
- hosts: centos
  roles:
  - role: 0x0I.vim
    vars:
      package_name: "vim-enhanced-7.4.629-6"
```

Setup plugin installation:
```
- hosts: home
  roles:
  - role: 0x0I.vim
    vars:
      vimrc_config:
        user:
          - comment: "Enable Vundle plugin management and install my awesome plugins"
            commands:
              - "set": "rtp+=~/.vim/bundle/Vundle.vim"
              - "call": "vundle#begin()"
              - "Plugin": "'VundleVim/Vundle.vim'"
              - "Plugin": "'scrooloose/nerdtree'"
              - "Plugin": "'vim-syntastic/syntastic'"
              - "Plugin": "'rking/ag.vim'"
              - "Plugin": "'ctrlpvim/ctrlp.vim'"
              - "Plugin": "'sjl/gundo.vim'"
              - "call": "vundle#end()"
```

Apply sensible vim UI customizations:
```
- hosts: dev
  roles:
  - role: 0x0I.vim
    vars:
      vimrc_config:
        user:
          - comment: "adjust leader shortcut and common dotfile editing macros"
            commands:
              - "let": 'mapleader=","'
              - "set": "cursorline"
              - "nnoremap": "<leader>ev :vsp $MYVIMRC<CR>"
              - "nnoremap": "<leader>sv :source $MYVIMRC<CR>"
              - "nnoremap": "<leader>eb :vsp ~/.bashrc<CR>"
              - "nnoremap": "<leader>sb :source ~/.bashrc<CR>"
              - "nnoremap": "<leader>a :Ag"
              - "nnoremap": "<leader>u :GundoToggle<CR>"
          - comment: "re-define movement keys for easier navigation"
            commands:
              - "nnoremap": "j gj"
              - "nnoremap": "k gk"
              - "nnoremap": "B ^"
              - "nnoremap": "E $"
```
License
-------

Apache, BSD, MIT

Author Information
------------------

This role was created in 2019 by O1.IO.
