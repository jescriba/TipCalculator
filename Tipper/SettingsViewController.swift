//
//  SettingsViewController.swift
//  Tipper
//
//  Created by Joshua Escribano on 9/22/16.
//  Copyright © 2016 Joshua Escribano. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var themeControl: UISegmentedControl!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set navigation appearance
        UIBarButtonItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor(red:0.23, green:0.38, blue:0.74, alpha:1.0)], for: .normal)
        navigationController?.navigationBar.tintColor = UIColor(red:0.23, green:0.38, blue:0.74, alpha:1.0)
        let defaults = UserDefaults.standard
        let tipIndex = defaults.integer(forKey: "TipSegmentIndex")
        tipControl.selectedSegmentIndex = tipIndex
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func themeChanged(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        defaults.set(themeControl.selectedSegmentIndex, forKey: "ThemeSegmentIndex")
        //changeTheme()
    }
    
    @IBAction func tipValueChanged(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        defaults.set(tipControl.selectedSegmentIndex, forKey: "TipSegmentIndex")
    }
    
    func changeTheme(themeIndex: Int) {
        
    }
}
