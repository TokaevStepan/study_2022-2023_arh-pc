%include 'in_out.asm' ; подключение внешнего файла
SECTION .data
div: DB 'Результат: ',0
rem1: DB 'Введите х: ',0
rem2: DB '𝑥^3 * 1/3 + 21',0
SECTION .bss
x: RESB 80
SECTION .text
GLOBAL _start
_start:

mov eax, rem2
call sprintLF
mov eax, rem1
call sprint
mov ecx, x
mov edx, 80
call sread
mov eax,x ; вызов подпрограммы преобразования
call atoi 

mov ebx,eax ; 
mul ebx ; EAX=EAX*EBX
mul ebx
mov ebx, 1
mul ebx
xor edx,edx ; обнуляем EDX для корректной работы div
mov ebx,3 ; 
div ebx ; 
mov edi,eax ; запись результата вычисления в 'edi'

add edi, 21
; ---- Вывод результата на экран
mov eax,div ; вызов подпрограммы печати
call sprint ; сообщения 'Результат: '
mov eax,edi ; вызов подпрограммы печати значения
call iprintLF ; из 'edi' в виде символов
call quit ; вызов подпрограммы завершения
