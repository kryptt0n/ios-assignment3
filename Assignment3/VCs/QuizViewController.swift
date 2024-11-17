//
//  QuizViewController.swift
//  Assignment3
//
//  Created by Виталий Сухинин on 15.11.2024.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var quizProgress: UIProgressView!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    
    var currentQuestion = 0
    var correctAnswers = 0
    var shuffledAnswers: [String] = []
    var shuffledCorrectAnswerIndex: Int = 0
    
    var answerButtons : [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerButtons.append(contentsOf: [firstButton, secondButton, thirdButton, fourthButton])
        
        if QuestionBank.shared.questions.isEmpty {
            dismiss(animated: true)
        }
        
        loadQuestion()
        
    }
    
    
    @IBAction func answerPressed(_ sender: UIButton) {
        if sender.tag == shuffledCorrectAnswerIndex {
            correctAnswers += 1
        }
        
        if isLastQuestion() {
            performSegue(withIdentifier: "resultSegue", sender: sender)
        } else {
            currentQuestion += 1
            loadQuestion()
        }
    }
    
    func loadQuestion() {
        
        let question = QuestionBank.shared.questions[currentQuestion]

        questionLabel.text = question.question
        
        shuffledAnswers = question.answers.shuffled()
        shuffledCorrectAnswerIndex = shuffledAnswers.firstIndex(of: question.answers[0]) ?? 0
        
        for (index, button) in answerButtons.enumerated() {
            answerButtons[index].setTitle(shuffledAnswers[index], for: .normal)
            button.tag = index
        }
        
        updateProgress()
    }
    
    func updateProgress() {
        quizProgress.progress = Float(currentQuestion) / Float(QuestionBank.shared.questions.count)
    }
    
    func isLastQuestion() -> Bool {
        return currentQuestion >= QuestionBank.shared.questions.count - 1
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue" {
            var mvc = segue.destination as! ResultViewController
            mvc.totalCorrectAnswers = correctAnswers
        }
    }
    

}
