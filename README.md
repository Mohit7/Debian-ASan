# Debian-ASan

The goal of this project is to rebuild the entire Debian repository with Asan.

Its a further part of previous GSoC projects:
- clang support for build services
- Debian built with clang

So what is ASan:
AddressSanitizer (aka ASan) is a memory error detector for C/C++.
It finds:
ASan is one of the sanitizers provided by compiler-rt project. Its a fast memory
error detector, which can detect various bugs like:
Out-of-bounds accesses to heap, stack and globals
Use-after-free
Use-after-return (to some extent)
Double-free, invalid free
Memory leaks (experimental)

We are using new Sanitize feature added in dpkg-upload 1.18.0, to add asan filter
while building the code.

Results:

1) Compile-time errors:
   We got 121 FTBFS while building archive with ASan flag.
   List is at compiletime_failures.list

2) Run time errors:
   We tried to install and run every ASan build binary, and found many run time 
   errors, which are listed at runtime_failures.list
   For details, dumps are at runtime_failures.dump.  


