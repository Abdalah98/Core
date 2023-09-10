////
////  CustomActivityIndicator.swift
////  TestFrameWorks
////
////  Created by Abdullah Omar on 29/08/2023.
////

import Foundation

import UIKit

import UIKit

public class CustomActivityIndicator: UIView {
    private let activityView = UIView()
    private let animationDuration: TimeInterval = 0.8

  public override init(frame: CGRect) {
        super.init(frame: frame)
        setupActivityIndicator()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupActivityIndicator()
    }

    private func setupActivityIndicator() {
        activityView.backgroundColor = UIColor(white: 0 , alpha: 0.1)
        activityView.layer.cornerRadius = 10
        addSubview(activityView)
        
        let activitySize: CGFloat = 100
        let xPosition = (frame.width - activitySize) / 2
        let yPosition = (frame.height - activitySize) / 2
        activityView.frame = CGRect(x: xPosition, y: yPosition, width: activitySize, height: activitySize)
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.startAnimating()
        activityIndicator.center = CGPoint(x: activitySize / 2, y: activitySize / 2)
        activityView.addSubview(activityIndicator)
    }

   public func startAnimating() {
        isHidden = false
        alpha = 1
        activityView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)

        UIView.animate(withDuration: animationDuration, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.activityView.transform = CGAffineTransform.identity
        }, completion: nil)
    }

  public  func stopAnimating() {
        UIView.animate(withDuration: animationDuration, animations: {
            self.alpha = 0
        }) { _ in
            self.isHidden = true
            self.activityView.layer.removeAllAnimations()
        }
    }
}
