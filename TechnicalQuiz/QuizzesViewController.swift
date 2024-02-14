//
//  QuizzesViewController.swift
//  TechnicalQuiz
//
//  Created by Александр Плешаков on 14.02.2024.
//

import UIKit

final class QuizzesViewController: UIViewController {
    // MARK: Properties
    let allQuizzes = ["Linux", "BASH", "PHP", "Docker", "HTML", "MySQL", "WordPress", "Laravel", "Kubernetes", "JavaScript", "DecOps"]
    
    // MARK: Outlets
    
    @IBOutlet weak var QuizzesTableView: UITableView!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Methods
    
    private func configure() {
        
    }
}

// MARK: UITableViewDataSource

extension QuizzesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allQuizzes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "QuizCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = allQuizzes[indexPath.row]
        cell.contentConfiguration = content
        
        return cell
    }
}

// MARK: UITableViewDelegate
