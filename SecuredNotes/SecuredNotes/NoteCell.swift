//
//  NoteCell.swift
//  SecuredNotes
//
//  Created by Ramilia Imankulova on 12/14/18.
//  Copyright © 2018 Ramilia Imankulova. All rights reserved.
//

import UIKit

class NoteCell: UITableViewCell {

    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var lockImgView: UIImageView!
    
    func configureCell (note: Note) {
        if note.lockStatus == .locked {
            messageLbl.text = "This note is locked. Unlock to read"
            lockImgView.isHidden = false
        } else {
            messageLbl.text = note.message
            lockImgView.isHidden = true
        }
    }

   
}
