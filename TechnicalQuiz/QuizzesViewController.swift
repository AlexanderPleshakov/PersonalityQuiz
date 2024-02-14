//
//  QuizzesViewController.swift
//  TechnicalQuiz
//
//  Created by Александр Плешаков on 14.02.2024.
//

import UIKit

final class QuizzesViewController: UIViewController {
    // MARK: Properties
    let allQuizzes = ["Linux", "BASH", "PHP", "Docker", "HTML", "MySQL", "WordPress", "Laravel", "Kubernetes", "JavaScript", "DevOps"]
    
    // MARK: Outlets
    
    @IBOutlet weak var quizzesTableView: UITableView!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    // MARK: Methods
    
    private func configure() { }
    
    // MARK: Actions
    
    @IBSegueAction func goToQuizIntroduction(_ coder: NSCoder, sender: Any?) -> IntroductionQuizViewController? {
        let quizTitle: String?
        if let cell = sender as? UITableViewCell,
           let indexPath = quizzesTableView.indexPath(for: cell) {
            quizTitle = allQuizzes[indexPath.row]
        } else {
            quizTitle = nil
        }
        return IntroductionQuizViewController(coder: coder, quizTitle: quizTitle)
    }
}

// MARK: UITableViewDataSource

extension QuizzesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allQuizzes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = allQuizzes[indexPath.row]
        cell.contentConfiguration = content
        
        return cell
    }
}

// MARK: UITableViewDelegate

extension QuizzesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer { tableView.deselectRow(at: indexPath, animated: true) }
        performSegue(withIdentifier: "StartQuiz", sender: tableView.cellForRow(at: indexPath))
    }
}


