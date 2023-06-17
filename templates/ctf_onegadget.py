# fmt: off
# change -l0 to -l1 for more gadgets
def one_gadget(filename, base_addr=0):
    return [(int(i)+base_addr) for i in subprocess.check_output(['one_gadget', '--raw', '-l0', filename]).decode().split(' ')]
# fmt: on
