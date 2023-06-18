/*
    напишите прототип двумерного списка. Метод dim(х, у) дол-
    жен создавать список из у списков длиной х каждый. Метод
    set (х, у, value) должен устанавливать значение элемента спис-
    ка, а метод get(х, у) — возвращать это значение;

*/

MyList := clone Object

MyList dim := method(x, y,
    listOfLists := List clone
    for(i, 0, y - 1,
        listOfLists append(List clone)
        for(j, 0, x - 1,
            listOfLists at(i) append(List clone)
        )
    )
    return listOfLists
)

MyList listOfLists := dim(5, 4)

MyList set := method(x, y, value,
    MyList listOfLists at(y - 1) at(x - 1) append(value)
)

MyList set(2, 3, 100)

MyList get := method(x, y,
    return (MyList listOfLists at(y - 1) at(x - 1))
)

MyList get(2, 3)