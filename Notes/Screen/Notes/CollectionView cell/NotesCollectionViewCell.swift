//
//  NotesCollectionViewCell.swift
//  Notes
//
//  Created by Kushang  on 22/10/24.
//

import UIKit

class NotesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var dataSet: Notes? {
        didSet{
            self.nameLabel.text = dataSet?.title
            self.notesLabel.text = dataSet?.notes
        }
    }
}
