//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var platesArray = [1,2,3,4,5,5,5,5,9,10,11,12]
for i in platesArray{
    i
}

for var i = 0; i < platesArray.count; i++ {
    ++platesArray[i]
}


var plates = [10,0,2,0,0,0]
var thePlates = [0,0,0,0,0,0]

//1 is 45
//2 is 35
//3 is 25
//4 is 10
//5 is 5

//if there are more than 12 45 plates make it so theres only 12 in the array
if plates[0] > 12 {
    for var i = 0; i < thePlates.count; i++ {
        thePlates[i] = 1
        //return the array
    }
}





var plateRefs = [Int]()
for var i = 0; i < thePlates.count; i++ {
    if plates[i] == 2 && i == 0 {
        thePlates[i] = 1
        plateRefs.append(1)
    } else if plates[i] == 2 && i == 1 {
        thePlates[i] = 2
        plateRefs.append(2)
    } else if plates[i] == 2 && i == 2 {
        thePlates[i] = 3
        plateRefs.append(3)
    } else if plates[i] == 2 && i == 3 {
        thePlates[i] = 4
        plateRefs.append(4)
    } else if plates[i] == 2 && i == 4 {
        thePlates[i] = 5
        plateRefs.append(5)
    } else if plates[0] == 4 && i == 0 {
        plateRefs.append(1)
        plateRefs.append(1)
    } else if plates[0] == 6 && i == 0 {
        plateRefs.append(1)
        plateRefs.append(1)
        plateRefs.append(1)
    } else if plates[0] == 8 && i == 0 {
        plateRefs.append(1)
        plateRefs.append(1)
        plateRefs.append(1)
        plateRefs.append(1)
    } else if plates[0] == 10 && i == 0 {
        plateRefs.append(1)
        plateRefs.append(1)
        plateRefs.append(1)
        plateRefs.append(1)
        plateRefs.append(1)
    }
}

