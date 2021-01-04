//
//  QuoteTableViewCell.swift
//  Quotes_BindTableViewAndCoreData
//
//  Created by Zepiao Han on 1/4/21.
//

import UIKit

class QuoteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var autherLabel: UILabel!
    @IBOutlet weak var contentsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
