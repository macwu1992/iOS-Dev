//
//  ViewController.swift
//  BullsEye
//
//  Created by 吴童 on 2017/2/7.
//  Copyright © 2017年 吴童. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    var currentValue: Int = 0
    var targetValue: Int = 0
    var round = 0
    var score = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        
        slider.setThumbImage(thumbImageNormal, for: .normal)
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let sliderTrackLeft = #imageLiteral(resourceName: "SliderTrackLeft")
        let sliderTrackRight = #imageLiteral(resourceName: "SliderTrackRight")
        
        let sliderTrackLeftResizable = sliderTrackLeft.resizableImage(withCapInsets: insets)
        let sliderTrackRightResizable = sliderTrackRight.resizableImage(withCapInsets: insets)
        
        slider.setMinimumTrackImage(sliderTrackLeftResizable, for: .normal)
        slider.setMaximumTrackImage(sliderTrackRightResizable, for: .normal)
        
        startNewGame()
        update()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startNewRound() {
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    func update() {
        targetLabel.text = "\(targetValue)"
        roundLabel.text = "\(round)"
        scoreLabel.text = "\(score)"
    }
    
    func calScore() -> (points: Int, title: String) {
        var difference: Int = 0
        
        var points: Int = 0
        
        difference = abs(currentValue - targetValue)
        
        points = 100 - difference
        
        score += points
        
        if difference == 0 {
            title = "Excellent!"
        }
        else if difference < 10 {
            title = "Very Close!"
        }
        else if difference > 10 && difference < 20 {
            title = "Not Bad"
        }else {
            title = "Try Again"
        }
        
        return (points, title!)
    }
    
    func startNewGame() {
        round = 0
        score = 0
        startNewRound()
    }
    
    @IBAction func startOver() {
        startNewGame()
        update()
        
        let transition = CATransition()
        
        transition.type = kCATransitionFade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        view.layer.add(transition, forKey: nil)
    }

    @IBAction func showAlert(){
        var points: Int = 0
        var title = ""
        
        (points, title) = calScore()
        
        let message = "Your score is: " + "\n\(points)"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Continue", style: .default, handler: {action in self.startNewRound(); self.update()})
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func slideMoved(slider: UISlider){
        currentValue = lroundf(slider.value)
        
//        print("The value of slider now is: \(currentValue)")
    }
}

