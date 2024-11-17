//
//  Question.swift
//  Assignment3
//
//  Created by Виталий Сухинин on 15.11.2024.
//

import Foundation

class Question {
    
    var question: String
    var answers: [String]
    
    init(question: String, answers: [String]) {
        self.question = question
        self.answers = answers
    }
    
    init() {
        question = ""
        answers = [String]()
    }
    
}
