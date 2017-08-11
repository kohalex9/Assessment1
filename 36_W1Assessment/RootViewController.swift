//
//  RootViewController.swift
//  36_W1Assessment
//
//  Created by Alex Koh on 11/08/2017.
//  Copyright © 2017 AlexKoh. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    @IBOutlet weak var firstNumberTextField: UITextField!
    
    @IBOutlet weak var secondNumberTextField: UITextField!
    
    @IBOutlet var nextPageBarBtnTapped: UIBarButtonItem!
    
    var firstNumberFromUser: Int = 0
    var secondNumberFromUser: Int = 0
    var calculationResult: Int = 0
    
    
    override func viewDidLoad() {
        
        self.navigationItem.rightBarButtonItem = nil
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.rightBarButtonItem = nil
    }
    
    @IBAction func addBtnTapped(_ sender: Any) {
        
        calculationResult = extractFirstNumberFromTextField() + extractSecondNumberFromTextField()
        print(calculationResult, "result")
        
        goNextGoogleViewControllerIfResultIs999(calculationResult: calculationResult)
        
        displayGeniusAlertIfAnswerIsMultipleOf9(calculationResult: calculationResult)
        
    }
    
    @IBAction func minusBtnTapped(_ sender: Any) {
        
        calculationResult = extractFirstNumberFromTextField() - extractSecondNumberFromTextField()
        print(calculationResult, "result")
        
        goNextGoogleViewControllerIfResultIs999(calculationResult: calculationResult)
        
        displayGeniusAlertIfAnswerIsMultipleOf9(calculationResult: calculationResult)
        
    }
    
    @IBAction func timesBtnTapped(_ sender: Any) {
        
        calculationResult = extractFirstNumberFromTextField() * extractSecondNumberFromTextField()
        print(calculationResult, "result")
        
        goNextGoogleViewControllerIfResultIs999(calculationResult: calculationResult)
        
        displayGeniusAlertIfAnswerIsMultipleOf9(calculationResult: calculationResult)
        
    }
    
    @IBAction func divideBtnTapped(_ sender: Any) {
        
        extractSecondNumberFromTextField() //update the value of secondNumberFromUser before the next if checking
        extractFirstNumberFromTextField()
        
        if secondNumberFromUser == 0 {
            let alert = UIAlertController(title: "ERROR", message: "Cannot divide by zero", preferredStyle: .alert)
            let action = UIAlertAction(title: "Retry", style: .default) { (action) in }
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
            restartGame()
            return
        } else {
            divide()
        }
    }
    
    func divide() {
        calculationResult = extractFirstNumberFromTextField() / extractSecondNumberFromTextField()
        print(calculationResult, "result")
        
        
        goNextGoogleViewControllerIfResultIs999(calculationResult: calculationResult)
        
        displayGeniusAlertIfAnswerIsMultipleOf9(calculationResult: calculationResult)
    }
    
    func displayGeniusAlertIfAnswerIsMultipleOf9(calculationResult: Int) {
        
        if calculationResult % 9 == 0 {
            displayAlertWithAction(ControllerTitle: "GENIUS", alertTitle: "Restart")
            restartGame()
        }
    }
    
    func displayAlertWithAction(ControllerTitle: String, alertTitle: String) {
        let alert = UIAlertController(title: "\(ControllerTitle)", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "\(alertTitle)", style: .default) { (action) in }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    func restartGame() {
        firstNumberTextField.text = ""
        secondNumberTextField.text = ""
        
        //self.navigationItem.rightBarButtonItem = nil
    }
    
    func extractFirstNumberFromTextField() -> Int {
        if let numberOne = Int(firstNumberTextField.text!) {
            firstNumberFromUser = numberOne
        } else {
            displayAlertWithAction(ControllerTitle: "ERROR", alertTitle: "Enter an integer in first text field")
            restartGame()
        }
        print(firstNumberFromUser, "FirstNumber")
        return firstNumberFromUser
    }
    
    func extractSecondNumberFromTextField() -> Int {
        if let numberTwo = Int(secondNumberTextField.text!) {
            secondNumberFromUser = numberTwo
        } else {
            displayAlertWithAction(ControllerTitle: "ERROR", alertTitle: "Enter an integer in second text field")
            restartGame()
        }
        print(secondNumberFromUser, "SecondNumber")
        return secondNumberFromUser
    }
    
    func goNextGoogleViewControllerIfResultIs999(calculationResult: Int) {
        
        if calculationResult == 999 {
            //only when result is 999, we show the "NEXT PAGE" button
            
            self.navigationItem.rightBarButtonItem =  UIBarButtonItem(title: "Next Page", style: .plain, target: self, action: #selector(goNextGoogleViewController))
            
            restartGame()
        }
    }
    
    func goNextGoogleViewController() {
        
        performSegue(withIdentifier: "showGoogleIdentifier", sender: self)
    }
    
    



}
