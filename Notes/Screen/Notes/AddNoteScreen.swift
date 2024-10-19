//
//  AddNoteScreen.swift
//  Notes
//
//  Created by Kushang  on 08/10/24.
//

import UIKit
import Toast_Swift

class AddNoteScreen: UIViewController {

    // MARK: - IB Outlet's
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var headingview: UIView!
    @IBOutlet weak var notesView: UIView!
    @IBOutlet weak var addNoteButton: UIView!
    @IBOutlet weak var layerView: UIView!
    @IBOutlet weak var headingTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var addButton: UIButton!
    
    //MARK: - Variables
    var addNotes:((Notes)-> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialise()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Function's
    func initialise(){
        self.manageUI()
    }
    func manageUI(){
        self.backgroundView.layer.cornerRadius = 25
        self.headingview.layer.cornerRadius = 20
        self.addNoteButton.layer.cornerRadius = 20
        self.notesView.layer.cornerRadius = 25
        
        self.backgroundView.layer.borderWidth = 2
        self.backgroundView.layer.borderColor = #colorLiteral(red: 0.1960000098, green: 0.6779999733, blue: 0.9020000696, alpha: 1)
        
        self.headingview.layer.borderWidth = 1
        self.headingview.layer.borderColor = #colorLiteral(red: 0.1960000098, green: 0.6779999733, blue: 0.9020000696, alpha: 1)
        
        self.addNoteButton.layer.borderWidth = 1
        self.addNoteButton.layer.borderColor = #colorLiteral(red: 0.1960000098, green: 0.6779999733, blue: 0.9020000696, alpha: 1)
        
        self.notesView.layer.borderWidth = 1
        self.notesView.layer.borderColor = #colorLiteral(red: 0.1960000098, green: 0.6779999733, blue: 0.9020000696, alpha: 1)
        
        self.addButton.setTitleColor(#colorLiteral(red: 0.1960000098, green: 0.6779999733, blue: 0.9020000696, alpha: 1), for: .normal)
    }
    
    @IBAction func onAddNote(_ sender: Any) {
        if self.validation() {
            let timestamp = NSDate().timeIntervalSince1970
                    let myTimeInterval = TimeInterval(timestamp)
                    let time = NSDate(timeIntervalSince1970: TimeInterval(myTimeInterval))
                    print(time)
            
            let notesArry = Notes(id: NOTES.count + 1, title: self.headingTextField.text?.trimmingCharacters(in: .whitespaces) ?? "", notes: self.notesTextView.text?.trimmingCharacters(in: .whitespaces) ?? "", time: "", image: "", notesTheme: "", isLiked: false, isDeleted: false)
                self.addNotes?(notesArry)
                self.dismiss(animated: true)
        }
    }
    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

// MARK: - Functin's
extension AddNoteScreen {
    func validation() -> Bool{
        if self.headingTextField.text == "" {
            Utility.errorAlert(message: "Please enter heading", view: self.view)
            return false
        } else if self.notesTextView.text?.trimmingCharacters(in: .whitespacesAndNewlines).count == 0 {
            Utility.errorAlert(message: "Please enter note", view: self.view)
            return false
        }
        return true
    }
}
