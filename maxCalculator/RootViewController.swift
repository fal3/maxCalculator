//
//  RootViewController.swift
//  maxCalculator
//
//  Created by alex fallah on 7/13/15.
//  Copyright (c) 2015 alex fallah. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UITextFieldDelegate {


    //odds are the left plates
    //evens are the right plates
    @IBOutlet var plates: [UIImageView]!

    @IBOutlet weak var weightTextField: UITextField!

    @IBOutlet weak var repsTextField: UITextField!

    @IBOutlet weak var maxLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    func calculateMax() -> String
    {
        //weight * (1 + reps/30)

        var reps: Double
        var weight: Double

        weight = (weightTextField.text as NSString).doubleValue
        reps = (repsTextField.text as NSString).doubleValue

        let max = weight * (1 + (reps/30))
        fillPlates(max)
        return (NSString(format: "%.2f", max)) as String
    }
    func textFieldDidBeginEditing(textField: UITextField) {
        println("hello")
        self.maxLabel.text = calculateMax()
    }

    func textFieldDidEndEditing(textField: UITextField) {
        self.maxLabel.text = calculateMax()

    }
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        return true
    }


    @IBAction func onCalcTapped(sender: AnyObject) {
        self.maxLabel.text = calculateMax()
    }

    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        self.maxLabel.text = calculateMax()
        return true
    }

    func fillPlates(max: Double)
    {
        var (fortFivePlates,thirtFivePlates,twentyFivePlates,tenPlates,fivePlates) = (0,0,0,0,0)
        var (fortyFiveWeight,thirtyFiveWeight,twentyFiveWeight,tenWeight,fiveWeight) = (0,0,0,0,0)

        for var i = 0; i < plates.count; i++ {
            plates[i].image = UIImage(named: "")
        }
        let fortfPlate = UIImage(named: "45plate")
        let thirtfPlate = UIImage(named: "35plate")
        let twofPlate = UIImage(named: "25plate")
        let tenPlate = UIImage(named: "10plate")
        let fivPlate = UIImage(named: "5plate")
        let poonPlate = UIImage(named: "2.5plate")
        var plateWeight = Int(max) - 45
        // .0 is plates .1 is weight
        (fortFivePlates,fortyFiveWeight) = self.fortyFivePlates(max)

        (thirtFivePlates,thirtyFiveWeight) = self.thirtyFivePlates(fortyFiveWeight)

        (twentyFivePlates,twentyFiveWeight) = self.twentyFivePlates(thirtyFiveWeight)

        (tenPlates,tenWeight) = self.tenPlates(twentyFiveWeight)

        (fivePlates,fiveWeight) = self.fivePlates(tenWeight)

        var thePlates = [fortFivePlates,thirtFivePlates,twentyFivePlates,tenPlates,fivePlates]
        configPlates(thePlates)

    }

    func configPlates(plates: [Int]){
        //        [fortFivePlates,thirtFivePlates,twentyFivePlates,tenPlates,fivePlates]
        var platesArray = [0,0,0,0,0,0,0,0,0,0,0,0]
        //1 is 45 
        //2 is 35
        //3 is 25
        //4 is 10
        //5 is 5

        //if there are more than 12 45 plates make it so theres only 12 in the array
        if plates[0] > 12 {
            for var i = 0; i < platesArray.count; i++ {
                ++platesArray[i]
                //return the array
            }
        }



        for var i = 0; i < platesArray.count; i++ {
            println(++platesArray[i])
        }

    }

    func fortyFivePlates(max: Double) -> (Int,Int) {
        var plateWeight = Int(max) - 45

        var plates = plateWeight/45
        if plates % 2 == 1 {
            plates -= 1
        }
        println("this is how many 45s there will be \(plates)")
        let remainder = plateWeight - (45 * plates)
        return (plates,remainder)
    }

    func thirtyFivePlates(weight: Int) -> (Int,Int) {
        var plateWeight = Int(weight)
        var plates = plateWeight/35
        if plates % 2 == 1 {
            plates -= 1
        }
        println("this is how many 35s there will be \(plates)")
        let remainder = plateWeight - (35 * plates)
        return (plates,remainder)
    }

    func twentyFivePlates(weight: Int) -> (Int,Int) {
        var plateWeight = Int(weight)
        var plates = plateWeight/25
        if plates % 2 == 1 {
            plates -= 1
        }
        println("this is how many 25s there will be \(plates)")
        let remainder = plateWeight - (25 * plates)
        return (plates,remainder)
    }

    func tenPlates(weight: Int) -> (Int,Int) {
        var plateWeight = Int(weight)
        var plates = plateWeight/10
        if plates % 2 == 1 {
            plates -= 1
        }
        println("this is how many 10s there will be \(plates)")
        let remainder = plateWeight - (10 * plates)
        return (plates,remainder)
    }

    func fivePlates(weight: Int) -> (Int,Int) {
        var plateWeight = Int(weight)
        var plates = plateWeight/5
        if plates % 2 == 1 {
            plates -= 1
        }
        println("this is how many 5s there will be \(plates)")
        let remainder = plateWeight - (10 * plates)
        println("this is the remaining amount of weight \(remainder) \n\n")
        return (plates,remainder)
    }

}
