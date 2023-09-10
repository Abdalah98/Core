////
////  BaseTableViewModel.swift
////  TestFrameWorks
////
////  Created by Abdullah Omar on 03/09/2023.
////
//
//import Foundation
//import UIKit
//
class BaseTableViewModel<T> {
    // Data source for the table view
    var items: [T] = [] {
        didSet {
            // Notify observers that the data has changed
            dataUpdated?()
        }
    }
    
    // callback for interfaces
    var showAlertClouser:(()->())?
    var updateLoadingStatus : (()->())?
 
    // MARK: - State Handling

    var state: State = .empty {
        didSet {
            self.updateLoadingStatus?()
        }
    }

    var alertMessage: String? {
        didSet{
            self.showAlertClouser?()
        }
    }
    
    
    // Closure to notify observers when data changes
    var dataUpdated: (() -> Void)?
    
    // Number of sections in the table view
    var numberOfSections: Int {
        return 1
    }
    
    // Number of rows in the table view
    var numberOfRows: Int {
        return items.count
    }
    
    // Initialize the view model with data
    init(items: [T]) {
        self.items = items
    }
    
    // Get the item at a specific index path
    func getItem(at indexPath: IndexPath) -> T {
        return items[indexPath.row]
    }
    
    // Reload data in the table view
    func reloadData() {
        dataUpdated?()
    }
    
}
