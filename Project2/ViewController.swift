//
//  ViewController.swift
//  Project2
//
//  Created by Karen Vardanian on 06.12.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
   
    @IBOutlet var scorePoints: UILabel!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(scoreButton))
        
        countries += ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "Uk", "Us"]
       let buttons = [button1, button2, button3]
        
        for button in buttons {
            button?.layer.shadowRadius = 10
            button?.layer.shadowOpacity = 1.0
            button?.layer.shadowOffset = CGSize(width: 3, height: 3)
            button?.layer.shadowColor = UIColor.gray.cgColor
        }
        
        askQuestion()
    }
    func askQuestion(action: UIAlertAction! = nil)  {
        view.backgroundColor = UIColor.systemMint
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased()
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let answer = sender.tag
        var title: String
        
        if correctAnswer == answer {
            title = "You are win !!!💪"
            score += 1
            scorePoints.text = "Score: \(score)"
            view.backgroundColor = UIColor.green
        } else {
            title = "LOSER, correct \(countries[correctAnswer])"
            score -= 1
            scorePoints.text = "Score: \(score)"
            view.backgroundColor = UIColor.red
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
        
        let ac2 = UIAlertController(title: "10 question asked", message: "You taped 10 times", preferredStyle: .alert)
        ac2.addAction(UIAlertAction(title: "Ok", style: .default))
        present(ac2, animated: true)
    }
    
    @objc func scoreButton () {
        
        
        
        let vc = UIActivityViewController(activityItems: [score], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
    
}

