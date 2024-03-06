# ACT3 Homebrew Tap

The ACT3 Homebrew Tap repository contains Homebrew formulae for installing ACT3 software packages.

## Prerequisites

- [Homebrew installed](https://brew.sh/)
- Registry authentication for `reg.git.act3-ace.com`, the ACT3 Container Registry
  - Satisfied by `docker login reg.git.act3-ace.com` or equivalent registry tool login (`oras`/`crane`/`podman`/etc)

Running [ACT3 Login](https://github.com/act3-ace/aceup/blob/main/act3-login/README.md#run-act3-login) verifies these prerequisites and satisfies the authentication requirement.

## Usage

Add this tap by running:

```sh
brew tap act3-ai/tap
```

> Verify that the tap has been added by running the command `brew tap` and confirming that `act3-ai/tap` is in the list

### Installing Formulae

Once the tap is added to Homebrew, you can install an ACT3 formula by running `brew install <formula-name>`.

Example:

```sh
brew install ace-dt
```

> As a shortcut, users can install ACT3 formulae without adding the tap by running:
>
> ```sh
> brew install act3-ai/tap/ace-dt
> ```

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

## Support

- **[Troubleshooting FAQ](docs/troubleshooting-faq.md)**: consult list of frequently asked questions and their answers
- **[Create a Support Ticket issue](https://github.com/act3-ai/homebrew-tap/issues/new)**: create a support ticket on the ACT3 Homebrew Tap GitHub project
- **[Mattermost channel](https://chat.git.act3-ace.com/act3/channels/devops)**: create a post in the DevOps channel for assistance

---

Approved for public release: distribution unlimited. Case Numbers: AFRL-2024-1030
