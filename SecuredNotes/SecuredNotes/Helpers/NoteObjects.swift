//
//  NoteObjects.swift
//  SecuredNotes
//
//  Created by Ramilia Imankulova on 12/14/18.
//  Copyright © 2018 Ramilia Imankulova. All rights reserved.
//

import Foundation
var note1 = Note(message: "Hello sweety, how are you?", lockStatus: .locked)
var note2 = Note(message: "This notes secured from evryone and works only with TouchID and FaceID", lockStatus: .unlocked)
var note3 = Note(message: "Notes are really cool when you secure them", lockStatus: .locked)
var notesArray: [Note] = [note1, note2, note3]
