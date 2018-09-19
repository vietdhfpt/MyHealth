//
//  ChooseTallViewController.swift
//  MyHealth
//
//  Created by Do Hoang Viet on 9/18/18.
//  Copyright © 2018 Do Hoang Viet. All rights reserved.
//

import UIKit

class ChooseTallViewController: UIViewController {
    
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

extension ChooseTallViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let typePickerView = PickerViewTallType(rawValue: component) else { return 0 }
        switch typePickerView {
        case .tall:
            return self.pickerViewHelper.talls.count
        case .type:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let typePickerView = PickerViewTallType(rawValue: component) else { return "" }
        switch typePickerView {
        case .tall:
            return String(self.pickerViewHelper.talls[row])
        case .type:
            return "cm"
        }
    }
}

extension ChooseTallViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let typePickerView = PickerViewTallType(rawValue: component) else { return }
        switch typePickerView {
        case .tall:
            print(self.pickerViewHelper.talls[row])
        case .type:
            break
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 60
    }
}
