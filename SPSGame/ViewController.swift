//
//  ViewController.swift
//  SPSGame
//
//  Created by Anson Ng on 5/2/17.
//  Copyright © 2017 Anson Ng. All rights reserved.
//

// Some New Comments over here

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outResults: UILabel!
    
    enum HandShape : UInt32
    {
        case rock
        case paper
        case scissors
        
        private static let _count : HandShape.RawValue =
            {
                var maxValue : UInt32 = 0
                while let _ = HandShape(rawValue:maxValue){
                    maxValue += 1
                }
                return maxValue
        } ()
        
        static func randomChoose() -> HandShape {
            // pick and return a new value
            let rand = arc4random_uniform(_count)
            return HandShape(rawValue: rand)!
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    @IBAction func pressRock(_ sender: Any)
    {
        generateSPS(ChosenHand: .rock)
    }
    
    @IBAction func pressPaper(_ sender: Any)
    {
        generateSPS(ChosenHand: .paper)
    }

    @IBAction func pressScissors(_ sender: Any)
    {
        generateSPS(ChosenHand: .scissors)
    }
    
    func generateSPS (ChosenHand chosenHand : HandShape) //From Online
    {
        enum MatchResult
        {
            case win
            case draw
            case lose
        }
        
        func match(_ first: HandShape, _ second: HandShape) -> MatchResult
        {
            if first == second {
                return .draw
            }
            
            if first == .rock && second == .scissors {
                return .win
            }
            
            if first == .paper && second == .rock {
                return .win
            }
            
            if first == .scissors && second == .paper {
                return .win
            }
            
            return .lose
        }
        
        let random = HandShape.randomChoose()
        print(random)
        outResults.text = String(describing: match(chosenHand, random))

    }
    
    /*
     DO NOT TOUCH CODES
    */
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

