//
//  quotesTableViewCell.swift
//  BadBreakingv3
//
//  Created by Vuyo Matiti on 2021/07/12.
//

import UIKit

class quotesTableViewCell: UITableViewCell
{
    @IBOutlet weak var quoteView: UIView!
    
    @IBOutlet weak var quoteLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
