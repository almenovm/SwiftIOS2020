//
//  ViewController.swift
//  viewcreator
//
//  Created by Madiyar Almen on 2/29/20.
//  Copyright © 2020 kbtu. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func plusButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "select") as VCparameters
        
         vc.view_measures = { [weak self] width, lenght, x, y, color in
             guard let self = self else { return }
                     
             let view = UIView(frame: CGRect(x: x, y: y, width: width, height: lenght))
             view.backgroundColor = color
             self.view.addSubview(view)
                     
             let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.DidTap))
             view.addGestureRecognizer(tapGestureRecognizer)
         
             let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.DidPan))
             view.addGestureRecognizer(panGestureRecognizer)
         
             let pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(self.DidPinch))
             view.addGestureRecognizer(pinchGestureRecognizer)
         }
         navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @objc func DidTap(_ sender: UITapGestureRecognizer) {
        if let view = sender.view {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "select") as VCparameters
            vc.newView = view
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    var originPoint: CGPoint!
    
    @objc func DidPan(_ recognizer: UIPanGestureRecognizer) {
        
        if let view = recognizer.view {
            
            switch recognizer.state {
                
            case .began:
                originPoint = view.frame.origin
                
            case .changed:
                let d = recognizer.translation(in: view)
                view.frame.origin.x = originPoint.x + d.x
                view.frame.origin.y = originPoint.y + d.y
                default: break
         }
      }
    }
    
    @objc func DidPinch(_ sender: UIPinchGestureRecognizer) {
        if let view = sender.view {
            if sender.state == .began || sender.state == .changed {
                view.transform = (view.transform.scaledBy(x: sender.scale, y: sender.scale))
                sender.scale = 2.2
          }
     }
  }
    
}

