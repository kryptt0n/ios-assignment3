//
//  QuestionDetailViewController.swift
//  Assignment3
//
//  Created by Виталий Сухинин on 15.11.2024.
//

import UIKit

class QuestionDetailViewController: UIViewController {
    
    var selectedQuestion: Int?
    var delegate: AddNewQuestionDelegate?

    @IBOutlet weak var thirdIncorrectInput: UITextField!
    @IBOutlet weak var secondIncorrectInput: UITextField!
    @IBOutlet weak var firstIncorrectInput: UITextField!
    @IBOutlet weak var correctAnswerInput: UITextField!
    @IBOutlet weak var questionInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let goodIndex = selectedQuestion, goodIndex > -1 {
            var question = QuestionBank.shared.questions[goodIndex]
            questionInput.text = question.question
            correctAnswerInput.text = question.answers[0]
            firstIncorrectInput.text = question.answers[1]
            secondIncorrectInput.text = question.answers[2]
            thirdIncorrectInput.text = question.answers[3]
        }
    }
    
    @IBAction func doneClicked(_ sender: UIBarButtonItem) {
        var answers = [String]()
        print("here")
        answers.append(correctAnswerInput.text ?? "")
        answers.append(firstIncorrectInput.text ?? "")
        answers.append(secondIncorrectInput.text ?? "")
        answers.append(thirdIncorrectInput.text ?? "")
        
        if let goodIndex = selectedQuestion, goodIndex > -1 {
            QuestionBank.shared.questions[goodIndex].question = questionInput.text ?? ""
            QuestionBank.shared.questions[goodIndex].answers = answers
        } else {
            var question = Question()
            question.question = questionInput.text ?? ""
            question.answers = answers
            QuestionBank.shared.questions.append(question)
        }
        delegate!.newQuestionSaved()
        dismiss(animated: true)
    }

    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
