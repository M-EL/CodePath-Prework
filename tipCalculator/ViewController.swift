//
//  ViewController.swift
//  tipCalculator
//
//  Created by Ditry D'ateian on 1/15/22.
//

import UIKit
import SwiftUI


class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var partyCountTextField: UILabel!
    
    @IBOutlet weak var partyCountControl: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    func calculate() {
        
        let tipPercentage = [0, 0.15, 0.18, 0.20]
        
        let bill = Double(billAmountTextField.text!) ?? 0
        
        let count = Int(partyCountControl.value) + 1
        
        partyCountTextField.text = String(count)
        
        let tip = bill * tipPercentage[tipControl.selectedSegmentIndex]
        
        let total = (bill + tip) / Double(count)
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        if count > 1 {
            
            totalLabel.text = String(format: "$%.2f", total) + " / Person"
        } else {
            
            totalLabel.text = String(format: "$%.2f", total)
        }
    }
   
    @IBAction func billAmountControl(_ sender: Any) {
        
      calculate()
    }
    
    @IBAction func partyCount(_ sender: Any) {
        
        calculate()
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        calculate()
    }
    
    
}

