#!/usr/bin/env sh
cc=$(which clang-3.6||which gcc-4.9||which clang||which gcc)
so=$(test -f /etc/asl.conf && printf dylib|| printf so)
$cc "-Dinline=__attribute__((__always_inline__))" -D"memset_s(W,WL,V,OL)=memset(W,V,OL)" -O3 -march=native -std=c11 -Wextra -Wpedantic -Wall -fPIC  -c keccak-tiny.c -o libkeccak-tiny.o
#$cc -Os -march=native -std=c11 -Wextra -Wpedantic -Wall -fPIC -shared keccak-tiny.c -o libkeccak-tiny-small.$so
