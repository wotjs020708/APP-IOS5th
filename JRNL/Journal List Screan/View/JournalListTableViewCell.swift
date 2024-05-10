//
//  JournalListTableViewCell.swift
//  JRNL
//
//  Created by 어재선 on 5/10/24.
//

import UIKit

class JournalListTableViewCell: UITableViewCell {
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var dateLable: UILabel!
    @IBOutlet var titleLable: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
