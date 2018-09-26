//
//  ChooseWeightCurrentAndGoalViewController.swift
//  MyHealth
//
//  Created by Do Hoang Viet on 9/19/18.
//  Copyright © 2018 Do Hoang Viet. All rights reserved.
//

import UIKit

class ChooseWeightCurrentViewController: ChooseWeightCurrentAndGoalViewController {
    
}

class ChooseWeightGoalViewController: ChooseWeightCurrentAndGoalViewController {
    
}

// MARK: - Base ViewController of ChooseWeightCurrent and ChooseWeightGoal

class ChooseWeightCurrentAndGoalViewController: UIViewController {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var buttonNext: UIButton!
    
    let pickerViewHelper = PickerViewHelper()
    
    var currentWeight: Int = 0
    var currentDecimal: Int = 0
    
    var isSelected: Bool = false {
        didSet {
            if isSelected {
                buttonNext.backgroundColor = SetupColor.selectedButton
                buttonNext.titleLabel?.textColor = .white
            } else {
                buttonNext.backgroundColor = SetupColor.defaultButton
                buttonNext.titleLabel?.textColor = .black
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupPickerView()
        self.defaultPickerView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.isSelected = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupPickerView() {
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
    }
    
    private func defaultPickerView() {
        self.pickerView.selectRow(0, inComponent: 0, animated: true)
        self.pickerView.selectRow(0, inComponent: 1, animated: true)
        self.currentWeight = self.pickerViewHelper.weights[0]
        self.currentDecimal = self.pickerViewHelper.decimalOfWeight[0]
    }
    
    func saveCurrentWeight() {
        var weight = "\(self.currentWeight).\(self.currentDecimal)"
        UserDefaults.standard.set(["weight":weight], forKey: "CurrentWeight")
    }
    
    @IBAction func pressNext(_ sender: UIButton) {
        self.isSelected = true
        self.saveCurrentWeight()
    }
}

// MARK: - DataSource and Delegate

extension ChooseWeightCurrentAndGoalViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 4
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let typePickerView = PickerViewWeightType(rawValue: component) else { return 0 }
        switch typePickerView {
        case .weight:
            return self.pickerViewHelper.talls.count
        case .comma:
            return 1
        case .decimal:
            return self.pickerViewHelper.decimalOfWeight.count
        case .type:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let typePickerView = PickerViewWeightType(rawValue: component) else { return "" }
        switch typePickerView {
        case .weight:
            return String(self.pickerViewHelper.weights[row])
        case .comma:
            return ","
        case .decimal:
            return String(self.pickerViewHelper.decimalOfWeight[row])
        case .type:
            return "kg"
        }
    }
}

extension ChooseWeightCurrentAndGoalViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let typePickerView = PickerViewWeightType(rawValue: component) else { return }
        switch typePickerView {
        case .weight:
            self.currentWeight = self.pickerViewHelper.weights[row]
        case .comma:
            break
        case .decimal:
            self.currentDecimal = self.pickerViewHelper.decimalOfWeight[row]
        case .type:
            break
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        guard let typePickerView = PickerViewWeightType(rawValue: component) else { return 0 }
        switch typePickerView {
        case .weight:
            return 60
        case .comma:
            return 20
        case .decimal:
            return 50
        case .type:
            return 40
        }
    }
}

