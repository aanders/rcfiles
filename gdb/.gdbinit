# ~/.gdbinit
#
# GDB initialization

# MACROS

define xxd
  dump binary memory /tmp/gdb.bin ((char *)($arg0)) ((char *)($arg0) + ($arg1))
  shell xxd /tmp/gdb.bin
end
document xxd
Dump a section of memory in the format used by xxd.
Usage: xxd POINTER SIZE

POINTER must be convertible to pointer-to-char.
end
