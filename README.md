# Nix dotfiles

This repository is intended to describe my NixOS systems and personal environment
declaratively, so I can recreate them on another machine from Git.

## Goals

- Have the same applications, package versions, and application configuration
  across my machines where supported. For example, a change to Git or its
  configuration should be reproducible on another machine after pulling the
  updated repository and rebuilding.
- Keep packages, system settings, and application configuration in version
  control. Use `flake.lock` to pin inputs, and share the repository through
  GitHub.
- Make applying the same configuration repeatedly safe and predictable.
- Support different machines and hardware: share personal configuration, but
  keep hardware-specific settings, boot configuration, filesystems, and other
  host-specific choices separate.
- Use Nixpkgs unstable for most software. Update its locked revision
  deliberately, and use separately pinned inputs only when an application needs
  a different update cadence or source.
- Follow XDG conventions for user configuration where practical.

The goal is a consistent, usable environment, not bit-for-bit identical
machines. Packages and versions must be available for the target platform, and
recreating a machine can involve downloads or builds.

## Scope and boundaries

Nix can declare system and application configuration, but this repository alone
does not back up documents, browser profiles, application logins, or other
mutable data. Those need a separate sync or backup strategy.

Do not commit plaintext secrets or put them in Nix expressions or files copied
into the Nix store. Secret management and provisioning keys for new machines
need a separate, secure solution.

## Current status

The existing NixOS configuration is exposed as a flake for the `E595` host.
Home Manager manages personal Git settings for `robin`; Git itself remains a
system-wide package. Repository-local Git settings take precedence over the
personal defaults.
Reusable multi-host configuration is planned but has not yet been migrated.

To build or activate the current configuration:

```sh
sudo nixos-rebuild build --flake ~/.config/nix-dotfiles#E595
sudo nixos-rebuild switch --flake ~/.config/nix-dotfiles#E595
```

The Nixpkgs input currently points to the exact revision used before the flake
migration. Changing it to track `nixos-unstable` and establishing an update
workflow are still planned.
