
//  Helper+Ext.swift
//  TestFrameWorks
//
//  Created by Abdullah Omar on 28/08/2023.
//



import Foundation
import UIKit
import SafariServices
public extension  UIViewController {
    
    // AlertController An action that can be show message  in an alert.
    func showAlert( _ message: String ) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // pass url in func goSafari to open url in Safari
    func goSafari(urlString: String){
        guard let url = URL(string:urlString ) else {return}
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .systemRed
        self.present(safariVC, animated: true)
    }
    
   
}


