//
//  ChooseActivityLevelViewController.swift
//  MyHealth
//
//  Created by Do Hoang Viet on 9/21/18.
//  Copyright © 2018 Do Hoang Viet. All rights reserved.
//

import UIKit

class ChooseActivityLevelViewController: UIViewController {
    @IBOutlet weak var buttonLowActivity: UIButton!
    @IBOutlet weak var buttonModerateActivity: UIButton!
    @IBOutlet weak var buttonHighActivity: UIButton!
    @IBOutlet weak var buttonVeryHighActivity: UIButton!
    
    var isLowActivity: Bool = false {
        didSet {
            if isLowActivity {
                self.isModerateActivity = false
                self.isHighActivity = false
                self.isVeryHighActivity = false
                self.buttonLowActivity.backgroundColor = SetupColor.selectedButton
                self.buttonLowActivity.titleLabel?.textColor = .white
            } else {
                self.buttonLowActivity.backgroundColor = SetupColor.defaultButton
                self.buttonLowActivity.titleLabel?.textColor = .black
            }
        }
    }
    
    var isModerateActivity: Bool = false {
        didSet {
            if isModerateActivity {
                self.isLowActivity = false
                self.isHighActivity = false
                self.isVeryHighActivity = false
                self.buttonModerateActivity.backgroundColor = SetupColor.selectedButton
                self.buttonModerateActivity.titleLabel?.textColor = .white
            } else {
                self.buttonModerateActivity.backgroundColor = SetupColor.defaultButton
                self.buttonModerateActivity.titleLabel?.textColor = .black
            }
        }
    }
    
    var isHighActivity: Bool = false {
        didSet {
            if isHighActivity {
                self.isLowActivity = false
                self.isModerateActivity = false
                self.isVeryHighActivity = false
                self.buttonHighActivity.backgroundColor = SetupColor.selectedButton
                self.buttonHighActivity.titleLabel?.textColor = .white
            } else {
                self.buttonHighActivity.backgroundColor = SetupColor.defaultButton
                self.buttonHighActivity.titleLabel?.textColor = .black
            }
        }
    }
    
    var isVeryHighActivity: Bool = false {
        didSet {
            if isVeryHighActivity {
                self.isLowActivity = false
                self.isModerateActivity = false
                self.isHighActivity = false
                self.buttonVeryHighActivity.backgroundColor = SetupColor.selectedButton
                self.buttonVeryHighActivity.titleLabel?.textColor = .white
            } else {
                self.buttonVeryHighActivity.backgroundColor = SetupColor.defaultButton
                self.buttonVeryHighActivity.titleLabel?.textColor = .black
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func saveActivityLevel(dict: [String:String]) {
        UserDefaults.standard.set(dict, forKey: "ActivityLevel")
    }

    @IBAction func pressLowActivity(_ sender: UIButton) {
        self.isLowActivity = true
        self.saveActivityLevel(dict: ["low":"1.2"])
    }
    
    @IBAction func pressModerateActivity(_ sender: UIButton) {
        self.isModerateActivity = true
        self.saveActivityLevel(dict: ["moderate":"1.375"])
    }
    
    @IBAction func pressHighActivity(_ sender: UIButton) {
        self.isHighActivity = true
        self.saveActivityLevel(dict: ["high":"1.55"])
    }
    
    @IBAction func pressVeryHighActivity(_ sender: UIButton) {
        self.isVeryHighActivity = true
        self.saveActivityLevel(dict: ["veryHigh":"1.725"])
    }
}
