//
//  DetailTableViewCell.swift
//  JarusTech
//
//  Created by Aradhana on 23/01/21.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    var subLabel = UILabel()
    var valueLabel = UILabel()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupUI() {
        subLabel.frame = CGRect(x: 20, y: 0, width: 80, height: cellHeight)
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(subLabel)
        
        let constLeadLabel = NSLayoutConstraint(item: subLabel, attribute: .leading, relatedBy: .equal,
                                                toItem: contentView, attribute: .leading, multiplier: 1, constant: 20)
        let constTopLabel = NSLayoutConstraint(item: subLabel, attribute: .top, relatedBy: .equal,
                                               toItem: contentView, attribute: .top, multiplier: 1, constant: 0)
        contentView.addConstraints([constLeadLabel, constTopLabel])
        let constWidthLabel = NSLayoutConstraint(item: subLabel, attribute: .width, relatedBy: .equal,
                                                 toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 80)
        let constHeightLabel = NSLayoutConstraint(item: subLabel, attribute: .height, relatedBy: .equal,
                                                  toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: cellHeight)
        self.subLabel.addConstraints([constWidthLabel, constHeightLabel])
        
        valueLabel.frame = CGRect(x: 80, y: 0, width: 200, height: cellHeight)
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(valueLabel)
        let constLeadValue = NSLayoutConstraint(item: valueLabel, attribute: .leading, relatedBy: .equal,
                                                toItem: contentView, attribute: .leading, multiplier: 1, constant: 80)
        let constBaseLineValue = NSLayoutConstraint(item: valueLabel, attribute: .top, relatedBy: .equal,
                                                    toItem: subLabel, attribute: .firstBaseline, multiplier: 1, constant: 0)
        contentView.addConstraints([constLeadValue, constBaseLineValue])
        let constWidthValue = NSLayoutConstraint(item: valueLabel, attribute: .width, relatedBy: .equal,
                                                 toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200)
        self.valueLabel.addConstraints([constWidthValue])
        
        // set configuration for UI
        subLabel.textColor = .secondaryLabel
        subLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        valueLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        
    }
}
