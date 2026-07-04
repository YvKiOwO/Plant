# Plant

- A zero-bloat, open-source file transfer tool.

Plant is a lightweight wrapper for the wormhole-william engine, designed for speed and simplicity. It provides a clean interface for transferring files across any network without the unnecessary verbosity of standard transfer tools.

# Features
- Minimalist: Built with a custom x86_64 Assembly wrapper.
- Zero-Bloat: Removes standard output noise; provides a streamlined, consistent experience.
- Custom Engine: Ships with a patched wormhole-william binary.
- Fast: No shell overhead; execution is direct and immediate.

# Installation
!! Ensure you have `nasm`, `ld` and `go` installed !!
```
git clone https://github.com/YvKi/plant
cd plant
make
```

# Usage

- Once installed, use the `plant` command globally:
- Send a file:
` plant send <file> `
- Receive a file:
` plant recv <code> `

# Why Plant?

Inspired by the need for a transfer tool that respects the users terminal environment. no extra output, no unnecessary dependencies, just the file transfer.
