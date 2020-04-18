//
//  ResultsViewController.swift
//  Roshambo Attempt
//
//  Created by Simon Wells on 2020/4/16.
//  Copyright © 2020 Simon Wells. All rights reserved.
//

import UIKit


class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    
static func randomShape() -> Shape {
    let shapes = ["Rock", "Paper", "Scissors"]
    let randomChoice = Int(arc4random_uniform(3))
    return Shape(rawValue: shapes[randomChoice])!
}
    
    var userChoice: Shape!
    var opponentsChoice: Shape = randomShape()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displayResult()
    }
    
    func displayResult() {
        var imageName: String
        var text: String
        let matchUp = "\(userChoice.rawValue) vs. \(opponentsChoice.rawValue)"


switch (userChoice!, opponentsChoice) {
     case let (user, opponent) where user == opponent:
         text = "\(matchUp): It's a tie!"
         imageName = "itsATie"
     case (.Rock, .Scissors), (.Paper, . Rock), (.Scissors, .Paper):
         text = "You win with \(matchUp)"
         imageName = "\(userChoice.rawValue)-\(opponentsChoice.rawValue)"
     default: text = "You lose with \(matchUp)"
     imageName = "\(opponentsChoice.rawValue)-\(userChoice.rawValue)"
     }
     
      imageName = imageName.lowercased()
        resultImage.image = UIImage(named: imageName)
        resultLabel.text = text
    }
    @IBAction func playAgain(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

enum Shape: String {
    case Rock = "Rock"
    case Paper = "Paper"
    case Scissors = "Scissors"
}

