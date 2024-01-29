//
//  ViewController.swift
//  CodePath Intro
//
//  Created by Elias Woldie on 1/24/24.
//

import UIKit

class ViewController: UIViewController {
    

  
    @IBOutlet weak var changeBGButton: UIButton!
    @IBOutlet weak var introduceButton: UIButton!
    @IBOutlet weak var morePetsSwitch: UISwitch!
    @IBOutlet weak var morePetsStepper: UIStepper!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var schoolNameTextField: UITextField!
    @IBOutlet weak var yearSegmentedControl: UISegmentedControl!
    @IBOutlet weak var numberOfPetsLabel: UILabel!
    
    
    override func viewDidLoad() {
           super.viewDidLoad()
            styleButton(introduceButton)
            styleButton(changeBGButton)
       }

    
    func styleButton(_ button: UIButton) {
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)

        button.layer.cornerRadius = button.frame.height / 2
        button.clipsToBounds = true

        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.25
    }
    
    
    @IBAction func stepperDidChange(_ sender: UIStepper) {
        numberOfPetsLabel.text = "\(Int(sender.value))"
    }
    

    @IBAction func introduceSelfDidTapped(_ sender: UIButton) {
 
        // Let's us choose the title we have selected from the segmented control
        let year = yearSegmentedControl.titleForSegment(at: yearSegmentedControl.selectedSegmentIndex)

        // Creating a variable of type string, that holds an introduction. The introduction interpolates the values from the text fields provided.
        // Currently, we can only present the information in a print statement. However, this lets us verify that our app is printing out what is intended!
        let introduction = "My name is \(firstNameTextField.text!) \(lastNameTextField.text!) and I attend \(schoolNameTextField.text!). I am currently in my \(year!) year and I own \(numberOfPetsLabel.text!) dogs. It is \(morePetsSwitch.isOn) that I want more pets."


        // Creates the alert where we pass in our message, which is our introduction.
        let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)

        // A way to dismiss the box once it pops up
        let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)

        // Passing this action to the alert controller so it can be dismissed
        alertController.addAction(action)

        present(alertController, animated: true, completion: nil)
    }
  

    @IBAction func changeBGTapped(_ sender: Any) {
        // Change the background color to a random color every time the button is tapped.
                UIView.animate(withDuration: 0.5) { [weak self] in
                        self?.view.backgroundColor = UIColor(
                            red: CGFloat.random(in: 0...1),
                            green: CGFloat.random(in: 0...1),
                            blue: CGFloat.random(in: 0...1),
                            alpha: 1.0
                        )
                    }
                }
    
}

