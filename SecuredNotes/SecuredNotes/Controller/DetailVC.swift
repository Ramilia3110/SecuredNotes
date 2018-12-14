//
//  DetailVC.swift
//  SecuredNotes
//
//  Created by Ramilia Imankulova on 12/14/18.
//  Copyright © 2018 Ramilia Imankulova. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var noteTextView: UITextView!
    var note: Note!
    var index: Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        noteTextView.text = note.message

    }
    
    @IBAction func lockNoteBtn(_ sender: Any) {
        notesArray[index].lockStatus = lockStausFlipper(note.lockStatus)
        navigationController?.popViewController(animated: true)
        
    }
    
}
