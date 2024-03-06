# Troubleshooting & FAQ

## Troubleshooting

See **[Homebrew's Troubleshooting page](https://docs.brew.sh/Troubleshooting)** to troubleshoot common Homebrew issues.

### Formula found in multiple taps

If you are seeing the following error, the legacy ACT3 Homebrew Tap (<https://git.act3-ace.com/ace/homebrew-ace-tools>) must be removed from Homebrew.

```sh
brew install act3-pt
==> Downloading <https://formulae.brew.sh/api/formula.jws.json>
-#O=#    #      #
Error: Formulae found in multiple taps:
       *act3-ai/tap/act3-pt
       * act3/ace-tools/act3-pt

Please use the fully-qualified name (e.g. act3-ai/tap/act3-pt) to refer to a specific formula.
```

Resolve the issue by running:

```sh
brew untap act3/ace-tools
```

## Support

- **[Create a Support Ticket issue](https://github.com/act3-ai/homebrew-tap/issues/new)**: create a support ticket on the ACT3 Homebrew Tap GitHub project
- **[Mattermost channel](https://chat.git.act3-ace.com/act3/channels/devops)**: create a post in the DevOps channel for assistance
