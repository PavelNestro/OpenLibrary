//
//  Extension.swift
//  OpenLibrary
//
//  Created by Pavel Nesterenko on 13.04.23.
//

import Foundation

import Foundation
import UIKit

var imageCahce = NSCache<NSString, UIImage>()
extension UIImageView {
    func downloadImage(for stringUrl: String) {
        if let image = imageCahce.object(forKey: NSString(string: stringUrl)) {
            self.image = image
            return
        }
        
        guard let url = URL(string: stringUrl) else {
            print("invalid url")
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
            }
            
            if let data = try? Data(contentsOf: url) {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    imageCahce.setObject(image ?? UIImage(), forKey: NSString(string: stringUrl))
                    self.image = image
                }
                
            }
            
            
            
        }
        task.resume()
        
    }
    
}
