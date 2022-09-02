//
//  ViewController.swift
//  BullsEye
//
//  Created by Sajeev S on 02/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func showAlert() {
        
        let alert = UIAlertController(title: "Hey Sajeev", message: "This is BullsEye!!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Close", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        print("Value of the slider: \(slider.value)")
    }
}
