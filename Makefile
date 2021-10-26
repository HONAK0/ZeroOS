
all:
	gcc -c kernel/kernel.c -o output/kernel.o -m32 -std=gnu99 -ffreestanding -O2 -Wall -Wextra
	nasm -felf32 boot/boot.asm - o output/boot.o
	gcc -m32 -T linker.ld -o output/zeroos.bin -ffreestanding -02 -nostdlib output/boot.o output/kernel.o -lgcc
	dd if=zeroos.bin of=zeroos.img conv=notrunc
	qemu-system-x86_64 -kernel output/zeroos.img

build: 
	gcc -c kernel/kernel.c -o output/kernel.o -m32 -std=gnu99 -ffreestanding -O2 -Wall -Wextra
	nasm -felf32 boot/boot.asm - o output/boot.o
	gcc -m32 -T linker.ld -o output/zeroos.bin -ffreestanding -02 -nostdlib output/boot.o output/kernel.o -lgcc
	dd if=zeroos.bin of=zeroos.img conv=notrunc

run:
	qemu-system-x86_64 -kernel output/zeroos.img