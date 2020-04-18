//
//  ViewController.swift
//  Roshambo Attempt
//
//  Created by Simon Wells on 2020/4/16.
//  Copyright © 2020 Simon Wells. All rights reserved.
//

import UIKit

class  ChoiceViewController: UIViewController {
    
    @IBAction func playPaper(_ sender: Any) {
          let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        if let sender = sender as? UIButton {
              vc.userChoice = getUserShape(sender)
                  present(vc, animated: true, completion: nil)
    }
}

    @IBAction func playRock(_ sender: Any) {
        performSegue(withIdentifier: "play", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if segue.identifier == "play" {
        let vc = segue.destination as! ResultsViewController
        vc.userChoice = getUserShape(sender as! UIButton)
    }
        
        
        
        
        
}
func getUserShape(_ sender: UIButton) -> Shape {
 let shape = sender.title(for: UIControl.State())!
    return Shape(rawValue: shape)!
}



}
