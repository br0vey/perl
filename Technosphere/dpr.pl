#!/usr/bin/perl
{use strict; use DDP;}  # использовать модуль data printer
my $fd; # объявляем пременную для чтения данных из файла
my @m; # обявляем первый массив
my @mm; # обявляем  массив массивов
open F, '2.txt' or die;# открываем файл 2.txt не открывает останавливаемся
while(<F>)#цикл по содержимому файла
{#начальная скобка цикла
$fd=<F>;# присваиваем заничение строки из файла переменной
chomp $fd;# отрубаем символ конец строки у переменной куда записали перую строку из файла
@m=split(/:/);# в массив @m запихиваем данные из переменной $fd разделитель значений двоеточие
push @mm, @m;# наполнение масива массивов @mm данным из массива @m
}#конечная скобка цикла
print p @mm;# выводим на печать массив массивов с использованием data printer
close F; # закрываем файл 

