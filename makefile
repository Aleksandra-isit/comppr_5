all:	labno1 labno2 labno3 

labno1: 1.1 1.2 1.3

1.1:
	gcc -o lab1_1.exe D:\comppr\labno1\1.1\1.c
1.2:
	gcc -o lab1_2.exe D:\comppr\labno1\1.2\2.c D:\comppr\labno1\1.2\Input_Output_array.c D:\comppr\labno1\1.2\Processing.c
1.3:
	gcc -o lab1_3.exe D:\comppr\labno1\1.3\3.c D:\comppr\labno1\1.3\Input_Output_array.c D:\comppr\labno1\1.3\func.c

labno2: 2.1 2.2 2.3

2.1: 
	gcc -o lr2no1.exe D:\comppr\labno2\2.1\1.c
2.2: 
	gcc -o lr2no2.exe D:\comppr\labno2\2.2\2.c
2.3: 
	gcc -o lr2no3.exe D:\comppr\labno2\2.3\3.c D:\comppr\labno2\2.3\InputStr.c

labno3:
.PHONY : all 
all : main 
lib1 : 
	gcc -c -o Obr1.o -fPIC D:\comppr\labno3\Obr1.c 
	gcc -shared -o lib1.dll D:\comppr\labno3\Obr1.c
lib2 : 
	gcc -c -o Obr2.o -fPIC D:\comppr\labno3\Obr2.c
	gcc -shared -o lib2.dll D:\comppr\labno3\Obr2.c 
Load :
	gcc -c -o Load.o -fPIC D:\comppr\labno3\Load.c
	gcc -shared -o Load.dll Load.o
main : Load lib1 lib2
	gcc -c -o 1.o -fPIC D:\comppr\labno3\main.c
	gcc -o main.exe 1.o -L./ -lLoad



