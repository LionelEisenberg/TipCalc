//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Lionel Eisenberg on 07/01/2017.
//  Copyright © 2017 Lionel Eisenberg. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tipOne: UITextField!
    @IBOutlet weak var tipTwo: UITextField!
    @IBOutlet weak var tipThree: UITextField!
    var settingInfo = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        tipOne.text = String(format: "%.0", settingInfo.tipPercentages[0] * 100)
        tipTwo.text = String(format: "%.0", settingInfo.tipPercentages[1] * 100)
        tipThree.text = String(format: "%.0", settingInfo.tipPercentages[2] * 100)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tipOneChange(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        let doubleTip = (Double(tipOne.text!) ?? 0.0)/100
        defaults.set(doubleTip, forKey:"1")
        settingInfo.tipPercentages[0] = doubleTip
        settingInfo.loadView()
        settingInfo.viewDidLoad()
        
    }
   
    @IBAction func tipTwoChange(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        let doubleTip = (Double(tipTwo.text!) ?? 0.0)/100
        defaults.set(doubleTip, forKey:"2")
        settingInfo.tipPercentages[1] = doubleTip
        settingInfo.loadView()
        settingInfo.viewDidLoad()

    }
    
    @IBAction func tipThreeChange(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        let doubleTip = (Double(tipThree.text!) ?? 0.0)/100
        defaults.set(doubleTip, forKey:"3")
        settingInfo.tipPercentages[2] = doubleTip
        settingInfo.loadView()
        settingInfo.viewDidLoad()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
