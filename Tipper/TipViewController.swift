//
//  ViewController.swift
//  Tipper
//
//  Created by Joshua Escribano on 9/22/16.
//  Copyright © 2016 Joshua Escribano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let currencySymbol = Locale.current.currencySymbol ?? "$"

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var twoFriendsLabel: UILabel!
    @IBOutlet weak var threeFriendsLabel: UILabel!
    @IBOutlet weak var fourFriendsLabel: UILabel!
    @IBOutlet weak var fiveFriendsLabel: UILabel!
    @IBOutlet weak var friendsContainerView: UIView!
    @IBOutlet var detailLabels: [UILabel]!
    @IBOutlet weak var detailContainerView: UIView!
    @IBOutlet weak var dividerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.  
        
        billField.placeholder = currencySymbol
        let defaults = UserDefaults.standard
        if (defaults.object(forKey: "BillAmount") != nil) {
            let billAmount = defaults.double(forKey: "BillAmount")
            billField.text = String(format: "%.2f", billAmount)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        let tipIndex = defaults.integer(forKey: "TipSegmentIndex")
        tipControl.selectedSegmentIndex = tipIndex
        calculateTip(self)
        billField.becomeFirstResponder()
        
        setTheme()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
        UIView.animate(withDuration: 1, animations: {
            self.friendsContainerView.alpha = 1
        })
    }
    
    @IBAction func beganEditing(_ sender: AnyObject) {
        UIView.animate(withDuration: 0.5, animations: {
            self.friendsContainerView.alpha = 0
        })
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        let bill = Double(billField.text!) ?? 0
        let tipPercentages = [0.15, 0.20, 0.25]
        let tip = tipPercentages[tipControl.selectedSegmentIndex] * bill
        let total = bill + tip
        let defaults = UserDefaults.standard
        defaults.set(bill, forKey: "BillAmount")
        defaults.synchronize()
        
        tipLabel.text = String(format: "\(currencySymbol)%.2f", tip)
        totalLabel.text = String(format: "\(currencySymbol)%.2f", total)
        twoFriendsLabel.text = String(format: "\(currencySymbol)%.2f", total / 2)
        threeFriendsLabel.text = String(format: "\(currencySymbol)%.2f", total / 3)
        fourFriendsLabel.text = String(format: "\(currencySymbol)%.2f", total / 4)
        fiveFriendsLabel.text = String(format: "\(currencySymbol)%.2f", total / 5)
    }
    
    func setTheme() {
        let themeColors = Theme.ThemeColors()
        view.backgroundColor = themeColors.backgroundColor
        billField.textColor = themeColors.labelFontColor
        billField.attributedPlaceholder = NSAttributedString(string: "\(currencySymbol)", attributes: [NSForegroundColorAttributeName: themeColors.labelFontColor])
        tipControl.tintColor = themeColors.labelFontColor
        detailContainerView.backgroundColor = themeColors.totalContainerColor
        friendsContainerView.backgroundColor = themeColors.totalContainerColor
        dividerView.backgroundColor = themeColors.totalLabelFontColor
        for label in detailLabels {
            label.textColor = themeColors.totalLabelFontColor
        }
    }

}

