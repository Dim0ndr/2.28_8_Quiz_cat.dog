//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 07.07.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet var resultAnimalLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    
    var answersChosen: [Answer]?
    
    // 1. Передать массив с ответами на экран с результатами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты в соответствии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let animal = getAnimal() {
            resultAnimalLabel.text = String("Вы - \(animal.rawValue)")
            resultDefinitionLabel.text = animal.definition
        }
        
        navigationItem.hidesBackButton = true
        
        
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    
    deinit {
        print("ResultViewController has been deallocated")
    }
    
    private func getAnimal() -> Animal? {
        
        var animalsCounts: [Animal : Int] = [ : ]
        
        if let answers = answersChosen {
            for answer in answers {
                print(answer.animal)
                animalsCounts[answer.animal] = (animalsCounts[answer.animal] ?? 0) + 1
                
            }
        }
        
        let maxAnimalCount = animalsCounts.values.max()
        
        for (animal, value) in animalsCounts {
            if value == maxAnimalCount {
                print("YOU =", animal)
                return animal
            }
         }
        
        return nil
    }
}
