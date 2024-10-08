//
//  HomeScreen.swift
//  Notes
//
//  Created by Kushang  on 05/10/24.
//

import UIKit

class HomeScreen: UIViewController {

    // mark: - IB Outlets
    @IBOutlet weak var notesTableView: UITableView!{
        didSet{
            let nib = UINib(nibName: "NotesCell", bundle: nil)
            self.notesTableView.register(nib, forCellReuseIdentifier: "NotesCell")
        }
    }
    
    // mark: = Variables
    let notes = [Notes(id: 1, title: "Home", notes: "Beautiful home", time: "3:00", image: "", notesTheme: ""),
                 Notes(id: 2, title: "kk", notes: "Kushang kaklotar", time: "4:00", image: "", notesTheme: ""),
                 Notes(id: 3, title: "mac", notes: "Macbook air m3 ", time: "7:00", image: "", notesTheme: "")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension HomeScreen: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotesCell") as! NotesCell
        cell.dataSet = self.notes[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "NoteScreen") as? NoteScreen {
            vc.notes = self.notes[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
