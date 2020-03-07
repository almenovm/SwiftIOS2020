//
//  ViewController.swift
//  midapp
//
//  Created by Madiyar Almen on 3/7/20.
//  Copyright © 2020 kbtu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    @IBAction func selectExactcolor(_ sender: Any) {
//          button1.onSelect = { [weak self] color in
//                  guard let self = self else { return }
//
//                  self.button.backgroundColor = color
//              }
    }
    
    @IBOutlet weak var view1: UIView!
    @IBAction func selecColor(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard
            let selectVC = storyboard.instantiateViewController(identifier: "select") as? SelectColor
        else { return }
        
        selectVC.onSelect = { [weak self] color in
            guard let self = self else { return }
            
            if sender.tag == 1 {
            self.button1.backgroundColor = color
            }
            if sender.tag == 2 {
                      self.button2.backgroundColor = color
            }
            if sender.tag == 3 {
                                 self.button3.backgroundColor = color
            }
            if sender.tag == 4 {
                                 self.button4.backgroundColor = color
            }
            
        }
        
        

        self.present(selectVC, animated: true)
    }

}

