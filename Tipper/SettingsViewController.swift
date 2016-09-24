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
    @IBOutlet var descriptionLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set navigation appearance
        UIBarButtonItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor(red:0.23, green:0.38, blue:0.74, alpha:1.0)], for: .normal)
        navigationController?.navigationBar.tintColor = UIColor(red:0.23, green:0.38, blue:0.74, alpha:1.0)
        
        let defaults = UserDefaults.standard
        let tipIndex = defaults.integer(forKey: "TipSegmentIndex")
        let themeIndex = defaults.integer(forKey: "ThemeSegmentIndex")
        tipControl.selectedSegmentIndex = tipIndex
        themeControl.selectedSegmentIndex = themeIndex
        setTheme()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func themeChanged(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        defaults.set(themeControl.selectedSegmentIndex, forKey: "ThemeSegmentIndex")
        defaults.synchronize()
        changeTheme(themeControl.selectedSegmentIndex)
    }
    
    @IBAction func tipValueChanged(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        defaults.set(tipControl.selectedSegmentIndex, forKey: "TipSegmentIndex")
        defaults.synchronize()
    }

    func setTheme() {
        view.backgroundColor = Theme.ThemeColors().backgroundColor
        tipControl.tintColor = Theme.ThemeColors().labelFontColor
        themeControl.tintColor = Theme.ThemeColors().labelFontColor
        for label in descriptionLabels {
            label.textColor = Theme.ThemeColors().labelFontColor
        }
    }
    
    func changeTheme(_ themeIndex: Int) {
        if (Theme.currentTheme != themeIndex) {
            Theme.currentTheme = themeIndex
            setTheme()
        }
    }
}
