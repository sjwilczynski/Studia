Flags = -Wreturn-type -pedantic -pedantic-errors -Wundef -std=c++11
CPP = g++

main :  main.o stack.o  
	$(CPP) $(Flags) -o main   main.o stack.o 
main.o :   main.cpp   stack.h  
	$(CPP) -c $(Flags) main.cpp -o  main.o
stack.o :  stack.cpp   stack.h 
	$(CPP) -c $(Flags) stack.cpp -o  stack.o
