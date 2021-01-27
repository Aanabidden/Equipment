//
//  ListViewModel.swift
//  JarusTech
//
//  Created by Aradhana on 23/01/21.
//

import Foundation
import UIKit

class ListViewModel {
    // Output
    var numberOfSection = 0
    // Input
    var bindToSourceViewModels :(() -> ()) = {  }
    
    private var tableDataSection = [SectionDetail]()
    private var tableDataRows = [[SectionDetail]]()
    private var dataModel: [Equipment]! {
        didSet {
            configureTableDataSource()
            configureOutput()
        }
    }
    
    init() {
        self.fetchList()
    }
    
    func fetchList() {
        if let json = NSDataAsset(name: "Data") {
            let decoder = JSONDecoder()
            do {
                let modelList = try decoder.decode([Equipment].self, from: json.data)
                self.dataModel = modelList
            } catch {
                print("\(error)")
            }
        }
    }
    
    private func configureTableDataSource() {
        for item in dataModel {
            let section = SectionDetail(id: "\(item.id)", title: item.make)
            tableDataSection.append(section)
            
            var rowData = [SectionDetail]()
            let rowVin = SectionDetail(id: "VIN", title: item.vin)
            rowData.append(rowVin)
            let rowYear = SectionDetail(id: "Year", title: "\(item.year)")
            rowData.append(rowYear)
            let rowMake = SectionDetail(id: "Make", title: item.make)
            rowData.append(rowMake)
            let rowValue = SectionDetail(id: "Value", title: "\(item.value)")
            rowData.append(rowValue)
            let rowLength = SectionDetail(id: "Length", title: "\(item.length)")
            rowData.append(rowLength)
            tableDataRows.append(rowData)
        }
    }
    
    private func configureOutput() {
        numberOfSection = dataModel.count
        bindToSourceViewModels()
    }
    
    func numberOfRowsForSection(_ section: Int) -> Int {
        if tableDataSection[section].collapsed {
            return 1
        } else {
            return 1 + tableDataRows[section].count
        }
    }
    
    func tableCellDataModelForIndexPath(_ indexPath: IndexPath) -> SectionDetail {
        let row = indexPath.row
        if row == 0 {
            return  tableDataSection[indexPath.section]
        } else {
            return tableDataRows[indexPath.section][row-1]
        }
    }
    
    func updateCollapsedSection(_ section: Int) {
        // Toggle collapse
        tableDataSection[section].updateCollapse()
    }
}
