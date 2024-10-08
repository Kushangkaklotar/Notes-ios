//
//  AddNoteScreen.swift
//  Notes
//
//  Created by Kushang  on 08/10/24.
//

import UIKit

class AddNoteScreen: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var headingview: UIView!
    @IBOutlet weak var notesView: UIView!
    @IBOutlet weak var addNoteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialise()
        // Do any additional setup after loading the view.
    }
    
    // mark: - Function's
    func initialise(){
        self.manageUI()
    }
    func manageUI(){
        self.headingview.layer.cornerRadius = 10
        self.notesView.layer.cornerRadius = 10
        
        self.headingview.layer.borderWidth = 1
        self.headingview.layer.borderColor = #colorLiteral(red: 0.1960000098, green: 0.6779999733, blue: 0.9020000696, alpha: 1)
        
        self.notesView.layer.borderWidth = 1
        self.notesView.layer.borderColor = #colorLiteral(red: 0.1960000098, green: 0.6779999733, blue: 0.9020000696, alpha: 1)
    }
    
    @IBAction func onAddNote(_ sender: Any) {
    }
}
