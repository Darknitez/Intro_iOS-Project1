//
//  SettingsViewController.swift
//  Tips
//
//  Created by Julian Duodu on 12/31/15.
//  Copyright © 2015 Julian Duodu. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultPercent: UISegmentedControl!
    
    @IBOutlet weak var defaultColor: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Default Settings"

        // Do any additional setup after loading the view.
        let defaults = NSUserDefaults.standardUserDefaults()
        
        //Finds default tip and color values from the standard user defaults
        let intValue = defaults.integerForKey("tipDef")
        let colorValue = defaults.integerForKey("colorDef")
        
        //Sets the tip and color segment labels to the correct value that corresponds to what is stored in the default values.
        defaultPercent.selectedSegmentIndex = intValue
        defaultColor.selectedSegmentIndex  = colorValue
        //sets the background value to be blue if the correct value is highlighted
        if(colorValue == 1){
            self.view.backgroundColor = UIColor.blueColor()
        }
        //Sets the background value to be orange if the correct value is highlighted
        else if(colorValue == 2){
            self.view.backgroundColor = UIColor.orangeColor()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Sets default tip values according to what is indicated by the segment label partition that is currently selected, then synchronizes default values
    @IBAction func tipDefault(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultPercent.selectedSegmentIndex, forKey: "tipDef")
        defaults.synchronize()
    }
    //sets default color according to the current segment label that is currently selected, then synchronizes default values
    @IBAction func colorDefault(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultColor.selectedSegmentIndex, forKey: "colorDef")
        defaults.synchronize()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
