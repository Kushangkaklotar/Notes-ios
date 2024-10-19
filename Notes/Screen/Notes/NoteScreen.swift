//
//  NoteScreen.swift
//  Notes
//
//  Created by Kushang  on 06/10/24.
//

import UIKit

class NoteScreen: UIViewController {

    // mark: - IB Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var noteTextView: UITextView!
    @IBOutlet var backGroundView: UIView!
    @IBOutlet weak var doneButton: UIButton!
    
    // MARK: - Variables
    var notes: Notes?
    var doneClick: ((Notes) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.managedata()
        self.initialise()
    }
    
    // mark: - Function's
    func initialise(){
    }
    
    func managedata(){
        self.nameTextField.text = notes?.title ?? ""
        self.noteTextView.text = notes?.notes ?? ""
    }
    
    @IBAction func onBAck(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func onDone(_ sender: UIButton) {
        if self.nameTextField.text != self.notes?.title || self.noteTextView.text != self.notes?.notes {
            self.notes?.title = self.nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            self.notes?.notes = self.noteTextView.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            self.doneClick?(self.notes ?? Notes())
            self.navigationController?.popViewController(animated: true)
        }
    }
}
