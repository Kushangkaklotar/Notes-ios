//
//  NotesCell.swift
//  Notes
//
//  Created by Kushang  on 05/10/24.
//

import UIKit

class NotesCell: UITableViewCell {

    // MARK: - IB Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var likeButton: UIButton!
    
    //MARK: - Variables
    var isliked: ((Bool)-> Void)?
    
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
            if dataSet?.isLiked == true {
                self.likeButton.setImage(UIImage(named: "hart_fill_ic"), for: .normal)
                self.likeButton.isSelected = true
            } else {
                self.likeButton.setImage(UIImage(named: "hart_ic"), for: .normal)
                self.likeButton.isSelected = false
            }
        }
    }
    @IBAction func onLike(_ sender: UIButton) {
//        self.likeButton.isSelected.toggle()
        self.isliked?(self.likeButton.isSelected == true ? false : true)
//        self.likeButton.isSelected.toggle()
    }
}
