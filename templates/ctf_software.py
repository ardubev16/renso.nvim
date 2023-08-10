#!/usr/bin/env python3

from pwn import *

binary, host, port = "./pwnme.exe", "127.0.0.1", 1337

# Setup #######################################################################
context.update(arch="amd64", os="linux")
context.terminal = ["tmux", "splitw", "-h"]

context.binary = elf = ELF(binary, checksec=False)
if args.REMOTE:
    p = remote(host, port)
else:
    p = process(elf.path, aslr=False)
###############################################################################

{{_cursor_}}


p.interactive()
