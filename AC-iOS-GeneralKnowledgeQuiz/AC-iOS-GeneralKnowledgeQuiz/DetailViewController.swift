//
//  DetailViewController.swift
//  AC-iOS-GeneralKnowledgeQuiz
//
//  Created by C4Q on 11/9/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    

    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    var selectedQuestion: Question?
    var answers: [String]?
    var correctAnswer: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("viewDidLoad")
        // Do any additional setup after loading the view.
        pickerView.dataSource = self
        pickerView.delegate = self
        setUpView()
    }
    func setUpView() {
        //print("setUpView")
        guard let selectedQuestion = selectedQuestion else {
            return
        }
        self.question.text = selectedQuestion.question
        
        var arrOfOptions = ([selectedQuestion.correctAnswer] +
            selectedQuestion.incorrectAnswers)
        var answers = [String]()
        while !arrOfOptions.isEmpty {
           let index = Int(arc4random_uniform(UInt32(arrOfOptions.count)))
            answers.append(arrOfOptions[index])
            arrOfOptions.remove(at: index)
        }
        self.answers = answers
        self.correctAnswer = selectedQuestion.correctAnswer
//        pickerView.
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK:- PickerView
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //print("titleForRow")
        guard let answers = answers else {
            return ""
        }
        print(answers[row])
        return answers[row]
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let answers = answers else {
            return 0
        }
        return answers.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let answers = answers else {
            self.view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            return
        }
        if answers[row] == self.correctAnswer {
            self.view.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
            Statistics.correctNum += 1
        } else {
            self.view.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
            Statistics.incorrectNum += 1
        }
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
