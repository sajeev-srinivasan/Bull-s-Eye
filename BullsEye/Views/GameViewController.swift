//
//  ViewController.swift
//  BullsEye
//
//  Created by Sajeev S on 02/09/22.
//

import UIKit

class ViewController: UIViewController {

    var gameController: GameController = GameController()
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameController.startNewGame()
        configSlider()
        updateLabelsAndSlider()
        }

    @IBAction func showAlert() {
        
        let points = gameController.getPoints()
        let title = gameController.getAlertTitle()
        let message = "The points scored is \(points)"
        
        alertBox(title: title, message: message) { _ in
            self.gameController.startNewRound()
            self.updateLabelsAndSlider()
        }
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        let value = slider.value.rounded()
        gameController.getSliderValue(sliderValue: Int(value))
    }
    
    @IBAction func startOver(){
        gameController.startNewGame()
        updateLabelsAndSlider()
    }
    
    private func updateLabelsAndSlider(){
        let values = gameController.updateLabelText()
        targetLabel.text = String(values["targetLabel"]!)
        scoreLabel.text = String(values["scoreLabel"]!)
        roundNumberLabel.text = String(values["roundNumberLabel"]!)
        slider.value = Float(values["sliderValue"]!)
    }
    
    private func configSlider(){
        
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
    
    private func alertBox(title: String, message: String, handler: @escaping (UIAlertAction) -> Void){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Close", style: .default, handler: handler)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

}
