/*
    дополнительно: напишите метод transpose, преобразующий
    список так, что (new matrix get (у, х)) == matrix get(х, у);
*/

MyList transpose := method(listPrev, x, y,
    listOfLists := List clone
        for(i, 0, x - 1,
            listOfLists append(List clone)
            for(j, 0, y - 1,
                listOfLists at(i) append(listPrev at(j) at(i))
            )
        )
        return listOfLists
)

MyList reverListOfList := MyList transpose(listOfLists, 5, 4)

MyList get := method(listOfLists,x, y,
    return (listOfLists at(y - 1) at(x - 1))
)

MyList get(listOfLists, 3, 2)
MyList get(reverListOfList, 2, 3)