# Matrix base operations
# Задание - Паралельная обработка матриц на базе ПЛИС
Необходимо реализовать передачу заданных пользователем на компьютере базовых опреаций над матрицами.

Основная работа происходит в файле matrix_op. У нас есть 3 параметра, которые можно задавать в BDF: size, operation, length.
По порядку:
  1) size - размер матрицы size x size.
  2) operation - тип операции, базовые опрерации над матрицами - сложение (operation = 0), вычитание(op = 1), транспонирование(op = 2).
  3) length - длина в битах одного элемента матрицы.
  
Так как в Quartus недоступны массивы, которые можно использовать в ModelSim, и тем более матрицы, которые собой представляют двунаправленный массив, мы вынуждены искать другой путь. Мы выделим память для всех битов нашей матрицы (size * size * length) и будем работать с ними.

На вход matrix_op мы подаем следующие значения:

  1) first - целевая матрица (размер которой мы вычисляем из формулы выше)
  
  2) second - вторая матрица (не используется в случаи транспонирования)
  
  3) result - итоговая матрица
  

Чтобы обратиться к элементам таблице нужно представлять как они расположены:
На самом деле: 1 2 3 4 5 6 7 8 9 (в случае 3 на 3 таблицы)
Как мы себе это представляем:

1 2 3

4 5 6

7 8 9

Если учитывать что длина каждого из элементов отлична от 1 (например, 8), то у нас может получиться следующий результат:

00000001 00000010 00000011

...

00000111 00001000 00001001 

Чтобы найти элемент, нам нужно знать его номер (1-9) и его длину, чтобы не обратиться ко всей матрице или одному ее биту, в итоге обращение к первому элементу будет выглядеть следующим образом:

  - first[1 * length-1: 0] - первые length битов, по аналогии можем обратитсья к N номеру таблицы, при условии что N < size* size (N = №строки * size + №столбца)

  - first[(i * size + j + 1) * length - 1 : length * (i * size + j)]


Если размер матрицы (size) = 1, то это просто матрица 1 на 1 (или 1 элемент) и итоговая транспонированная матрица будет выглядеть также как и целевая, остальные операции будут представлены простым сложением/вычитанием элементов.  

Когда размер матрицы (size) = 2 или выше у нас приходят некотрые изменения:
мы складываем/вычитаем все элементы разом в соответствующих позициях первой и второй матриц, в зависимости от выбранной operation,
мы задаем результирующей матрице элементы первой матрицы, только столбцы становятся строками, а строки - столбцами (транспонирование), при этом главная диагональ не меняется.

