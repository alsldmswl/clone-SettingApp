//
//  ProfileCell.swift
//  SettingApp
//
//  Created by eun-ji on 2023/02/23.
//

import UIKit

// profile 커스텀셀
class ProfileCell: UITableViewCell {

    @IBOutlet weak var topTitle: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var bottonDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        topTitle.textColor = .blue
        topTitle.font = UIFont.systemFont(ofSize: 20)
        
        bottonDescription.textColor = .darkGray
        bottonDescription.font = UIFont.systemFont(ofSize: 16)
//        profileImageView.layer.cornerRadius
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
