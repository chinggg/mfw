obj-m += mfw_module.o

remake:	uninstall clean install

uninstall:
	rmmod mfw_module.ko

install: oall ins
	mknod mfw_file c 100 0

oall:	mfw mfwmod

mfw:	mfw.c mfw.h
	gcc -Wall -o mfw mfw.c

mfwmod:	
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	rm -f mfw mfw_file
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

ins:
	insmod mfw_module.ko
