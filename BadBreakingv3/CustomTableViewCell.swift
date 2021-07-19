//
//  CustomTableViewCell.swift
//  BadBreakingv3
//
//  Created by IACD-Air-8 on 2021/07/10.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var charView: UIView!
    @IBOutlet weak var charImage: UIImageView!
   
    @IBOutlet weak var charName: UILabel!
    @IBOutlet weak var charNickname: UILabel!
    @IBOutlet weak var charDob: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
