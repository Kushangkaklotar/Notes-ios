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
    
    // MARK: - Variables
    var notes: Notes?
    
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
}
