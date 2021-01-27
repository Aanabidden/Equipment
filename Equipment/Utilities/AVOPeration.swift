//
//  AVOperation.swift
//  Equipment
//
//  Created by Aradhana on 23/01/21.
//

import Foundation
import UIKit

class AVOPeration<Success, Failure>: Operation where Failure: Error {
    var assetName: String!
    
    public var result: Result<Success, Failure>!
    
    override var isAsynchronous: Bool {
        get {
            return true
        }
    }
    
    private var _executing = false {
        willSet {
            willChangeValue(forKey: "isExecuting")
        }
        didSet {
            didChangeValue(forKey: "isExecuting")
        }
    }
    
    override var isExecuting: Bool {
        return _executing
    }
    
    private var _finished = false {
        willSet {
            willChangeValue(forKey: "isFinished")
        }
            
        didSet {
            didChangeValue(forKey: "isFinished")
        }
    }
        
    override var isFinished: Bool {
        return _finished
    }
        
    func executing(_ executing: Bool) {
        _executing = executing
    }
        
    func finish(_ finished: Bool) {
        _finished = finished
    }
        
    required init (asset: String) {
        self.assetName = asset
    }
    
    override func main() {
        guard isCancelled == false else {
            finish(true)
            return
        }
        self.executing(true)
        //Asynchronous logic
        self.readDataFromAsset()
    }
        
    func readDataFromAsset() {
        if let json = NSDataAsset(name: assetName) {
            let decoder = JSONDecoder()
            do {
                let modelList = try decoder.decode([Equipment].self, from: json.data)
                result = .success(modelList as! Success)
            } catch {
                self.result = .failure(error as! Failure)

            }
            self.finish(true)
            self.executing(false)
        }
    }
}
