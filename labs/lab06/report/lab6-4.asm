%include 'in_out.asm' ; подключение внешнего файла
SECTION .data
div: DB 'Введите значение x: ',0
rem: DB 'Результат: ',0
SECTION .bss
x: RESB 80 ;
SECTION .text
GLOBAL _start
_start:
; ---- Вычисление выражения
mov eax,div ;
call sprint ;
mov ecx, x ;
mov edx, 80 ;
call sread ;
mov eax, x ;
call atoi ;
mov ebx, 2 ;
mul ebx ; eax = x*2
add eax, 10 ; eax = x*2 + 10
mov ebx, 3 ;
div ebx ; eax = (x*2+10)/3
mov edi,eax ;
; ---- Вывод результата на экран
mov eax,rem ; вызов подпрограммы печати
call sprint ; сообщения 'Результат: '
mov eax,edi ; вызов подпрограммы печати значения
call iprintLF ; из 'edx' (остаток) в виде символов
call quit ; вызов подпрограммы завершения