
import Foundation

struct GameController {
    
    var game: BullsEye = BullsEye()
    
    var difference: Int = 0
    var points: Int = 0
    
    enum labelKeys {
        case targetLabel, scoreLabel, roundNumberLabel, sliderValue
    }
    
    mutating func startNewGame() {
        game.roundNumber = 0
        game.score = 0
        startNewRound()
    }
    
    mutating func startNewRound(){
        game.roundNumber += 1
        game.target = Int.random(in: 1...100)
        game.currentValue = 50
    }
    
    mutating func getSliderValue(sliderValue: Int){
        game.currentValue = sliderValue
    }
    
    mutating func getAlertTitle() -> String {
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
    
    mutating func getPoints() -> Int {
        let difference = findDifference()
        var point = 100 - difference
        
        switch (difference) {
            case 0:
                point += 100
            case 1:
                point += 50
            default:
                point += 0
        }
        
        updateScore(point)
        
        return point
    }
    
    func updateLabelText() -> [labelKeys:Int] {
        return [.targetLabel : game.target,
                .scoreLabel : game.score,
                .roundNumberLabel : game.roundNumber,
                .sliderValue : game.currentValue]
    }

    private mutating func findDifference() -> Int {
        abs(game.target - game.currentValue)
    }
    
    private mutating func updateScore(_ points: Int){
        game.score += points
    }
    
}
