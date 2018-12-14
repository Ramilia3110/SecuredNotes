//
//  Note.swift
//  SecuredNotes
//
//  Created by Ramilia Imankulova on 12/14/18.
//  Copyright © 2018 Ramilia Imankulova. All rights reserved.
//

import Foundation

class Note {
    public private(set) var message: String
    public var lockStatus: LockStatus
    
    
    init(message: String, lockStatus: LockStatus) {
        self.message = message
        self.lockStatus = lockStatus
    }
}
