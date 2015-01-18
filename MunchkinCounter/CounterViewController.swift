//
//  CounterViewController.swift
//  MunchkinCounter
//
//  Created by Alex Gaesser on 1/17/15.
//  Copyright (c) 2015 AlexGaesser. All rights reserved.
//

import UIKit

class CounterViewController: UIViewController {
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var combatLabel: UILabel!
    @IBOutlet weak var oneShotLabel: UILabel!
    @IBOutlet weak var effectiveCombatLabel: UILabel!
    @IBOutlet weak var netCombatResultLabel: UILabel!
    @IBOutlet weak var monsterCombatStrengthTextField: UITextField!
    @IBOutlet weak var combatOutcomeTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var level = 1
        var combat = 0
        var oneShot = 0
        var monsterCombatStrength = 0
        
        var effectiveCombat:Int = level + combat + oneShot
        var netCombatResult:Int
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func levelDecrementButtonPressed(sender: UIButton) {

    }

    @IBAction func levelIncrementButtonPressed(sender: UIButton) {
    }

    @IBAction func combatDecrementButtonPressed(sender: UIButton) {
    }
    
    @IBAction func combatIncrementButtonPressed(sender: UIButton) {
    }
    
    @IBAction func oneShotDecrementButtonPressed(sender: UIButton) {
    }
    
    @IBAction func oneShotIncrementButtonPressed(sender: UIButton) {
    }
    
//    @IBAction func editTextFieldDidEnd(sender: UITextField) {
//        monsterCombatStrengthTextField.resignFirstResponder()
//    }
    
}
