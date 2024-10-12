# Preface #

We have experienced that unix uniq is unique, because it doesn't do what its name suggests.

Let's say, we feed it with this input: a a b a c b b c c a b

we expected this result: a b c

and got this: a b a c b c a b

For a reason, bacause it is a member of the stream editor family, like an extension for 'sort'.

We were so impressed by this discovery, that we decided to reinvent the wheel.

# Goal #

This project maintains several implementations of the unix uniq utility, and beside the testing against the
original, it also measures the running time of each with different input sets. (yet to come...)

# Disclaimer #

The main and only target and testing platform of the project is x86-64 Linux.

# Implementations #

- [x] awk
- [x] elisp
- [x] lisp
- [x] python
- [x] sh/bash
- [ ] assembly
- [ ] brainfuck
- [ ] c/c++
- [ ] ecmascript
- [ ] go
- [ ] haskell
- [ ] perl
- [ ] php
- [ ] rust
- [ ] zig

# Build #

```
make
```

## Cleanup ##

```
make clean
```
