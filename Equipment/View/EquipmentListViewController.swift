//
//  EquipmentListViewController.swift
//  Equipment
//
//  Created by Aradhana on 23/01/21.
//

import UIKit

let cellHeight = CGFloat(50)

class EquipmentListViewController: UIViewController {
    
    let titleLabel = UILabel()
    var tableView: UITableView?
    var constHeightTV: NSLayoutConstraint?
    
    let viewModel = ListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
        
        self.viewModel.bindToSourceViewModels = { [weak self] in
            self?.refreshData()
        }
    }
    
    func setupUI() {
        self.view.backgroundColor = .systemGroupedBackground
        
        titleLabel.frame = CGRect(x: 10, y: 50, width: self.view.frame.width, height: 100)
        titleLabel.text = "Choose Equipment"
        titleLabel.font = UIFont.systemFont(ofSize: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        let constLeadLabel = NSLayoutConstraint(item: titleLabel, attribute: .leading, relatedBy: .equal,
                                                toItem: self.view, attribute: .leading, multiplier: 1, constant: 10)
        let constTopLabel = NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal,
                                               toItem: self.view, attribute: .top, multiplier: 1, constant: 50)
        let constWidthLabel = NSLayoutConstraint(item: titleLabel, attribute: .width, relatedBy: .equal,
                                                 toItem: self.view, attribute: .width, multiplier: 1, constant: 0)
        self.view.addConstraints([constLeadLabel, constTopLabel, constWidthLabel])
        let constHeightLabel = NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal,
                                                  toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        self.titleLabel.addConstraints([constHeightLabel])
        
        tableView = UITableView(frame: CGRect(x: 0, y: 120, width: self.view.frame.width, height: 240))
        tableView!.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView!)
        let constLeadTV = NSLayoutConstraint(item: tableView!, attribute: .leading, relatedBy: .equal,
                                             toItem: self.view, attribute: .leading, multiplier: 1, constant: 0)
        let constTrailTV = NSLayoutConstraint(item: tableView!, attribute: .trailing, relatedBy: .equal,
                                              toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0)
        let constTopTV = NSLayoutConstraint(item: tableView!, attribute: .top, relatedBy: .equal,
                                            toItem: self.view, attribute: .top, multiplier: 1, constant: 120)
        let constBottomTV = NSLayoutConstraint(item: tableView!, attribute: .bottom, relatedBy: .greaterThanOrEqual,
                                              toItem: self.view, attribute: .bottom, multiplier: 1, constant: 5)
        self.view.addConstraints([constLeadTV, constTrailTV, constTopTV, constBottomTV])
        constHeightTV = NSLayoutConstraint(item: tableView!, attribute: .height, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: cellHeight * 4)
        self.tableView?.addConstraints([constHeightTV!])
        
        // configure table
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.register(HeaderTableViewCell.self, forCellReuseIdentifier: "header")
        tableView?.register(DetailTableViewCell.self, forCellReuseIdentifier: "detail")
        tableView?.tableFooterView = UIView()
        tableView?.rowHeight = cellHeight
    }
    
    private func refreshData() {
        if viewModel.numberOfSection > 0 {
            self.tableView?.reloadData()
        }
    }
}

extension EquipmentListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsForSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cellHeader: HeaderTableViewCell = tableView.dequeueReusableCell(withIdentifier: "header", for: indexPath) as! HeaderTableViewCell
            
            let cellData = viewModel.tableCellDataModelForIndexPath(indexPath)
            cellHeader.idLabel.text = cellData.id
            cellHeader.makeLabel.text = cellData.title
            if cellData.collapsed {
                cellHeader.setCollapsedImage()
            } else {
                cellHeader.setExpandedImage()
            }
            return cellHeader
        } else {
            let cellDetail: DetailTableViewCell = tableView.dequeueReusableCell(withIdentifier: "detail", for: indexPath) as! DetailTableViewCell
            
            let cellData = viewModel.tableCellDataModelForIndexPath(indexPath)
            cellDetail.subLabel.text = cellData.id
            cellDetail.valueLabel.text = cellData.title
            return cellDetail
        }
    }
}

extension EquipmentListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = indexPath.section
        viewModel.updateCollapsedSection(section)
        tableView.reloadSections(IndexSet(integer: section), with: .automatic)
        self.tableView!.layoutIfNeeded()
        self.constHeightTV?.constant = min(self.tableView!.contentSize.height, self.view.frame.height - 120)
    }
}
