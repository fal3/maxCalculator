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

        weightTextField.becomeFirstResponder()
   
        

    }

//    _textField.layer.shadowOpacity = 1.0;
//    _textField.layer.shadowRadius = 0.0;
//    _textField.layer.shadowColor = [UIColor blackColor].CGColor;
//    _textField.layer.shadowOffset = CGSizeMake(0.0, -1.0);

    func calculateMax() -> String
    {
        //weight * (1 + reps/30)

        var reps: Double
        var weight: Double

        weight = (weightTextField.text! as NSString).doubleValue
        reps = (repsTextField.text! as NSString).doubleValue

        let max = weight * (1 + (reps/30))
        fillPlates(max)
        return (NSString(format: "%.2f", max)) as String
    }
    func textFieldDidBeginEditing(textField: UITextField) {
        print("hello")
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

        var plateWeight = Int(max) - 45
        // .0 is plates .1 is weight
        (fortFivePlates,fortyFiveWeight) = self.fortyFivePlates(max)

        (thirtFivePlates,thirtyFiveWeight) = self.thirtyFivePlates(fortyFiveWeight)

        (twentyFivePlates,twentyFiveWeight) = self.twentyFivePlates(thirtyFiveWeight)

        (tenPlates,tenWeight) = self.tenPlates(twentyFiveWeight)

        (fivePlates,fiveWeight) = self.fivePlates(tenWeight)

        let thePlates = [fortFivePlates,thirtFivePlates,twentyFivePlates,tenPlates,fivePlates,0]
        let passThis = configPlates(thePlates)

        changePlates(passThis)
    }

    func changePlates(thePlates: [Int]) {

        let fortfPlate = UIImage(named: "45Plate")
        let thirtfPlate = UIImage(named: "35Plate")
        let twofPlate = UIImage(named: "25Plate")
        let tenPlate = UIImage(named: "10Plate")
        let fivPlate = UIImage(named: "5Plate")
//        let poonPlate = UIImage(named: "2.5plate")

        if thePlates != [1, 0, 0, 0, 0, 0] {
            for var i = 0; i < self.plates.count; i++ {
                self.plates[i].image = UIImage(named: "")
            }

                      print(thePlates)
            print(self.plates.count)

            var temp = thePlates
            for var i = 0; i < thePlates.count; i++ {
                temp.append(thePlates[i])
            }
            print(temp)
            temp.sortInPlace({ (T: Int, P: Int) -> Bool in
                return P > T
            })

            for var i = 0; i < temp.count; i++ {
                if temp[i] == 1 {
                    self.plates[i].image = fortfPlate
                } else if temp[i] == 2 {
                    self.plates[i].image = thirtfPlate
                } else if temp[i] == 3 {
                    self.plates[i].image = twofPlate
                } else if temp[i] == 4 {
                    self.plates[i].image = tenPlate
                } else if temp[i] == 5{
                    self.plates[i].image = fivPlate
                }
            }
        } else {
            for var i = 0; i < 12; i++ {
                self.plates[i].image = fortfPlate
            }
            return
        }
    }


    func configPlates(plates: [Int]) -> [Int]{
        //        [fortFivePlates,thirtFivePlates,twentyFivePlates,tenPlates,fivePlates]

        //1 is 45
        //2 is 35
        //3 is 25
        //4 is 10
        //5 is 5
        print("these are the fucking plates \(plates) " )
        //if there are more than 12 45 plates make it so theres only 12 in the array
        var thePlates = [0,0,0,0,0,0]
        if plates[0] > 12 {
            for var i = 0; i < thePlates.count; i++ {
                thePlates[i] = 1
                //return the array
                return thePlates
            }
        }
        var plateRefs = [Int]()
        var returnThis = [Int]()
        for var i = 0; i < thePlates.count; i++ {
            if plates[i] == 2 && i == 0 {
                plateRefs.append(1)
            } else if plates[i] == 2 && i == 1 {
                plateRefs.append(2)
            } else if plates[i] == 2 && i == 2 {
                plateRefs.append(3)
            } else if plates[i] == 2 && i == 3 {
                plateRefs.append(4)
            } else if plates[i] == 2 && i == 4 {
                plateRefs.append(5)
            } else if plates[i] == 4 && i == 4 {
                plateRefs.append(5)
                plateRefs.append(5)
            }else if plates[0] == 4 && i == 0 {
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
            returnThis = plateRefs
        }

        print( "okay so you dont want to return this \(returnThis)")
        return returnThis

    }

    func fortyFivePlates(max: Double) -> (Int,Int) {
        let plateWeight = Int(max) - 45

        var plates = plateWeight/45
        if plates % 2 == 1 {
            plates -= 1
        }
        print("this is how many 45s there will be \(plates)")
        let remainder = plateWeight - (45 * plates)
        return (plates,remainder)
    }

    func thirtyFivePlates(weight: Int) -> (Int,Int) {
        let plateWeight = Int(weight)
        var plates = plateWeight/35
        if plates % 2 == 1 {
            plates -= 1
        }
        print("this is how many 35s there will be \(plates)")
        let remainder = plateWeight - (35 * plates)
        return (plates,remainder)
    }

    func twentyFivePlates(weight: Int) -> (Int,Int) {
        let plateWeight = Int(weight)
        var plates = plateWeight/25
        if plates % 2 == 1 {
            plates -= 1
        }
        print("this is how many 25s there will be \(plates)")
        let remainder = plateWeight - (25 * plates)
        return (plates,remainder)
    }

    func tenPlates(weight: Int) -> (Int,Int) {
        let plateWeight = Int(weight)
        var plates = plateWeight/10
        if plates % 2 == 1 {
            plates -= 1
        }
        print("this is how many 10s there will be \(plates)")
        let remainder = plateWeight - (10 * plates)
        return (plates,remainder)
    }

    func fivePlates(weight: Int) -> (Int,Int) {
        let plateWeight = Int(weight)
        var plates = plateWeight/5
        if plates % 2 == 1 {
            plates -= 1
        }
        print("this is how many 5s there will be \(plates)")
        let remainder = plateWeight - (10 * plates)
        print("this is the remaining amount of weight \(remainder) \n\n")
        return (plates,remainder)
    }
    
}
