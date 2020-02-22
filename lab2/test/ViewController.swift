//
//  ViewController.swift
//  test
//
//  Created by Madiyar Almen on 1/18/20.
//  Copyright © 2020 kbtu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let model = CalculatorMVC()
    @IBOutlet weak var resultL: UILabel!
    @IBOutlet var collectionOfButtons: Array<UIButton>?
    
  
    override func viewDidLoad() {
           super.viewDidLoad()
//        for btn in collectionOfButtons! {
//                  btn.layer.cornerRadius=150
//              }
     
    }
    
    func testNotUnary(comand: String) -> Bool
         {
             if(comand != "÷" && comand != "x" && comand != "+" && comand != "x^y" && comand != "-")
         {
             return true
         }
             return false
         }
       
    

    @IBAction func pressNumb(_ sender: UIButton) {
        
        guard
            let numberText = sender.titleLabel?.text
        else { return }
        
        resultL.text?.append(numberText)
    }
    
    @IBAction func deleteAC(_ sender: UIButton) {
        resultL.text="0"
    }
    
    @IBAction func OperationPressed(_ sender: UIButton) {
        
        guard
                let numberText = resultL.text,
                let number = Double(numberText),
                let operation = sender.titleLabel?.text
            else {
                return
            }
            
            resultL.text = "0"
            model.setOperand(number: number)
            model.executeOperation(symbol: operation)
            
        
        if operation == "=" {
                      resultL.text = "\(model.result)"
                  }
        
        if(testNotUnary(comand: operation)){
                    resultL.text=String(model.result)
                  }
        }
    
   
    
        
        
    }
    
    
    
    
   



