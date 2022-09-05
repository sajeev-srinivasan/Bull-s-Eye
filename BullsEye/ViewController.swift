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
    var score = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = slider.value.rounded()
        currentValue = Int(value)
        startNewRound()
    }

    @IBAction func showAlert() {
        
        let difference = abs(target - currentValue)
        let points = 100 - difference
        let message = "The points scored is \(points)"
        let alert = UIAlertController(title: "Bull's Eye", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Close", style: .default, handler: nil)
        
        score += points
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        let value = slider.value.rounded()
        currentValue = Int(value)
    }
    
    func startNewRound(){
        target = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels(){
        targetLabel.text = String(target)
        scoreLabel.text = String(score)
    }
}
