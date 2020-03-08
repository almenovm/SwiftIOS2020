//
//  VCparameters.swift
//  viewcreator
//
//  Created by Madiyar Almen on 2/29/20.
//  Copyright © 2020 kbtu. All rights reserved.
//

import Foundation
import UIKit

class VCparameters: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var v_width: UITextView!
    @IBOutlet weak var v_length: UITextView!
    @IBOutlet weak var v_x: UITextView!
    @IBOutlet weak var v_y: UITextView!
    var selectedColor: UIColor?
    var newView: UIView?
  

    @IBAction func selectColor(_ sender: UIButton) {
        
        if sender.tag == 1 {
            selectedColor = UIColor.red
        }
        else
            if sender.tag == 2 {
            selectedColor = UIColor.purple
        }
        else
        if sender.tag == 3 {
        selectedColor = UIColor.green
        }
        else
        if sender.tag == 4 {
        selectedColor = UIColor.yellow
        }
    }
    
     var view_measures: ((_ width: Double, _ lenght: Double, _ x: Double, _ y: Double, _ color: UIColor) -> Void)? = nil
    
     override func viewWillAppear(_ animated: Bool) {
      
            selectedViewData()
            navControl()
        }
      
    func selectedViewData() {
    guard let view = newView else {return}
         print(view.frame.width)
         self.v_width.text = view.frame.width.description
         self.v_length.text = view.frame.height.description
         self.v_x.text = view.frame.origin.x.description
         self.v_y.text = view.frame.origin.y.description
    }
    
    func navControl (){
            let deleteButton = UIBarButtonItem(title: "delete", style: .plain, target: self, action: #selector(deleteView))
        
            let saveButton = UIBarButtonItem(title: "save", style: .plain, target: self, action: #selector(saveView))
                 
            guard newView != nil else {
                    
                navigationItem.rightBarButtonItems = [ saveButton]
                return
                    
                 }
        
                 navigationItem.rightBarButtonItems = [deleteButton, saveButton]
    }
    
    @objc func deleteView() {
        
           guard let view = newView else {return}
           view.removeFromSuperview()
           self.navigationController?.popViewController(animated: true)
        
       }
    
    @objc func saveView() {
           
           guard let width = v_width.text, let lenght = v_length.text, let x = v_x.text, let y = v_y.text, let color = selectedColor else {
            
               let alert = UIAlertController(title: "Ошибка", message: "Не все поля заполнены", preferredStyle: .alert)
            
               alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))
               self.present(alert, animated: true)
               return
            
               }
        
           guard let d_width = Double(width), let d_lenght = Double(lenght), let d_x = Double(x), let d_y = Double(y) else {
               let alert = UIAlertController(title: "Ошибка", message: "Неправильный тип введенных данных", preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))
               self.present(alert, animated: true)
               return
               }
        
           let screenSize = UIScreen.main.bounds
           
           if CGFloat(d_width) > screenSize.width || CGFloat(d_lenght) > screenSize.height {
               let alert = UIAlertController(title: "Ошибка", message: "Введенные параметры превышают размер экрана", preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
               self.present(alert, animated: true)
               return
           }
           
           guard let view = newView else {
               view_measures?(d_width, d_lenght, d_x, d_y, color)
               self.navigationController?.popViewController(animated: true)
               return
           }
           
           view.backgroundColor = color
        
           view.frame = CGRect(x: CGFloat(d_x), y: CGFloat(d_y), width: CGFloat(d_width), height: CGFloat(d_lenght))
    
           self.navigationController?.popViewController(animated: true)
       }

}
