//
//  ChooseBirthDayViewController.swift
//  MyHealth
//
//  Created by Do Hoang Viet on 9/17/18.
//  Copyright © 2018 Do Hoang Viet. All rights reserved.
//

import UIKit

class ChooseBirthDayViewController: UIViewController {
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var buttonNext: UIButton!
    
    let pickerViewHelper = PickerViewHelper()
    
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
    
    @IBAction func pressNext(_ sender: UIButton) {
        self.isSelected = true
    }
}

// MARK: - DataSource and Delegate
extension ChooseBirthDayViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let typePickerView = PickerViewType(rawValue: component) else { return 0 }
        switch typePickerView {
        case .day:
            return self.pickerViewHelper.days.count
        case .month:
            return self.pickerViewHelper.months.count
        case .year:
            return self.pickerViewHelper.years.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let typePickerView = PickerViewType(rawValue: component) else { return "" }
        switch typePickerView {
        case .day:
            return String(self.pickerViewHelper.days[row])
        case .month:
            return self.pickerViewHelper.months[row]
        case .year:
            return self.pickerViewHelper.years[row]
        }
    }
}

extension ChooseBirthDayViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let typePickerView = PickerViewType(rawValue: component) else { return }
        switch typePickerView {
        case .day:
            print(self.pickerViewHelper.days[row])
        case .month:
            print(self.pickerViewHelper.months[row])
        case .year:
            print(self.pickerViewHelper.years[row])
        }
    }
}
