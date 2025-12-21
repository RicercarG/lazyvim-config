# My config for LazyVim

Tuned for writing python on remote server.

----

## Modified from: 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Get Started

### General Install

```
git clone https://github.com/RicercarG/lazyvim-config.git ~/.config/nvim
```

### HPC Tree Sitter Fix

#### Install cargo

Set path to scratch to avoid quota issues

```
echo 'export RUSTUP_HOME=/scratch/$USER/.rustup' >> ~/.bashrc
echo 'export CARGO_HOME=/scratch/$USER/.cargo' >> ~/.bashrc
```

Install cargo

```
curl https://sh.rustup.rs -sSf | sh
```

Activate cargo

```
echo 'source /scratch/$USER/cargo/env' >> ~/.bashrc
```

#### Install old version of tree-sitter

```
cargo install tree-sitter-cli --version 0.22.6
```
