//
//  CounterViewController.swift
//  MunchkinCounter
//
//  Created by Alex Gaesser on 1/17/15.
//  Copyright (c) 2015 AlexGaesser. All rights reserved.
//

import UIKit
import CoreData

class CounterViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var combatLabel: UILabel!
    @IBOutlet weak var oneShotLabel: UILabel!
    @IBOutlet weak var effectiveCombatLabel: UILabel!
    @IBOutlet weak var netCombatResultLabel: UILabel!
    @IBOutlet weak var monsterCombatStrengthTextField: UITextField!
    @IBOutlet weak var combatOutcomeTextLabel: UILabel!
    

//    var user: UserModel!
    
//    var level = 1
//    var combat = 0
//    var oneShot = 0
//    var monsterCombatStrength = 0
//    var effectiveCombat = 0
//    var netCombatResult = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let appDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        let managedObjectContext = appDelegate.managedObjectContext
        let entityDescription = NSEntityDescription.entityForName("UserModel", inManagedObjectContext: managedObjectContext!)
        let user = UserModel(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext!)
        
        user.level = 1
        user.monsterCombatStrength = monsterCombatStrengthTextField.text.toInt()!
        monsterCombatStrengthTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func levelDecrementButtonPressed(sender: UIButton) {
//        let appDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
//        let managedObjectContext = appDelegate.managedObjectContext
//        let entityDescription = NSEntityDescription.entityForName("UserModel", inManagedObjectContext: managedObjectContext!)
//        let user = UserModel(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext!)
    
        
        if user.level == 1 {
            user.level = 1
            appDelegate.saveContext()
        }
        else {
            
    user.level -= 1
    levelLabel.text = "\(user.level)"
    user.effectiveCombat = calculateCombat(user.level, combat: user.combat, oneShot: user.oneShot)
    effectiveCombatLabel.text = "\(user.effectiveCombat)"
    user.netCombatResult = calculateNetCombatResult(user.effectiveCombat, monsterLevel: user.monsterCombatStrength)
    netCombatResultLabel.text = "\(user.netCombatResult)"
    updateOutcomeLabel()
    
    appDelegate.saveContext()

        }
    }

    @IBAction func levelIncrementButtonPressed(sender: UIButton) {
        
        if user.level <= 9 {
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
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
        updateOutcomeLabel()
    }
    
//    @IBAction func editMonsterLevelDidEnd(sender: UITextField) {
//        self.monsterCombatStrengthTextField.endEditing(true)
//        self.monsterCombatStrengthTextField.resignFirstResponder()
//    }
    
    
//    func textFieldDidEndEditing(textField: UITextField) {
//        
//        textField.resignFirstResponder()
//    }
  
}
