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
    
    var level = 1
    var combat = 0
    var oneShot = 0
    var monsterCombatStrength = 0
    var effectiveCombat = 0
    var netCombatResult = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        monsterCombatStrength = monsterCombatStrengthTextField.text.toInt()!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func levelDecrementButtonPressed(sender: UIButton) {
        if level >= 2 {
        level -= 1
            levelLabel.text = "\(level)"
            effectiveCombat = calculateCombat(level, combat: combat, oneShot: oneShot)
            effectiveCombatLabel.text = "\(effectiveCombat)"
            netCombatResult = calculateNetCombatResult(effectiveCombat, monsterLevel: monsterCombatStrength)
            netCombatResultLabel.text = "\(netCombatResult)"
            updateOutcomeLabel()
        
        }
        else {
            
            level = 1 }
    }

    @IBAction func levelIncrementButtonPressed(sender: UIButton) {
        if level <= 9 {
            level += 1
            levelLabel.text = "\(level)"
            effectiveCombat = calculateCombat(level, combat: combat, oneShot: oneShot)
            effectiveCombatLabel.text = "\(effectiveCombat)"
            netCombatResult = calculateNetCombatResult(effectiveCombat, monsterLevel: monsterCombatStrength)
            netCombatResultLabel.text = "\(netCombatResult)"
            updateOutcomeLabel()
        }
    }

    @IBAction func combatDecrementButtonPressed(sender: UIButton) {
        combat -= 1
        combatLabel.text = "\(combat)"
        effectiveCombat = calculateCombat(level, combat: combat, oneShot: oneShot)
        effectiveCombatLabel.text = "\(effectiveCombat)"
        netCombatResult = calculateNetCombatResult(effectiveCombat, monsterLevel: monsterCombatStrength)
        netCombatResultLabel.text = "\(netCombatResult)"
        updateOutcomeLabel()
    }
    
    @IBAction func combatIncrementButtonPressed(sender: UIButton) {
        combat += 1
        combatLabel.text = "\(combat)"
        effectiveCombat = calculateCombat(level, combat: combat, oneShot: oneShot)
        effectiveCombatLabel.text = "\(effectiveCombat)"
        netCombatResult = calculateNetCombatResult(effectiveCombat, monsterLevel: monsterCombatStrength)
        netCombatResultLabel.text = "\(netCombatResult)"
        updateOutcomeLabel()
    }
    
    @IBAction func oneShotDecrementButtonPressed(sender: UIButton) {
        oneShot -= 1
        oneShotLabel.text = "\(oneShot)"
        effectiveCombat = calculateCombat(level, combat: combat, oneShot: oneShot)
        effectiveCombatLabel.text = "\(effectiveCombat)"
        netCombatResult = calculateNetCombatResult(effectiveCombat, monsterLevel: monsterCombatStrength)
        netCombatResultLabel.text = "\(netCombatResult)"
        updateOutcomeLabel()
    }
    
    @IBAction func oneShotIncrementButtonPressed(sender: UIButton) {        oneShot += 1
        oneShotLabel.text = "\(oneShot)"
        effectiveCombat = calculateCombat(level, combat: combat, oneShot: oneShot)
        effectiveCombatLabel.text = "\(effectiveCombat)"
        netCombatResult = calculateNetCombatResult(effectiveCombat, monsterLevel: monsterCombatStrength)
        netCombatResultLabel.text = "\(netCombatResult)"
        updateOutcomeLabel()
    }
    
    // helper functions
    
    func calculateCombat (level: Int, combat: Int, oneShot: Int) ->Int {
        
        var effectiveCombat:Int = level + combat + oneShot
        
        return effectiveCombat
    }
    
    func calculateNetCombatResult (effectiveCombatLevel: Int, monsterLevel: Int) -> Int {
        
        var combatResult = effectiveCombatLevel - monsterCombatStrengthTextField.text.toInt()!
        netCombatResultLabel.text = "\(combatResult)"
        
        updateOutcomeLabel()
    
    return combatResult
    }
    
    func updateOutcomeLabel() {
        if netCombatResult <= 0 {
            combatOutcomeTextLabel.textColor = UIColor.redColor()
            combatOutcomeTextLabel.text = "Run away!"
        } else {
        combatOutcomeTextLabel.textColor = UIColor.greenColor()
        combatOutcomeTextLabel.text = "Winning!"
        }
    }
    
    @IBAction func monsterLevelTextFieldEnd(sender: UITextField) {
        monsterCombatStrengthTextField.resignFirstResponder()
        updateOutcomeLabel()
        
    }
    
//    @IBAction func editTextFieldDidEnd(sender: UITextField) {
//        monsterCombatStrengthTextField.resignFirstResponder()
//    }
    
}
