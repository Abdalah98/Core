////
////  BaseTableViewModel.swift
////  TestFrameWorks
////
////  Created by Abdullah Omar on 03/09/2023.
////
//
import Foundation
import UIKit

 open class BaseTableViewModel<T> {
    // Data source for the table view
     public var items: [T] = [] {
        didSet {
            // Notify observers that the data has changed
            dataUpdated?()
        }
    }
    
    // callback for interfaces
     public  var showAlertClouser:(()->())?
     public  var updateLoadingStatus : (()->())?
 
    // MARK: - State Handling

     public  var state: State = .empty {
        didSet {
            self.updateLoadingStatus?()
        }
    }

     public  var alertMessage: String? {
        didSet{
            self.showAlertClouser?()
        }
    }
    
    
    // Closure to notify observers when data changes
     public   var dataUpdated: (() -> Void)?
    
    // Number of sections in the table view
    public   var numberOfSections: Int {
        return 1
    }
    
    // Number of rows in the table view
     public var numberOfRows: Int {
        return items.count
    }
    
    // Initialize the view model with data
     public init(items: [T]) {
        self.items = items
    }
    
    // Get the item at a specific index path
     public   func getItem(at indexPath: IndexPath) -> T {
        return items[indexPath.row]
    }
    
    // Reload data in the table view
     public  func reloadData() {
        dataUpdated?()
    }
    
}
