# Cubes OS for Termux

Cubes OS is an experimental freestanding AArch64 kernel project developed from Termux on a non-rooted Android phone, using Rust and AArch64 assembly.

> **Status: early development.** This repository is source code, not a bootable Samsung firmware image. The initial kernel has not been tested on physical hardware. Do not flash it to a phone.

## Goals

- Develop a freestanding AArch64 kernel in Rust (`no_std`) with a small assembly entry point.
- Build and inspect an ELF image using free Termux packages.
- Add a reproducible build workflow.
- Research a supported boot protocol before attempting hardware startup.
- Eventually write a first-stage bootloader where the target platform permits it.

## Important hardware limitation

A normal non-rooted Android app cannot take control of the phone during startup. Samsung devices use a device-specific secure boot chain, firmware, memory map, and bootloader policy. Compiling an AArch64 ELF does **not** make it bootable on the phone. No bootloader unlocking, flashing, or partition modification is part of the initial steps.

## Build in Termux

Install tools (free):

```sh
pkg update
pkg install rust clang lld binutils git
```

Clone and build:

```sh
git clone https://github.com/CubeHub-studio/Cubes-OS-termux.git
cd Cubes-OS-termux
rustup target add aarch64-unknown-none
cargo build --release
```

If the target is not available from the installed Rust distribution, stop and check `rustc --version` and `rustup target list` rather than substituting a Linux target.

## Current milestone

The first milestone is a freestanding AArch64 ELF with an assembly `_start` symbol and a Rust `rust_main` entry. It is a **build artifact only**, not a complete bootable kernel. The provisional linker address must be replaced after a real boot protocol and memory layout are confirmed.

## License

MIT. See [LICENSE](LICENSE).
