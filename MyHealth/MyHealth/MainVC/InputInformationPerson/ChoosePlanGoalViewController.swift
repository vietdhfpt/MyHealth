//
//  ChoosePlanGoalViewController.swift
//  MyHealth
//
//  Created by Do Hoang Viet on 9/21/18.
//  Copyright © 2018 Do Hoang Viet. All rights reserved.
//

import UIKit

class ChoosePlanGoalViewController: UIViewController {
   
    @IBOutlet weak var kcalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.kcalLabel.text =  "\(self.calculateTotalCaloInDay())"
    }

    func getInfoGender() -> Float {
        guard let infoGender = UserDefaults.standard.object(forKey: "Gender") as? [String:String],
            let value = infoGender.values.first else {
            return 0
        }

        guard let valueAfterConvert = Float(value) else {
            return 0
        }
        
        return valueAfterConvert
    }
    
    func getInfoActivityLevel() -> Float {
        guard let infoGender = UserDefaults.standard.object(forKey: "ActivityLevel") as? [String:String],
            let value = infoGender.values.first else {
                return 0
        }
        
        guard let valueAfterConvert = Float(value) else {
            return 0
        }
        
        return valueAfterConvert
    }
    
    func getInfoYear() -> Int {
        guard let infoYear = UserDefaults.standard.object(forKey: "YearOfBirth") as? [String:String],
            let value = infoYear.values.first else {
            return 0
        }
        
        guard let valueAfterConvert = Int(value) else {
            return 0
        }
        
        return valueAfterConvert
    }
    
    func getInfoTall() -> Int {
        guard let infoTall = UserDefaults.standard.object(forKey: "Tall") as? [String:Int],
            let value = infoTall.values.first else {
                return 0
        }
        
        return value
    }
    
    func getInfoCurrentWeight() -> Float {
        guard let infoTall = UserDefaults.standard.object(forKey: "CurrentWeight") as? [String:String],
            let value = infoTall.values.first else {
                return 0
        }
        
        guard let valueAfterConvert = Float(value) else {
            return 0
        }
        
        return valueAfterConvert
    }
    
    func calculateTotalCaloInDay() -> String {
        guard let infoGender = UserDefaults.standard.object(forKey: "Gender") as? [String:String],
            let isGender = infoGender.keys.first else {
                return ""
        }
        
        var totalCalo: Float = 0.0
        let infoCurrentWeight = self.getInfoCurrentWeight()
        let infoTall = self.getInfoTall()
        
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: date)
        let yearNow =  components.year ?? 2018
        let InfoOld = yearNow - self.getInfoYear()
        
        if isGender == "Male" {
            totalCalo = (13397 * infoCurrentWeight) + (4799 * Float(infoTall)) - (5677 * Float(InfoOld)) + 88362
        } else {
            print("false")
        }
        
        let resultTotal = "\(totalCalo / 1000)".components(separatedBy: ".").first ?? ""
        
        return resultTotal + " Cal/Ngày"
    }
}
