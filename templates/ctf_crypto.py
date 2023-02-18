#!/usr/bin/env python3

from pwn import *
from Crypto.Util.Padding import pad, unpad
from Crypto.Util.number import *


# Setup #######################################################################
if args["REMOTE"]:
    io = remote("127.0.0.1", 1337)
else:
    io = process("./decryptme.py")
###############################################################################

{{_cursor_}}


io.interactive()
