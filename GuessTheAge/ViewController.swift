//
//  ViewController.swift
//  GuessTheAge
//
//  Created by Yury on 10/08/2023.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: - IB Outlets
    @IBOutlet weak var personalityImage: UIImageView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    // MARK:  - Properties
    private let personality = Personality.getPersonality() // Getting model of heroes
    private let bornOfYear = BornOfYear.getBornOfYear() // Getting model of years
    private let answers = [1,3,0,1]
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        //  Loading saving setting for picker view and image
        let row  = UserDefaults.standard.integer(forKey: "Hero")
        pickerView.selectRow(row, inComponent: 0, animated: true)
        personalityImage.image = UIImage(named: personality[row].image)
        
    }
    
    // MARK: - IB Actions
    @IBAction func checkAnswerTapped(_ sender: UIButton) {
        
        let nameOfPersonality = pickerView.selectedRow(inComponent: 0)
        let year = pickerView.selectedRow(inComponent: 1)
        
        if answers[nameOfPersonality] == year {
            return showAlert(title: "Congratulations", message: "You correctly entered the year of birth of the hero")
        } else {
            return showAlert(title: "Oop!", message: "It looks like you made a mistake with the year of birth of the hero. Try Again.")
        }
        
    }
    
    // MARK: - PickerView Delegate
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return personality.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    // MARK: - PickerView Data Source
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return personality[row].name
        } else {
            return bornOfYear[row].bornAge
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 { personalityImage.image = UIImage(named: personality[row].image) // Changing hero image
            UserDefaults.standard.set(row, forKey: "Hero") // Saving setting for picker view
        }
    }
    
}

// MARK: - Private Methods
extension ViewController {
    // Show alert window
    private func showAlert (title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let buttonOK = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(buttonOK)
        present(alert, animated: true)
    }
}

