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
    var roundNumber = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlight")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage?.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")
        let trackRightResizable = trackRightImage?.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        }

    @IBAction func showAlert() {
        
        let points = getPoints()
        let title = getAlertTitle()
        let message = "The points scored is \(points)"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Close", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        let value = slider.value.rounded()
        currentValue = Int(value)
    }
    
    func startNewRound(){
        roundNumber += 1
        target = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    @IBAction func startNewGame(){
        roundNumber = 0
        score = 0
        startNewRound()
    }
    
    func getAlertTitle() -> String {
        var title: String
        let difference = findDifference()
        
        switch (difference) {
            case 0:
                title = "Perfect!"
            case 1..<5:
                title = "Almost had it"
            case 5..<10:
                title = "Pretty good"
            default:
                title = "Not even close.."
        }
        
        return title
    }
    
    func getPoints() -> Int {
        let difference = findDifference()
        var point = 100 - difference
        
        updateScore(point)
        
        switch (difference) {
            case 0:
                point += 100
            case 1:
                point += 50
            default:
                point += 0
        }
        
        return point
    }
    
    func findDifference() -> Int {
        abs(target - currentValue)
    }
    
    func updateScore(_ points: Int){
        score += points
    }
    
    func updateLabels(){
        targetLabel.text = String(target)
        scoreLabel.text = String(score)
        roundNumberLabel.text = String(roundNumber)
    }
}
