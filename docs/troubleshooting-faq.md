# Troubleshooting & FAQ

## Troubleshooting

If you are seeing the following error, the legacy version of the ACT3 Homebrew Tap must be removed from Homebrew.

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
