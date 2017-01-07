//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Maman on 07/01/2017.
//  Copyright © 2017 Lionel Eisenberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    var tipPercentages = [0.15, 0.2, 0.25]
    
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "IDSEGUE"{
            let destination = segue.destination as! SettingsViewController
            destination.settingInfo = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        if let one = defaults.string(forKey: "1") {
            tipPercentages[0] = Double(one)!
        }
        if let two = defaults.string(forKey: "2") {
            tipPercentages[1] = Double(two)!
        }
        if let three = defaults.string(forKey: "3") {
            tipPercentages[2] = Double(three)!
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func CalculateTip(_ sender: AnyObject) {
        for i in 0...2 {
            var s = String(format: "%.0f", tipPercentages[i] * 100)
            s+="%"
            tipControl.setTitle(s, forSegmentAt: i)
        }
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

