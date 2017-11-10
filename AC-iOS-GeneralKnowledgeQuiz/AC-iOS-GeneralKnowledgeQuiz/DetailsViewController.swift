//
//  DetailsViewController.swift
//  AC-iOS-GeneralKnowledgeQuiz
//
//  Created by C4Q on 11/9/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var question: Question?
    var arrOfAnswers: [String] = []
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var answerPicker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
      self.answerPicker.delegate = self
        self.answerPicker.dataSource = self
        
        guard let question = question else {
            return
        }
        arrOfAnswers = question.incorrectAnswers
        let randomIndex = arc4random_uniform(UInt32(arrOfAnswers.count - 1))
        arrOfAnswers.insert(question.correctAnswer, at: Int(randomIndex))
        self.label.text = question.question
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let question = question else {
            return 0
        }
        return (question.incorrectAnswers.count + 1)
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
      
        return arrOfAnswers[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let question = question else {
            return
        }
        if row == arrOfAnswers.index(of: question.correctAnswer) {
            self.view.backgroundColor = .green
        } else {
            self.view.backgroundColor = .red
        }
        
    }

}
