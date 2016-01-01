//
//  ViewController.swift
//  Tips
//
//  Created by Julian Duodu on 12/30/15.
//  Copyright © 2015 Julian Duodu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet var viewOne: UIView!
    
    var bill: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Tip Calculator"
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        //Check for the default values and set tip percentages and color values to reflect what is stored in the defaults
        let defaults = NSUserDefaults.standardUserDefaults()
        let intValue = defaults.integerForKey("tipDef")
        tipControl.selectedSegmentIndex = intValue;
        
        let colorValue = defaults.integerForKey("colorDef")
        if(colorValue == 1){
            self.view.backgroundColor = UIColor.blueColor()
            
        }
        
        else if(colorValue == 2){
            self.view.backgroundColor = UIColor.orangeColor()
        }
        
        let bill = Double(billField.text!)
        if(bill != nil){
            onEditingChanged(tipControl)
        }
        
        //Creates a fade-in UI animation when the application is first loaded
        self.viewOne.alpha = 0;
        UIView.animateWithDuration(1, animations: {
            self.viewOne.alpha = 1
        })
        print("View Loaded")
    }

    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        let intValue = defaults.integerForKey("tipDef")
        tipControl.selectedSegmentIndex = intValue
        
        //sets the bill text field to respond first when the application is loaded. Also loads the number pad.
        billField.becomeFirstResponder()
        
        let bill = Double(billField.text!)
        
        if(bill == nil){}
        
        else{
            onEditingChanged(tipControl)
        }
        
        let colorValue = defaults.integerForKey("colorDef")
        
        if(colorValue == 1){
            self.view.backgroundColor = UIColor.blueColor()
        }
        
        else if(colorValue == 2){
            self.view.backgroundColor = UIColor.orangeColor()
        }
        
        else{
            self.view.backgroundColor = UIColor.whiteColor()
        }
        
        print("View Will Appear!")
    }
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        let intValue = defaults.integerForKey("tipDef")
        tipControl.selectedSegmentIndex = intValue
        
        let bill = Double(billField.text!)
        if(bill == nil){}
        
        else{
            onEditingChanged(tipControl)
        }
        
        let colorValue = defaults.integerForKey("colorDef")
        
        if(colorValue == 1){
            self.view.backgroundColor = UIColor.blueColor()
        }
        
        else if(colorValue == 2){
            self.view.backgroundColor = UIColor.orangeColor()
        }
        
        else{
            self.view.backgroundColor = UIColor.whiteColor()
        }
        
        print("View Did Appear!")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("View Will Disappear!")
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let intValue = defaults.integerForKey("tipDef")
        tipControl.selectedSegmentIndex = intValue
        
        print("View Did Disappear!")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        //Different tip percentages available
        let tipPercentages = [0.18, 0.20, 0.25]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        //calculates tip amount that corresponds to bill
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        //Sets the tip and total values so that they only have 2 decimals
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        
    }
    //cancels out of the number pad if any area in the view controller(but outside of the number pad) is tapped
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

}

