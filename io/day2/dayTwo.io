/*
    Последовательность чисел Фибоначчи начинается с двух 1.
    Каждое последующее число является суммой двух предыду-
    щих: 1, 1, 2, 3, 5, 8, 13, 21 ит. д. Напишите программу поиска
    п-го числа Фибоначчи. Вызов #6 (1) должен возвращать число
    1, а вызов Ё (4) — число 3. Дополнительно решите эту задачу
    с применением цикла и рекурсии;
*/

"day2 task1" println

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



"day2 task2" println
# как можно было бы изменить оператор /, чтобы он возвращал 0, если знаменатель равен нулю?

origDiv := Number getSlot("/")
Number / := method (i,
    if (i != 0, self origDiv(i), 0)
)

10/0
# -> 0

"day2 task3" println
# напишите программу, вычисляющую сумму всех чисел в двумерном массиве;

MyList := clone Object

MyList createListOfLists := method(amount,
    listOfLists := List clone
    while(amount > 0,
        amount := amount  - 1
        listOfLists append(List clone)
    )
    return listOfLists
)


MyList arr2fillData := method(lists, num,
    length := lists size - 1
    while(length >= 0,
        listElem := lists at(length)
        i := 0
        while(i < num,
            listElem append(i * length + 1)
            i := i + 1
        )
        length := length - 1
    )
    return lists
)

MyList lists := arr2fillData(MyList createListOfLists(4), 5) println

MyList sumOfLists := method(lists,
    length := lists size - 1
    sum := 0
    for (i, 0, length,
        listElem := lists at(i)
        elemLength := listElem size - 1
        for (j, 0, elemLength,
            sum := sum + listElem at(j)
        )
    )
    return sum
)

MyList sumOfLists(lists) println


"day2 task4" println
/*
    Добавьте в список слот myAverage, вычисляющий среднее значе-
    ние для чисел в списке. Что произойдет, если в списке не бу-
    дет обнаружено ни одного числа? (Дополнительно: реализуйте
    возбуждение исключения, если хотя бы один элемент в списке
    не является числом.);
*/


MyList countElementsInList := method(lists,
    length := lists size - 1
    counter := 0
    for (i, 0, length,
        listElem := lists at(i)
        counter := counter + listElem size
    )
    return counter
)


MyList elements := countElementsInList(lists) println
MyList sum := sumOfLists(lists)
MyList avg := MyList sum / MyList elements


MyList arr2fillDataString := method(lists, num, str,
    length := lists size - 1
    while(length >= 0,
        listElem := lists at(length)
        i := 1
        while(i < num,
            listElem append(str)
            i := i + 1
        )
        length := length - 1
    )
    return lists
)

MyList strLists := arr2fillDataString(lists, 3, "sad")
MyList elements := countElementsInList(strLists) println

# Exception: argument 0 to method '+' must be a Number, not a 'Sequence'
MyList sum := sumOfLists(strLists)
MyList avg := sum / elements


MyList sumOfLists := method(lists,

    e := try(
       length := lists size - 1
       sum := 0
       for (i, 0, length,
           listElem := lists at(i)
           elemLength := listElem size - 1
           for (j, 0, elemLength,
               sum := sum + listElem at(j)
           )
       )
       return sum
    )

    e catch(Error,
        Error println
    )
)

MyList sum := sumOfLists(strLists)
/*
→
    Exception_0xad9f78:
    caughtMessage    = +(listElem at(j))
    coroutine        = Coroutine_0xad9590
    error            = "argument 0 to method '+' must be a Number, not a 'Sequence'"
*/


MyList sumOfLists := method(lists,

    e := try(
       length := lists size - 1
       sum := 0
       for (i, 0, length,
           listElem := lists at(i)
           elemLength := listElem size - 1
           for (j, 0, elemLength,
               elem := listElem at(j)
               elem print
               if (elem type != "Number",

                    Exception raise("#{elem} is not a number" interpolate)
               )
               sum := sum + elem
           )
       )
       return sum
    )

    e catch(Error,
        Error println
    )
)

MyList sum := sumOfLists(strLists)

/*
→ sad Exception_0x63db80:
  coroutine        = Coroutine_0x7ebc18
  error            = "sad is not a number"
  nestedException  = nil
/*