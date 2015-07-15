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


var plates = [2,0,0,0,2]
var thePlates = [0,0,0,0,0,0]

for var i = 0; i < thePlates.count; i++ {
    if plates[i] == 2 && i == 0 {
        ++thePlates[i]
    } else if plates[i] == 2 && i == 1 {
        thePlates[i] += 2
    } else if plates[i] == 2 && i == 2 {
        thePlates[i] += 3
    } else if plates[i] == 2 && i == 3 {
        thePlates[i] += 4
    } else if plates[i] == 2 && i == 4 {
        thePlates[i] += 5
    }
    println(thePlates)
}
