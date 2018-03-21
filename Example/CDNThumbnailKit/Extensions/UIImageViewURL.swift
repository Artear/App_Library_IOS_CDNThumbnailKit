//
//  UIImageViewURL.swift
//  CDNThumbnailKit_Example
//
//  Created by Mauro Gonzalez on 21/03/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

extension UIImageView {
    public func imageURL(_ url:String){
        Alamofire.request(url).validate().responseData(completionHandler: { (data) in
            if let image = UIImage(data: data.data!, scale: UIScreen.main.scale) {
                self.image = image
            }
        })

    }
}
