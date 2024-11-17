//
//  QuestionListViewController.swift
//  Assignment3
//
//  Created by Виталий Сухинин on 15.11.2024.
//

import UIKit

class QuestionListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddNewQuestionDelegate {
    
    
    
    @IBOutlet weak var questionsTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return QuestionBank.shared.questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = QuestionBank.shared.questions[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        var content = cell.defaultContentConfiguration()
        content.text = item.question
        
        cell.contentConfiguration = content
    
        return cell
    }
    
    func newQuestionSaved() {
        questionsTableView.reloadData()
    }
    
    @IBAction func backClicked(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var selectedIndex = -1
        if let sender = sender as? UITableViewCell {
            selectedIndex = questionsTableView.indexPathForSelectedRow!.row
        }
        
        var mvc = segue.destination as! QuestionDetailViewController
        mvc.selectedQuestion = selectedIndex
        mvc.delegate = self
        
    }
    

}
