//
//  ChooseGoalViewController.swift
//  MyHealth
//
//  Created by Do Hoang Viet on 9/19/18.
//  Copyright © 2018 Do Hoang Viet. All rights reserved.
//

import UIKit

class ChooseGoalViewController: UIViewController {
    @IBOutlet weak var buttonLoseWeight: UIButton!
    @IBOutlet weak var buttonBuildMuscle: UIButton!
    @IBOutlet weak var buttonLiveHealthy: UIButton!
    
    var isSelectedLoseWeight: Bool = false {
        didSet {
            if isSelectedLoseWeight {
                self.isSelectedBuildMuscle = false
                self.isSelectedLiveHealthy = false
                self.buttonLoseWeight.backgroundColor = SetupColor.selectedButton
                self.buttonLoseWeight.titleLabel?.textColor = .white
            } else {
                self.buttonLoseWeight.backgroundColor = SetupColor.defaultButton
                self.buttonLoseWeight.titleLabel?.textColor = .black
            }
        }
    }
    
    var isSelectedBuildMuscle: Bool = false {
        didSet {
            if isSelectedBuildMuscle {
                self.isSelectedLiveHealthy = false
                self.isSelectedLoseWeight = false
                self.buttonBuildMuscle.backgroundColor = SetupColor.selectedButton
                self.buttonBuildMuscle.titleLabel?.textColor = .white
            } else {
                self.buttonBuildMuscle.backgroundColor = SetupColor.defaultButton
                self.buttonBuildMuscle.titleLabel?.textColor = .black
            }
        }
    }
    
    var isSelectedLiveHealthy: Bool = false {
        didSet {
            if isSelectedLiveHealthy {
                self.isSelectedLoseWeight = false
                self.isSelectedBuildMuscle = false
                self.buttonLiveHealthy.backgroundColor = SetupColor.selectedButton
                self.buttonLiveHealthy.titleLabel?.textColor = .white
            } else {
                self.buttonLiveHealthy.backgroundColor = SetupColor.defaultButton
                self.buttonLiveHealthy.titleLabel?.textColor = .black
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressLoseWeight(_ sender: UIButton) {
        self.isSelectedLoseWeight = true
    }
    
    @IBAction func pressBuildMuscle(_ sender: UIButton) {
        self.isSelectedBuildMuscle = true
    }
    
    @IBAction func pressLiveHeathy(_ sender: UIButton) {
        self.isSelectedLiveHealthy = true
    }
}
