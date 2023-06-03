#!/usr/bin/env python3

from pwn import *


# Setup #######################################################################
context.binary = elf = ELF("./pwnme.exe", checksec=False)
context.kernel = "amd64"

rop = ROP(elf)

if args.REMOTE:
    io = remote("127.0.0.1", 1337)
else:
    io = elf.process()
    assert io
###############################################################################

{{_cursor_}}


io.interactive()
