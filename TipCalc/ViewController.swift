//
//  ViewController.swift
//  TipCalc
//
//  Created by Xiang Yu on 8/13/17.
//  Copyright © 2017 Xiang Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var headCountSlider: UISlider!
    @IBOutlet weak var headCountLabel: UILabel!
    @IBOutlet weak var shareLabel: UILabel!
    @IBOutlet weak var eachLabel: UILabel!
    
    var total: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let defaults = UserDefaults.standard
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "defaultTipSelected")
        
        headCountSlider.alpha = 0;
        headCountLabel.alpha = 0;
        shareLabel.alpha = 0;
        eachLabel.alpha = 0;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "defaultTipSelected")
        
        tipControl.sendActions(for: UIControlEvents.valueChanged)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        
        view.endEditing(true)
    }
    
    @IBAction func calculateShare(_ sender: Any) {
        
        // Restrict slider to a fixed value
        let fixed = roundf(headCountSlider.value)
        headCountSlider.setValue(fixed, animated: true)
        
        headCountLabel.text = String(format: "%.0f", fixed)
        
        let share = total / fixed
        shareLabel.text = String(format: "$%.1f", share)
        
    }

    @IBAction func calculateTip(_ sender: Any) {

        let tipPercentages = [Float]([0.15, 0.18, 0.2])

        
        let bill = Float(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        calculateShare(sender)
        
        if(headCountSlider.alpha == 0) {
            UIView.animate(withDuration: 0.4, animations:{
                self.headCountSlider.alpha = 1;
                self.headCountLabel.alpha = 1;
                self.shareLabel.alpha = 1;
                self.eachLabel.alpha = 1;
            })
        }
    }
    
}

