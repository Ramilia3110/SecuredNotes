//
//  ViewController.swift
//  SecuredNotes
//
//  Created by Ramilia Imankulova on 12/14/18.
//  Copyright © 2018 Ramilia Imankulova. All rights reserved.
//

import UIKit
import LocalAuthentication

class NoteVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as? NoteCell else {return UITableViewCell()}
        let note = notesArray[indexPath.row]
        cell.configureCell(note: note)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if notesArray[indexPath.row].lockStatus == .locked {
            authBiometric { (authenticated) in
                if authenticated {
                    let lockStatus = notesArray[indexPath.row].lockStatus
                    notesArray[indexPath.row].lockStatus = lockStausFlipper(lockStatus)
                    DispatchQueue.main.async {
                        self.pushNoteFor(indexPath: indexPath)
                    }
                    
                }
            }
        } else {
            pushNoteFor(indexPath: indexPath)
        }
        
    }
    
    func pushNoteFor(indexPath: IndexPath) {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC else {return}
        detailVC.note = notesArray[indexPath.row]
        detailVC.index = indexPath.row
        navigationController?.pushViewController(detailVC, animated: true)
    }
    func authBiometric(completion: @escaping (Bool) -> Void) {
        let myContext = LAContext()
        let myLocalizedString = "Our app uses Touch ID / Face ID to secure your notes"
        var authError: NSError?
        if #available (iOS 8.0, macOS 10.12.1, *) {
            if myContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
                myContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: myLocalizedString) { (success, evaluateError) in
                    if success {
                        completion(true)
                    } else {
                        guard let evaluateErrorString = evaluateError?.localizedDescription else {return}
                        //present alert
                        self.showAlert(withMessage: evaluateErrorString)
                        completion(false)
                    }
                }
            } else {
                guard let authErrorString = authError?.localizedDescription else {return}
                self.showAlert(withMessage: authErrorString)
                completion(false)
            }
        } else {
                completion(false)
        }
        
    }
    func showAlert(withMessage message: String) {
        let alertVC = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertVC.addAction(action)
        present(alertVC, animated: true, completion: nil)
    }
}

