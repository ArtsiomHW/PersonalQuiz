//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 12.02.2024.
//

import UIKit

final class ResultViewController: UIViewController {

    @IBOutlet var resultTitleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var questionsResults: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true

        let mostFrequentAnimal = findMostFrequent()
        resultTitleLabel.text = "Вы — \(mostFrequentAnimal?.rawValue ?? " ")"
        descriptionLabel.text = mostFrequentAnimal?.definition ?? " "
        
    }
    
    private func findMostFrequent() ->  Animal? {
        return questionsResults
            .reduce(into: [:]) { counts, answer in
                counts[answer.animal, default: 0] += 1
            }
            .max(by: { $0.value < $1.value })?
            .key
    }
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
}
