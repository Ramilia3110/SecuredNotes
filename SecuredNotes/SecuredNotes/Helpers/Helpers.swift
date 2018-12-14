//
//  Helpers.swift
//  SecuredNotes
//
//  Created by Ramilia Imankulova on 12/14/18.
//  Copyright © 2018 Ramilia Imankulova. All rights reserved.
//

import Foundation
func isNoteLocked (_ lockStatus: LockStatus) -> Bool {
    if  lockStatus == .locked {
        return true
    } else {
        return false
    }
}
    
func lockStausFlipper(_ lockStatus: LockStatus) -> LockStatus {
    if lockStatus == .locked {
        return .unlocked
    } else {
       return .locked
    }
}

