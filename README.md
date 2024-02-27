# ACT3 Homebrew Tap

This repository contains the ACT3 Homebrew Tap and Formulae.

## Prerequisites

- [Homebrew installed](https://brew.sh/)
- [Git installed](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

### Authentication

ACT3 developers must complete the following authentication prerequisites to install formulae:

- Git authentication for the ACT3 GitLab
  - Needed for cloning/fetching packages for Git-based formulae
  - Satisfied with Git SSH or HTTPS credentials
- Registry authentication for the ACT3 GitLab Container Registry
  - Needed for downloading packages for registry-based formulae
  - Satisfied by `docker login reg.git.act3-ace.com` or equivalent registry login (`oras`/`crane`/`podman`/etc)

## Usage

Add this tap by running:

```sh
brew tap act3-ace/tap
```

> Verify that the tap has been added by running the command `brew tap` and confirming that `act3-ace/tap` is in the list

### Installing Formulae

Once the tap is added to Homebrew, you can install an ACT3 formula by running `brew install <formula-name>`.

Example:

```sh
# Install ACE Data Tool
brew install ace-dt
```

### Commands

The ACT3 Homebrew Tap defines some utility commands for ACT3 developers using [Homebrew's External Commands feature](https://docs.brew.sh/External-Commands).

#### Install ASCE Tools

The `install-asce-tools` command installs [ASCE Tools](https://github.com/act3-ace/aceup/tree/main/asce-tools):

```sh
brew install-asce-tools

# Add the --vscode option to install common VS Code extensions
brew install-asce-tools --vscode
```

> ASCE Tools Documentation: [ACEup/asce-tools](https://github.com/act3-ace/aceup/tree/main/asce-tools)
>
> List of included software: [ASCE Tools Packages](https://github.com/act3-ace/aceup/tree/main/asce-tools#packages)

#### Run ACT3 Login

The `run-act3-login` command is a shortcut for running [ACT3 Login](https://github.com/act3-ace/aceup/tree/main/act3-login/):

```sh
brew run-act3-login
```

## How to Contribute

**[Formula Author Guide](./docs/formula-author-guide.md)**: documentation for contributing formulae to the ACT3 Homebrew Tap

---

Approved for public release: distribution unlimited. Case Numbers: AFRL-2024-1030
