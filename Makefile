CC = gcc
CFLAGS = -g -Wall

INCLUDES = -I/usr/local/include
LFLAGS=
LIBS = -lzmq

SRCS = mbpeer.c

OBJS = $(SRCS:.c=.o)

MAIN = mbpeer

.PHONY: depend clean

all:    $(MAIN)

$(MAIN): $(OBJS) 
	$(CC) $(CFLAGS) $(INCLUDES) -o $(MAIN) $(OBJS) $(LFLAGS) $(LIBS)

.c.o:
	$(CC) $(CFLAGS) $(INCLUDES) -c $<  -o $@

clean:
	$(RM) *.o *~ $(MAIN)

depend: $(SRCS)
	makedepend $(INCLUDES) $^
	
# DO NOT DELETE

mbpeer.o: /usr/include/stdio.h /usr/include/sys/cdefs.h
mbpeer.o: /usr/include/sys/_symbol_aliasing.h
mbpeer.o: /usr/include/sys/_posix_availability.h /usr/include/Availability.h
mbpeer.o: /usr/include/AvailabilityInternal.h /usr/include/_types.h
mbpeer.o: /usr/include/sys/_types.h /usr/include/machine/_types.h
mbpeer.o: /usr/include/i386/_types.h
mbpeer.o: /usr/include/sys/_pthread/_pthread_types.h
mbpeer.o: /usr/include/sys/_types/_va_list.h
mbpeer.o: /usr/include/sys/_types/_size_t.h /usr/include/sys/_types/_null.h
mbpeer.o: /usr/include/sys/stdio.h /usr/include/sys/_types/_off_t.h
mbpeer.o: /usr/include/sys/_types/_ssize_t.h /usr/include/secure/_stdio.h
mbpeer.o: /usr/include/secure/_common.h /usr/include/unistd.h
mbpeer.o: /usr/include/sys/unistd.h /usr/include/sys/_types/_posix_vdisable.h
mbpeer.o: /usr/include/sys/_types/_seek_set.h /usr/include/_types/_uint64_t.h
mbpeer.o: /usr/include/sys/_types/_uid_t.h /usr/include/sys/_types/_gid_t.h
mbpeer.o: /usr/include/sys/_types/_intptr_t.h
mbpeer.o: /usr/include/sys/_types/_pid_t.h
mbpeer.o: /usr/include/sys/_types/_useconds_t.h /usr/include/sys/select.h
mbpeer.o: /usr/include/sys/appleapiopts.h /usr/include/sys/_types/_fd_def.h
mbpeer.o: /usr/include/sys/_types/_timespec.h
mbpeer.o: /usr/include/sys/_types/_timeval.h
mbpeer.o: /usr/include/sys/_types/_time_t.h
mbpeer.o: /usr/include/sys/_types/_suseconds_t.h
mbpeer.o: /usr/include/sys/_types/_sigset_t.h
mbpeer.o: /usr/include/sys/_types/_fd_setsize.h
mbpeer.o: /usr/include/sys/_types/_fd_set.h /usr/include/sys/_types/_fd_clr.h
mbpeer.o: /usr/include/sys/_types/_fd_isset.h
mbpeer.o: /usr/include/sys/_types/_fd_zero.h
mbpeer.o: /usr/include/sys/_types/_fd_copy.h /usr/include/sys/_select.h
mbpeer.o: /usr/include/sys/_types/_dev_t.h /usr/include/sys/_types/_mode_t.h
mbpeer.o: /usr/include/sys/_types/_uuid_t.h /usr/include/gethostuuid.h
mbpeer.o: /usr/include/stdlib.h /usr/include/sys/wait.h
mbpeer.o: /usr/include/sys/_types/_id_t.h /usr/include/sys/signal.h
mbpeer.o: /usr/include/machine/signal.h /usr/include/i386/signal.h
mbpeer.o: /usr/include/machine/_mcontext.h /usr/include/i386/_mcontext.h
mbpeer.o: /usr/include/mach/i386/_structs.h
mbpeer.o: /usr/include/sys/_pthread/_pthread_attr_t.h
mbpeer.o: /usr/include/sys/_types/_sigaltstack.h
mbpeer.o: /usr/include/sys/_types/_ucontext.h /usr/include/sys/resource.h
mbpeer.o: /usr/include/stdint.h /usr/include/sys/_types/_int8_t.h
mbpeer.o: /usr/include/sys/_types/_int16_t.h
mbpeer.o: /usr/include/sys/_types/_int32_t.h
mbpeer.o: /usr/include/sys/_types/_int64_t.h /usr/include/_types/_uint8_t.h
mbpeer.o: /usr/include/_types/_uint16_t.h /usr/include/_types/_uint32_t.h
mbpeer.o: /usr/include/sys/_types/_uintptr_t.h
mbpeer.o: /usr/include/_types/_intmax_t.h /usr/include/_types/_uintmax_t.h
mbpeer.o: /usr/include/machine/endian.h /usr/include/i386/endian.h
mbpeer.o: /usr/include/sys/_endian.h /usr/include/libkern/_OSByteOrder.h
mbpeer.o: /usr/include/libkern/i386/_OSByteOrder.h /usr/include/alloca.h
mbpeer.o: /usr/include/sys/_types/_ct_rune_t.h
mbpeer.o: /usr/include/sys/_types/_rune_t.h
mbpeer.o: /usr/include/sys/_types/_wchar_t.h /usr/include/machine/types.h
mbpeer.o: /usr/include/i386/types.h /usr/include/string.h
mbpeer.o: /usr/include/sys/_types/_rsize_t.h
mbpeer.o: /usr/include/sys/_types/_errno_t.h /usr/include/strings.h
mbpeer.o: /usr/include/secure/_string.h /usr/include/stdbool.h
mbpeer.o: /usr/include/assert.h /usr/local/include/zmq.h /usr/include/errno.h
mbpeer.o: /usr/include/sys/errno.h /usr/include/stddef.h
mbpeer.o: /usr/include/sys/_types/_offsetof.h
mbpeer.o: /usr/include/sys/_types/_ptrdiff_t.h
mbpeer.o: /usr/include/sys/_types/_wint_t.h
