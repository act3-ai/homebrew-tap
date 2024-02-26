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

#### Install ASCE Tools

The `install-asce-tools` command installs the recommended packages for ACT3 developers and ASCE users.

Install common tools with the `install-a` subcommand:

```sh
brew install-asce-tools

# Add the --vscode option to install common VS Code extensions
brew install-asce-tools --vscode
```

Software installed by the ASCE Tools command will be kept up-to-date with `brew upgrade`.

The following ACT3 softwares are installed by the `install-asce-tools` command:

- [ACE Data Tool](https://git.act3-ace.com/ace/data/tool)
- [ACT3 Project Tool](https://git.act3-ace.com/devsecops/act3-pt)
- [ACE Kubectl Plugins](https://git.act3-ace.com/ace/kubectl-plugins)
- [ACE Hub User Proxy script](https://git.act3-ace.com/ace/hub/user-proxy)
- [CAC Utils](https://git.act3-ace.com/devsecops/cac-utils)

The following third-party tools are installed by the `install-asce-tools` command:

- [Container Structure Tests](https://formulae.brew.sh/formula/container-structure-test#default)
- [crane](https://formulae.brew.sh/formula/crane#default)
- [direnv](https://formulae.brew.sh/formula/direnv#default)
- [Git LFS](https://formulae.brew.sh/formula/git-lfs#default)
- [glab](https://formulae.brew.sh/formula/glab#default)
- [Helm](https://formulae.brew.sh/formula/helm#default)
- [Helmfile](https://formulae.brew.sh/formula/helmfile#default)
- [K9s](https://formulae.brew.sh/formula/k9s#default)
- [kind](https://formulae.brew.sh/formula/kind#default)
- [Krew](https://formulae.brew.sh/formula/krew#default)
- [kubectl](https://formulae.brew.sh/formula/kubernetes-cli#default)
- [Kustomize](https://formulae.brew.sh/formula/kustomize#default)
- [oras](https://formulae.brew.sh/formula/oras#default)
- [Podman](https://formulae.brew.sh/formula/podman#default)
- [Skaffold](https://formulae.brew.sh/formula/skaffold#default)
- [websocat](https://formulae.brew.sh/formula/websocat#default)
- [yq](https://formulae.brew.sh/formula/yq#default)

The following VS Code extensions are installed by the `install-asce-tools` command with the `--vscode` option:

- [`DavidAnson.vscode-markdownlint`](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)
- [`GitHub.remotehub`](https://marketplace.visualstudio.com/items?itemName=GitHub.remotehub)
- [`GitHub.vscode-pull-request-github`](https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-pull-request-github)
- [`GitLab.gitlab-workflow`](https://marketplace.visualstudio.com/items?itemName=GitLab.gitlab-workflow)
- [`Gruntfuggly.todo-tree`](https://marketplace.visualstudio.com/items?itemName=Gruntfuggly.todo-tree)
- [`James-Yu.latex-workshop`](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)
- [`Remisa.shellman`](https://marketplace.visualstudio.com/items?itemName=Remisa.shellman)
- [`bierner.markdown-mermaid`](https://marketplace.visualstudio.com/items?itemName=bierner.markdown-mermaid)
- [`eamodio.gitlens`](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
- [`ecmel.vscode-html-css`](https://marketplace.visualstudio.com/items?itemName=ecmel.vscode-html-css)
- [`esbenp.prettier-vscode`](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
- [`exiasr.hadolint`](https://marketplace.visualstudio.com/items?itemName=exiasr.hadolint)
- [`foxundermoon.shell-format`](https://marketplace.visualstudio.com/items?itemName=foxundermoon.shell-format)
- [`hediet.vscode-drawio`](https://marketplace.visualstudio.com/items?itemName=hediet.vscode-drawio)
- [`jeff-hykin.better-dockerfile-syntax`](https://marketplace.visualstudio.com/items?itemName=jeff-hykin.better-dockerfile-syntax)
- [`jinliming2.vscode-go-template`](https://marketplace.visualstudio.com/items?itemName=jinliming2.vscode-go-template)
- [`mindaro.mindaro`](https://marketplace.visualstudio.com/items?itemName=mindaro.mindaro)
- [`ms-azuretools.vscode-docker`](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
- [`ms-kubernetes-tools.vscode-kubernetes-tools`](https://marketplace.visualstudio.com/items?itemName=ms-kubernetes-tools.vscode-kubernetes-tools)
- [`ms-python.python`](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
- [`ms-python.vscode-pylance`](https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance)
- [`ms-toolsai.jupyter`](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter)
- [`ms-vscode-remote.vscode-remote-extensionpack`](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)
- [`ms-vscode.cmake-tools`](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cmake-tools)
- [`ms-vscode.cpptools`](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)
- [`ms-vscode.live-server`](https://marketplace.visualstudio.com/items?itemName=ms-vscode.live-server)
- [`ms-vscode.remote-explorer`](https://marketplace.visualstudio.com/items?itemName=ms-vscode.remote-explorer)
- [`ms-vsliveshare.vsliveshare`](https://marketplace.visualstudio.com/items?itemName=ms-vsliveshare.vsliveshare)
- [`njpwerner.autodocstring`](https://marketplace.visualstudio.com/items?itemName=njpwerner.autodocstring)
- [`peterj.proto`](https://marketplace.visualstudio.com/items?itemName=peterj.proto)
- [`redhat.vscode-yaml`](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml)
- [`shd101wyy.markdown-preview-enhanced`](https://marketplace.visualstudio.com/items?itemName=shd101wyy.markdown-preview-enhanced)
- [`tamasfe.even-better-toml`](https://marketplace.visualstudio.com/items?itemName=tamasfe.even-better-toml)
- [`timonwong.shellcheck`](https://marketplace.visualstudio.com/items?itemName=timonwong.shellcheck)
- [`tomoki1207.pdf`](https://marketplace.visualstudio.com/items?itemName=tomoki1207.pdf)
- [`twxs.cmake`](https://marketplace.visualstudio.com/items?itemName=twxs.cmake)
- [`vincaslt.highlight-matching-tag`](https://marketplace.visualstudio.com/items?itemName=vincaslt.highlight-matching-tag)
- [`yzane.markdown-pdf`](https://marketplace.visualstudio.com/items?itemName=yzane.markdown-pdf)
- [`yzhang.markdown-all-in-one`](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)

## How to Contribute

**[Formula Author Guide](./docs/formula-author-guide.md)**: documentation for contributing formulae to the ACT3 Homebrew Tap

---

Approved for public release: distribution unlimited. Case Numbers: AFRL-2024-1030
