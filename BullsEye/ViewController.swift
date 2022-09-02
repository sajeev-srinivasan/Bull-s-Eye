//
//  ViewController.swift
//  BullsEye
//
//  Created by Sajeev S on 02/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var target = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = slider.value.rounded()
        currentValue = Int(value)
        startNewRound()
    }

    @IBAction func showAlert() {
        
        let message = "The value of the slider is \(currentValue)"
        let alert = UIAlertController(title: "Bull's Eye", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Close", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    
    func startNewRound(){
        target = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        targetLabel.text = String(target)
    }
}
