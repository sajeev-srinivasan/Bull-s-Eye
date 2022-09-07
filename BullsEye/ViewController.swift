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
        
        let pointTitle = getPointsAndTitle()
        
        let message = "The points scored is \(pointTitle.0)"
        let alert = UIAlertController(title: pointTitle.1, message: message, preferredStyle: .alert)
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
    
    func getPointsAndTitle() -> (Int, String) {
        let difference = findDifference()
        var points = 100 - difference
        var title: String
        
        updateScore(points)
        
        if difference == 0 {
            title = "Perfect!"
            points += 100
        }

        else if difference < 5 {
            title = "Almost had it"

            if difference == 1 {
                points += 50
            }
        }

        else if difference < 10 {
            title = "Pretty good"
        }

        else {
            title = "Not even close.."
        }
        
        return (points, title)
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
