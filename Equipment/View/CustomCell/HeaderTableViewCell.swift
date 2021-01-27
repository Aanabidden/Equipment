//
//  HeaderTableViewCell.swift
//  JarusTech
//
//  Created by Aradhana on 23/01/21.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    var checkButton = UIButton()
    var idLabel = UILabel()
    var makeLabel = UILabel()
    var arrowImage = UIImageView()
    
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
        // add components
        checkButton.frame = CGRect(x: 0, y: 0, width: cellHeight, height: cellHeight)
        checkButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(checkButton)
        let constLeadButton = NSLayoutConstraint(item: checkButton, attribute: .leading, relatedBy: .equal,
                                                toItem: contentView, attribute: .leading, multiplier: 1, constant: 0)
        let constTopButton = NSLayoutConstraint(item: checkButton, attribute: .top, relatedBy: .equal,
                                               toItem: contentView, attribute: .top, multiplier: 1, constant: 0)
        contentView.addConstraints([constLeadButton, constTopButton])
        let constWidthButton = NSLayoutConstraint(item: checkButton, attribute: .width, relatedBy: .equal,
                                                 toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: cellHeight)
        let constHeightButton = NSLayoutConstraint(item: checkButton, attribute: .height, relatedBy: .equal,
                                                  toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: cellHeight)
        self.checkButton.addConstraints([constWidthButton, constHeightButton])
        
        idLabel.frame = CGRect(x: 60, y: 0, width: 80, height: cellHeight)
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(idLabel)
        let constLeadId = NSLayoutConstraint(item: idLabel, attribute: .leading, relatedBy: .equal,
                                                toItem: contentView, attribute: .leading, multiplier: 1, constant: 60)
        let constTopId = NSLayoutConstraint(item: idLabel, attribute: .top, relatedBy: .equal,
                                               toItem: contentView, attribute: .top, multiplier: 1, constant: 0)
        contentView.addConstraints([constLeadId, constTopId])
        let constWidthId = NSLayoutConstraint(item: idLabel, attribute: .width, relatedBy: .equal,
                                                 toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 80)
        let constHeightId = NSLayoutConstraint(item: idLabel, attribute: .height, relatedBy: .equal,
                                                  toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: cellHeight)
        self.idLabel.addConstraints([constWidthId, constHeightId])
        
        makeLabel.frame = CGRect(x: 120, y: 0, width: 200, height: cellHeight)
        makeLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(makeLabel)
        let constLeadMake = NSLayoutConstraint(item: makeLabel, attribute: .leading, relatedBy: .equal,
                                                toItem: contentView, attribute: .leading, multiplier: 1, constant: 120)
        let constTopMake = NSLayoutConstraint(item: makeLabel, attribute: .top, relatedBy: .equal,
                                               toItem: contentView, attribute: .top, multiplier: 1, constant: 0)
        contentView.addConstraints([constLeadMake, constTopMake])
        let constWidthMake = NSLayoutConstraint(item: makeLabel, attribute: .width, relatedBy: .equal,
                                                 toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200)
        let constHeightMake = NSLayoutConstraint(item: makeLabel, attribute: .height, relatedBy: .equal,
                                                  toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: cellHeight)
        self.makeLabel.addConstraints([constWidthMake, constHeightMake])
        
        arrowImage.frame = CGRect(x: 350, y: 15, width: 20, height: 20)
        arrowImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(arrowImage)
        let constTrailImage = NSLayoutConstraint(item: arrowImage, attribute: .trailing, relatedBy: .equal,
                                                toItem: contentView, attribute: .trailing, multiplier: 1, constant: -5)
        let constTopImage = NSLayoutConstraint(item: arrowImage, attribute: .top, relatedBy: .equal,
                                               toItem: contentView, attribute: .top, multiplier: 1, constant: 15)
        contentView.addConstraints([constTrailImage, constTopImage])
        let constWidthImage = NSLayoutConstraint(item: arrowImage, attribute: .width, relatedBy: .equal,
                                                 toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20)
        let constHeightImage = NSLayoutConstraint(item: arrowImage, attribute: .height, relatedBy: .equal,
                                                  toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20)
        self.arrowImage.addConstraints([constWidthImage, constHeightImage])
        
        // set component details
        checkButton.addTarget(self, action: #selector(setItemSelected), for: .touchUpInside)
        
        checkButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        checkButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        
        idLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        makeLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        arrowImage.image = UIImage(systemName: "chevron.right")
        arrowImage.contentMode = .scaleAspectFit
        
        let customBackgroundView = UIView()
        customBackgroundView.backgroundColor = .darkGray
        self.selectedBackgroundView = customBackgroundView
    }
    
    @objc func setItemSelected(sender: UIButton!) {
        checkButton.isSelected = !checkButton.isSelected
    }
    
    func setCollapsedImage() {
        arrowImage.image = UIImage(systemName: "chevron.right")
    }
    
    func setExpandedImage() {
        arrowImage.image = UIImage(systemName: "chevron.down")
    }
}
