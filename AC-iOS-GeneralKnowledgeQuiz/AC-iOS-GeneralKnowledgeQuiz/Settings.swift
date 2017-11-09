//
//  Settings.swift
//  AC-iOS-GeneralKnowledgeQuiz
//
//  Created by C4Q on 11/9/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import Foundation

enum DiffOption: String {
    case all, easy, medium, hard
}
enum TypeOption: String {
    case all, multiple, boolean
}
enum CateOption: String {
    case all
    case generalKnowledge = "General Knowledge"
    case scienceComputers = "Science: Computers"
    case history = "History"
    case animals = "Animals"
    case sports = "Sports"
    case geography = "Geography"
}



struct Settings {
    static var difficulty: DiffOption = .all
    static var type: TypeOption = .all
    static var category: CateOption = .all
}

