////
////  ImageLoader.swift
////  TestFrameWorks
////
////  Created by Abdullah Omar on 28/08/2023.
////
//
import Foundation
import UIKit
import Foundation
import UIKit

 public class ImageLoader {
     public static let shared = ImageLoader()
    
    private let imageCache = NSCache<NSString, UIImage>()
    
    private init() {}
    
     public func loadImage(withURL urlString: String, into imageView: UIImageView, placeHolder: UIImage? = nil) {
        imageView.image = placeHolder
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            imageView.image = cachedImage
            print("Image loaded from cache for URL: \(urlString)")
            return
        }
        
        downloadImageAndCache(withURL: urlString, into: imageView, placeHolder: placeHolder)
    }
    
    private func downloadImageAndCache(withURL urlString: String, into imageView: UIImageView, placeHolder: UIImage?) {
        guard let url = URL(string: urlString) else {
            imageView.image = placeHolder
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error loading image from URL: \(error)")
                DispatchQueue.main.async {
                    imageView.image = placeHolder
                }
                return
            }
            
            if let data = data, let downloadedImage = UIImage(data: data) {
                self.imageCache.setObject(downloadedImage, forKey: urlString as NSString)
                
                DispatchQueue.main.async {
                    imageView.image = downloadedImage
                    print("Image downloaded and cached for URL: \(urlString)")
                }
            }
        }.resume()
    }
}


