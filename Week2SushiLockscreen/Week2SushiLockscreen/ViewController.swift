//
//  ViewController.swift
//  Week2SushiLockscreen
//
//  Created by Anna Oh on 13/2/2019.
//  Copyright © 2019 Anna Oh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    ///Guide
    @IBOutlet weak var selectLabel: UILabel!
    
    //soyplate
    @IBOutlet weak var soy1: UIImageView!
    
    ///dots
    @IBOutlet weak var dot1: UIImageView!
    @IBOutlet weak var dot2: UIImageView!
    @IBOutlet weak var dot3: UIImageView!
    
    ///ResetButton
    @IBOutlet weak var resetButton: UIButton!
    
    ///sushibuttons
//        @IBOutlet weak var button1: UIButton!
        @IBOutlet weak var button2: UIButton!
//    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button3: UIButton!
        @IBOutlet weak var button4: UIButton!
        @IBOutlet weak var button5: UIButton!
        @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button1: UIButton!
    
    // UNLOCK SEQEUNCE.
    // Used to compare to input pattern.
    let lockPattern = [2, 5, 3]
    
    // Array to capture input from button taps.
    var inputPattern = [Int]()

    //Override setup function already provided by parent class.
        override func viewDidLoad() {
            super.viewDidLoad()
            // Reset screen on app start.
//            resetScreen()
    }

    @IBAction func didTapReset(_ sender: UIButton) {
        resetScreen()
    
    }
    
    
    //     Helper method to reset the screen.
    func resetScreen() {
        // Initialize status label.
       selectLabel.text = "SELECT THREE"

        // Dim dots.
        dot1.alpha = 0.2
        dot2.alpha = 0.2
        dot3.alpha = 0.2

        // Reset button is initially hidden.
        resetButton.isHidden = true

        // Flush input pattern.
        inputPattern.removeAll()
    }

    
//    @IBAction func sushiButton1(_ sender: UIButton) {
//        processInputPattern(inputNumber: 0)
//    }
    
    @IBAction func sushiButton1(_ sender: UIButton) {
        processInputPattern(inputNumber: 0)
    }
//    @IBAction func sushiButton1(_ sender: Any) {
//        print("")
//    }
    @IBAction func sushiButton2(_ sender: UIButton) {
        processInputPattern(inputNumber: 1)
    }
    
    @IBAction func sushiButton3(_ sender: UIButton) {
        processInputPattern(inputNumber: 2)
    }
    @IBAction func sushiButton4(_ sender: UIButton) {
         processInputPattern(inputNumber: 3)
    }
    @IBAction func sushiButton5(_ sender: UIButton) {
         processInputPattern(inputNumber: 4)
    }
    
    @IBAction func sushiButton6(_ sender: UIButton) {
          processInputPattern(inputNumber: 5)
    }
    
    //Logic for different stages of the input sequence.
    func processInputPattern(inputNumber: Int) {
        // Append passed in inputNumber into input pattern array.
        inputPattern.append(inputNumber)
  
    // Check where we are in the sequence by inspecting array count.
    if inputPattern.count == 1 {
    
        // Highlight dot 1.
        dot1.alpha = 1
        
        soy1.image = UIImage(named: "soy2")
        
    } else if inputPattern.count == 2 {
    
    // Highlight dot 2.
    dot2.alpha = 1

        soy1.image = UIImage(named: "soy3")

        
    } else if inputPattern.count == 3 {
    
    // Check if pattern matches or need to try again.
    if inputPattern == lockPattern {
    // Highlight icon 3.
   dot3.alpha = 1

    // Update status message.
     selectLabel.text = "UNLOCKED"
    
    // Reveal reset button.
    resetButton.isHidden = false
    } else {
    // Reset feedback icons.
    dot1.alpha = 0.2
    dot2.alpha = 0.2
    dot3.alpha = 0.2

        soy1.image = UIImage(named: "Soy1")

    
    // Update status message.
    selectLabel.text = "TRY AGAIN"
    
    // Flush input pattern.
    inputPattern.removeAll()
    }
    }
}
}

