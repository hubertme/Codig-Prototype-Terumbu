//
//  GlobalFunctions.swift
//  Codig-Prototype-Terumbu
//
//  Created by Hubert Wang on 13/12/18.
//  Copyright © 2018 Hubert Wang. All rights reserved.
//

import Foundation
import UIKit

func fetchImageFromUrl(_ urlString: String,_ completion: @escaping (UIImage)->()){
    guard let url = URL(string: urlString) else {
        print("No url string")
        return
    }
    var image = UIImage()
    URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
        if let error = error {
            print("Error fetching image:", error.localizedDescription)
            return
        }
        guard let data = data else {return}
//        print(response?.suggestedFilename ?? url.lastPathComponent)
        image = UIImage(data: data) ?? UIImage()
        
        completion(image)
    }).resume()
}
