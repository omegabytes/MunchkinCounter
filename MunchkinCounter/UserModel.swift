//
//  UserModel.swift
//  MunchkinCounter
//
//  Created by Alex Gaesser on 1/24/15.
//  Copyright (c) 2015 AlexGaesser. All rights reserved.
//

import Foundation
import CoreData

class UserModel: NSManagedObject {

    @NSManaged var level: NSNumber
    @NSManaged var combat: NSNumber
    @NSManaged var oneShot: NSNumber
    @NSManaged var effectiveCombat: NSNumber
    @NSManaged var netCombatResult: NSNumber
    @NSManaged var monsterCombatStrength: NSNumber

}
