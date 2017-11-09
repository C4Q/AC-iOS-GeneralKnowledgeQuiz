//
//  ViewController.swift
//  AC-iOS-GeneralKnowledgeQuiz
//
//  Created by Tom Seymour on 11/7/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var questions = Question.questions
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var incorrectCount: UILabel!
    @IBOutlet weak var correctCount: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        print(Set(questions.map{$0.category}))
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        questions = Question.questions
        if Settings.category != .all {
            questions = questions.filter{Settings.category.rawValue ==  $0.category}
        }
        if Settings.difficulty != .all {
            questions = questions.filter{Settings.difficulty.rawValue == $0.difficulty}
        }
        if Settings.type != .all {
            questions = questions.filter{Settings.type.rawValue == $0.type}
        }
        correctCount.text = String(Statistics.correctNum)
        incorrectCount.text = String(Statistics.incorrectNum)
        tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Question Cell", for: indexPath)
        let questionToUse = questions[indexPath.row]
        
        cell.textLabel?.text = questionToUse.question
        let detailText = "Category: \(questionToUse.category), Difficulty: \(questionToUse.difficulty), Type: \(questionToUse.type)"
        cell.detailTextLabel?.text = detailText
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell {
            if segue.identifier == "Detail Segue" {
                if let detailViewController = segue.destination as? DetailViewController {
                    let selectedQuestion = questions[(tableView.indexPath(for: cell)?.row)!]
                    print(selectedQuestion.question)
                    detailViewController.selectedQuestion = selectedQuestion
                }
            }
        }
    }
}

