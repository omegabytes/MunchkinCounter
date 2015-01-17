//
//  ViewController.swift
//  MunchkinCounter
//
//  Created by Alex Gaesser on 1/17/15.
//  Copyright (c) 2015 AlexGaesser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    }

    @IBAction func scoreBoardButtonPressed(sender: UIButton) {
        performSegueWithIdentifier("showScoreBoard", sender: self)
    }
    
    @IBAction func faqsAndRulesButtonPressed(sender: UIButton) {
        performSegueWithIdentifier("showFAQsAndRules", sender: self)
    }

    @IBAction func settingsButtonPressed(sender: UIButton) {
        performSegueWithIdentifier("showSettings", sender: self)
    }
}

