//
//  ViewController.swift
//  AC-iOS-GeneralKnowledgeQuiz
//
//  Created by Tom Seymour on 11/7/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var questions: [Question] = []
    var filteredQuestions: [Question] = []
    var difficulty: String = ""
    var type: String = ""
    var category: String = ""
//    var strTuple: (difficulty: String, type: String, category: String) {
//        return (difficulty: self.difficulty, type: self.type, category: self.category)
//    }
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        loadData()
        
        
    }
    func loadData() {
        self.questions = Question.questions
        
    }
    func loadDataFromSetting() {
        self.difficulty = Setting.difficulty
        self.type = Setting.type
        self.category = Setting.category
    }
    
   override func viewWillAppear(_ animated: Bool) {
        loadDataFromSetting()
    
    if self.difficulty == self.type && self.type == self.category {
       filteredQuestions = self.questions
    } else if self.difficulty == self.type {
        filteredQuestions = questions.filter({$0.category.lowercased() == self.category})
    } else if self.difficulty == self.category {
        filteredQuestions = questions.filter({$0.type.lowercased() == self.type})
    } else if self.type == self.category {
        filteredQuestions = questions.filter({$0.difficulty.lowercased() == self.difficulty})
    } else if self.difficulty == "all" {
        filteredQuestions = questions.filter({$0.type.lowercased() == self.type && $0.category.lowercased() == self.category})
    } else if self.type == "all" {
        filteredQuestions = questions.filter({$0.difficulty.lowercased() == self.difficulty && $0.category.lowercased() == self.category})
    } else if self.category == "all" {
        filteredQuestions = questions.filter({$0.difficulty.lowercased() == self.difficulty && $0.type.lowercased() == self.type})
    } else {
        filteredQuestions = questions.filter({$0.difficulty.lowercased() == self.difficulty && $0.type.lowercased() == self.type && $0.category.lowercased() == self.category})
    }
    
    
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredQuestions.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "Question Cell", for: indexPath)
         if let cell = cell as? TableViewCell {
        cell.nameLabel?.text = filteredQuestions[indexPath.row].question
        cell.categoryLabel?.text = filteredQuestions[indexPath.row].category
        return cell
    }
        return UITableViewCell()
    }
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            let selectedQuestion = filteredQuestions[tableView.indexPathForSelectedRow!.row]
            destination.question = selectedQuestion
        }
    }

}








