//
//  CustomCell.swift
//  TablViewWIthMVVM
//
//  Created by Zepiao Han on 12/9/20.
//

import UIKit

class CustomCell: UITableViewCell {

    var nameView = UILabel()
    var emailView = UILabel()
    private let padding = CGFloat(20)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setViewLayout() {
        nameView.backgroundColor = .yellow
        self.contentView.addSubview(nameView)
        nameView.translatesAutoresizingMaskIntoConstraints = false
        nameView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: padding).isActive = true
        nameView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        
        emailView.backgroundColor = .systemTeal
        self.contentView.addSubview(emailView)
        emailView.leadingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: padding).isActive = true
        emailView.topAnchor.constraint(equalTo: nameView.topAnchor).isActive = true
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
