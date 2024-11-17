//
//  ResultViewController.swift
//  Assignment3
//
//  Created by Виталий Сухинин on 15.11.2024.
//

import UIKit

class ResultViewController: UIViewController {
    
    var totalCorrectAnswers = 0

    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "Your result is \(totalCorrectAnswers)/\(QuestionBank.shared.questions.count)"
        // Do any additional setup after loading the view.
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
