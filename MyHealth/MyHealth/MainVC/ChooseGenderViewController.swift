//
//  ChooseGenderViewController.swift
//  MyHealth
//
//  Created by Do Hoang Viet on 9/19/18.
//  Copyright © 2018 Do Hoang Viet. All rights reserved.
//

import UIKit

class ChooseGenderViewController: UIViewController {
    @IBOutlet weak var buttonFemale: UIButton!
    @IBOutlet weak var buttonMale: UIButton!
    
    var isSelectedFemale: Bool = false {
        didSet {
            if isSelectedFemale {
                self.isSelectedMale = false
                self.buttonFemale.backgroundColor = SetupColor.selectedButton
                self.buttonFemale.titleLabel?.textColor = .white
            } else {
                self.buttonFemale.backgroundColor = SetupColor.defaultButton
                self.buttonFemale.titleLabel?.textColor = .black
            }
        }
    }
    
    var isSelectedMale: Bool = false {
        didSet {
            if isSelectedMale {
                self.isSelectedFemale = false
                self.buttonMale.backgroundColor = SetupColor.selectedButton
                self.buttonMale.titleLabel?.textColor = .white
            } else {
                self.buttonMale.backgroundColor = SetupColor.defaultButton
                self.buttonMale.titleLabel?.textColor = .black
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressFemale(_ sender: UIButton) {
        self.isSelectedFemale = true
    }
    
    @IBAction func pressMale(_ sender: UIButton) {
        self.isSelectedMale = true
    }
}
