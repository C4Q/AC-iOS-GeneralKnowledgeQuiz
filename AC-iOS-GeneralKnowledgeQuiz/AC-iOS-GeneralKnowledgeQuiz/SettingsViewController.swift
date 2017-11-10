//
//  SettingsViewController.swift
//  AC-iOS-GeneralKnowledgeQuiz
//
//  Created by C4Q on 11/9/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController,  UIPickerViewDelegate, UIPickerViewDataSource {
    var difficulty: String = "all"
    var type: String = "all"
    var category: String = ""
    var allCategory: [String] = []
        
        
    @IBOutlet weak var difficultySegment: UISegmentedControl!
    @IBOutlet weak var typeSegment: UISegmentedControl!
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
  self.pickerView.delegate = self
    self.pickerView.dataSource = self
        
        self.difficulty = Setting.difficulty
        self.type = Setting.type
        self.category = Setting.category
        loadData()
        pickerView.selectRow(allCategory.count - 1, inComponent: 0, animated: true)
    }
    func loadData() {
        for question in Question.questions {
            if !allCategory.contains(question.category) {
                allCategory.append(question.category)
            }
        }
        allCategory.append("all")
    }
    @IBAction func difficultySegmentChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.difficulty = "all"
        case 1:
            self.difficulty = "easy"
        case 2:
            self.difficulty = "medium"
        default:
            self.difficulty = "hard"
        }
        Setting.difficulty = self.difficulty
    }
    
    @IBAction func typeSegmentChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.type = "all"
        case 1:
          self.type = "multiple"
        default:
            self.type = "boolean"
        }
        Setting.type = self.type
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return allCategory.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if allCategory.isEmpty {
            return nil
        }
        return allCategory[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      self.category = allCategory[row].lowercased()
        Setting.category = self.category
    }
}











