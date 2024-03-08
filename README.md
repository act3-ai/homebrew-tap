# ACT3 Homebrew Tap

The ACT3 Homebrew Tap repository contains Homebrew formulae for installing ACT3 software packages.

## Prerequisites

- [Homebrew installed](https://brew.sh/)
- Registry authentication for `reg.git.act3-ace.com`, the ACT3 Container Registry
  - Satisfied by `docker login reg.git.act3-ace.com` or equivalent registry tool login (`oras`/`crane`/`podman`/etc)

> [!TIP]
>
> Running [ACT3 Login](https://gitlab.com/act3-ai/asce/up/-/blob/main/act3-login/README.md#run-act3-login) verifies these prerequisites and satisfies the authentication requirement.

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

> [!TIP]
>
> Install formulae without adding the tap by adding the prefix `act3-ai/tap/`:
>
> ```sh
> brew install act3-ai/tap/ace-dt
> ```

### Commands

The ACT3 Homebrew Tap defines some utility commands for ACT3 developers using [Homebrew's External Commands feature](https://docs.brew.sh/External-Commands).

#### Install ASCE Tools

The `asce-tools` command installs [ASCE Tools](https://gitlab.com/act3-ai/asce/up/-/tree/main/asce-tools):

```sh
brew asce-tools

# Add the --vscode option to install common VS Code extensions
brew asce-tools --vscode
```

> List of included software: [ASCE Tools Packages](https://gitlab.com/act3-ai/asce/up/-/tree/main/asce-tools#packages)

#### Run ACT3 Login

The `act3-login` command is a shortcut for running [ACT3 Login](https://gitlab.com/act3-ai/asce/up/-/tree/main/act3-login/):

```sh
brew act3-login
```

## How to Contribute

**[Formula Author Guide](./docs/formula-author-guide.md)**: documentation for contributing formulae to the ACT3 Homebrew Tap

## Support

- **[Troubleshooting FAQ](docs/troubleshooting-faq.md)**: consult list of frequently asked questions and their answers
- **[Create a Support Ticket issue](https://github.com/act3-ai/homebrew-tap/issues/new)**: create a support ticket on the ACT3 Homebrew Tap GitHub project
- **[Mattermost channel](https://chat.git.act3-ace.com/act3/channels/devops)**: create a post in the DevOps channel for assistance

---

Approved for public release: distribution unlimited. Case Numbers: AFRL-2024-1030
