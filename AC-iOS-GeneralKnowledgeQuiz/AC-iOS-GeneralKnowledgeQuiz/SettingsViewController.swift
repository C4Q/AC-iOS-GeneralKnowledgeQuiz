//
//  SettingsViewController.swift
//  AC-iOS-GeneralKnowledgeQuiz
//
//  Created by C4Q on 11/9/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    

    
    @IBOutlet weak var diffictulySegmentedControl: UISegmentedControl!
    @IBOutlet weak var typeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var categoryPicker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.categoryPicker.dataSource = self
        self.categoryPicker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("im appearing")
        var diffIndex = 0
        switch Settings.difficulty {
        case .all: diffIndex = 0
        case .easy: diffIndex = 1
        case .medium: diffIndex = 2
        case .hard: diffIndex = 3
        }
        diffictulySegmentedControl.selectedSegmentIndex = diffIndex
        
        var typeIndex = 0
        switch Settings.type {
        case .all: typeIndex = 0
        case .multiple: typeIndex = 1
        case .boolean: typeIndex = 2
        }
        typeSegmentedControl.selectedSegmentIndex = typeIndex
        
        var cateIndex = 0
        switch Settings.category {
        case .all: cateIndex = 0
        case .animals: cateIndex = 1
        case .generalKnowledge: cateIndex = 2
        case .geography: cateIndex = 3
        case .history: cateIndex = 4
        case .scienceComputers: cateIndex = 5
        case .sports: cateIndex = 6
        }
        categoryPicker.selectRow(cateIndex, inComponent: 0, animated: false)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - PickerView
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Set(Question.questions.map{$0.category}).count + 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //print("hello")
        guard row > 0 else {
            return "All"
        }
        print(Array(Set(Question.questions.map{$0.category})).sorted())
        return Array(Set(Question.questions.map{$0.category})).sorted()[row - 1]
    }
    //MARK: - Change Settings
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard row > 0 else {
            Settings.category = .all
            return
        }
        Settings.category = CateOption(rawValue: Array(Set(Question.questions.map{$0.category})).sorted()[row - 1])!
        print(Settings.category.rawValue)
    }
    @IBAction func difficultyChanged(_ sender: UISegmentedControl) {
        Settings.difficulty = DiffOption(rawValue: sender.titleForSegment(at: sender.selectedSegmentIndex)!)!
        print(sender.titleForSegment(at: sender.selectedSegmentIndex)!)
        print(Settings.difficulty.rawValue)
    }
    
    @IBAction func typeChanged(_ sender: UISegmentedControl) {
        Settings.type = TypeOption(rawValue: sender.titleForSegment(at: sender.selectedSegmentIndex)!)!
        print(sender.titleForSegment(at: sender.selectedSegmentIndex)!)
        print(Settings.type.rawValue)
    }
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
