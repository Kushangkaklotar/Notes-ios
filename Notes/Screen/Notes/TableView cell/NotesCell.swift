//
//  NotesCell.swift
//  Notes
//
//  Created by Kushang  on 05/10/24.
//

import UIKit

class NotesCell: UITableViewCell {

    // mark: - IB Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    @IBOutlet weak var backGroundView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.managedata()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // Function's
    func managedata(){
        self.backGroundView.layer.cornerRadius = 10
    }
    
    // mark: - Data set
    var dataSet: Notes? {
        didSet{
            self.nameLabel.text = dataSet?.title
            self.notesLabel.text = dataSet?.notes
        }
    }
}
