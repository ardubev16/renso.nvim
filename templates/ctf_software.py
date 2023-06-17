#!/usr/bin/env python3

from pwn import *

binary, host, port = "./pwnme.exe", "127.0.0.1", 1337

# Setup #######################################################################
context.update(arch="amd64", os="linux")
context.terminal = ["tmux", "splitw", "-h"]

# fmt: off
# shortcuts
def logbase(): log.info("libc base = %#x" % libc.address)
def logleak(name, val):  log.info(name+" = %#x" % val)
def sa(delim, data): return p.sendafter(delim, data)
def sla(delim, line): return p.sendlineafter(delim, line)
def sl(line): return p.sendline(line)
def rcl(): return p.recvline()
def rcu(d1, d2=0):
    p.recvuntil(d1, drop=True)
    # return data between d1 and d2
    if (d2):
        return p.recvuntil(d2, drop=True)
# fmt: on

context.binary = elf = ELF(binary, checksec=False)
if args.REMOTE:
    p = remote(host, port)
else:
    p = process(elf.path, aslr=False)
###############################################################################

{{_cursor_}}


p.interactive()
