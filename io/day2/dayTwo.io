# Последовательность чисел Фибоначчи начинается с двух 1.
# Каждое последующее число является суммой двух предыду-
# щих: 1, 1, 2, 3, 5, 8, 13, 21 ит. д. Напишите программу поиска
# п-го числа Фибоначчи. Вызов #6 (1) должен возвращать число
# 1, а вызов Ё (4) — число 3. Дополнительно решите эту задачу
# с применением цикла и рекурсии;

"day2 task1" print

#Решение с помощью рекурсии
Fibo := Object clone
Fibo calculate := method(num,
    if (num <= 2,
        return 1
    ) else (
        return fiboRecursion(num - 2, 1 , 1)
    )
)

fiboRecursion := method(num, i, j,
    if ( num == 0,
        return j
    ) else (
        return fiboRecursion(num - 1, j, i + j)
    )
)

Fibo calculate(6)
# → 8
Fibo calculate(7)
# -> 13
Fibo calculate(8)
#-> 21


#Решение с помощью цикла
fiboCycle := method(num,
    if (num <= 2,
        return 1
    ) else (
        i := 3
        prevN := 1
        n := 2
        while (i < num,
            tempN := n;
            n = prevN + n;
            prevN = tempN;
            i = i + 1
        )
        return n
    )
)