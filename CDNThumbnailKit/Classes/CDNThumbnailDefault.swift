//
//  CDNThumbnailDefault.swift
//  Pods
//
//  Created by Jose Luis Sagredo on 12/9/17.
//
//

import UIKit

class CDNThumbnailDefault: CDNThumbnailProtocol {
    func validate(_ image: URL) -> Bool {
        return true
    }
    
    func thumbnail(image: URL, thumbnail: CDNThumbnail?) -> URL {
        return image
    }
}
