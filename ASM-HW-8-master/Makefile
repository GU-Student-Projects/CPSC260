all: run


compile:
	gcc -Og -g -o test sort_driver.c selection_sort_c.c selection_sort_asm.s  

test-asm: compile
	gdb ./test
link: compile
	ld sort_driver.o -o run

run: compile
	./test


build-flip:
	gcc -c -g flip_case.s

link-flip: build-flip
	ld flip_case.o -o flip

run-flip: link-flip
	 ./flip