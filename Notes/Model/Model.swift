//
//  Model.swift
//  Notes
//
//  Created by Kushang  on 06/10/24.
//

import Foundation

class Notes: Codable {
    var id: Int
    var title: String
    var notes: String
    var time: String
    var image: String
    var notesTheme: String
    
    init(id: Int, title: String, notes: String, time: String, image: String, notesTheme: String) {
        self.id = id
        self.title = title
        self.notes = notes
        self.time = time
        self.image = image
        self.notesTheme = notesTheme
    }
}
