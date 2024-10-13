//
//  HomeScreen.swift
//  Notes
//
//  Created by Kushang  on 05/10/24.
//

import UIKit

class HomeScreen: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet weak var notesTableView: UITableView!{
        didSet{
            let nib = UINib(nibName: "NotesCell", bundle: nil)
            self.notesTableView.register(nib, forCellReuseIdentifier: "NotesCell")
        }
    }
    
    // MARK: = Variables
    var userDefaults = UserDefaults.standard
    var notes: [Notes] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let savedNotesData = UserDefaults.standard.data(forKey: "Key"),
           let savedNotes = try? JSONDecoder().decode([Notes].self, from: savedNotesData) {  // Decode as [Notes]
            print(savedNotes)
            for i in savedNotes {
                self.notes.append(i)
            }
        }
    }
    @IBAction func onAdd(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "AddNoteScreen") as? AddNoteScreen {
            vc.addNotes = { [weak self] newNote in
                self?.notes.insert(newNote, at: 0)
                if let encodedNotes = try? JSONEncoder().encode(self?.notes) {
                    UserDefaults.standard.set(encodedNotes, forKey: "Key")
                }
                self?.notesTableView.reloadData()
            }
            self.present(vc, animated: true)
        }
    }
}

    // MARK: - Tableview deligate
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

// kushang
