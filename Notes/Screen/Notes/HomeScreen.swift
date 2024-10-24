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
    @IBOutlet weak var favnotesCollection: UICollectionView! {
        didSet{
            self.favnotesCollection.register(UINib(nibName: "NotesCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "NotesCollectionViewCell")
        }
    }
    
    // MARK: = Variables
    var userDefaults = UserDefaults.standard
    var avalableNotes: [Notes] = []
    var favNotes: [Notes] = []
    
    
    // MARK: - Method
    override func viewDidLoad() {
        super.viewDidLoad()
        if let savedNotesData = UserDefaults.standard.data(forKey: USER_DEFAULT_KEY),
           let savedNotes = try? JSONDecoder().decode([Notes].self, from: savedNotesData) {  // Decode as [Notes]
            for i in savedNotes {
                NOTES.append(i)
            }
        }
        self.avalableNotes = NOTES.filter{ $0.isDeleted == false }
        self.favNotes = NOTES.filter{ $0.isLiked == true }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Values")
    }
    // MARK: - IB Action
    @IBAction func onAdd(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "AddNoteScreen") as? AddNoteScreen {
            vc.addNotes = { [weak self] newNote in
                NOTES.insert(newNote, at: 0)
                self?.avalableNotes.insert(newNote, at: 0)
                if let encodedNotes = try? JSONEncoder().encode(NOTES) {
                    UserDefaults.standard.set(encodedNotes, forKey: USER_DEFAULT_KEY)
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
        self.avalableNotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotesCell") as! NotesCell
        cell.dataSet = self.avalableNotes[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "NoteScreen") as? NoteScreen {
            vc.notes = self.avalableNotes[indexPath.row]
            vc.doneClick = { [weak self] indexValue in
                self?.avalableNotes[indexPath.row].title = indexValue.title
                self?.avalableNotes[indexPath.row].notes = indexValue.notes
                self?.notesTableView.reloadData()
            }
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.avalableNotes[indexPath.row].isDeleted = true
            NOTES[indexPath.row].isDeleted = true
            self.avalableNotes.remove(at: indexPath.row)
            self.notesTableView.reloadData()
            if let encodedNotes = try? JSONEncoder().encode(NOTES) {
                UserDefaults.standard.set(encodedNotes, forKey: USER_DEFAULT_KEY)
                Utility.successAlert(message: "Notes deleted", view: self.view)
            }
        }
    }
}

// MARK: - Collection view cell
extension HomeScreen: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.favNotes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NotesCollectionViewCell", for: indexPath) as! NotesCollectionViewCell
        cell.dataSet = self.favNotes[indexPath.row]
        return cell
    }
}
