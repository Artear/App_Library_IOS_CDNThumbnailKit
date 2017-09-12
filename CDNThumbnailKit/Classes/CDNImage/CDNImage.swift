//
//  CDNImage.swift
//  Pods
//
//  Created by Jose Luis Sagredo on 12/9/17.
//
//

import UIKit

public class CDNImage: NSObject {
    internal let url:URL
    internal let cdn:CDNThumbnailProtocol
    
    public init(url:URL) {
        self.url = url
        self.cdn = CDNThumbnailKit.shared.getCDN(url)
    }
    
    public func getURL(original:Bool = false) -> URL {
        if original {
            return self.cdn.thumbnail(image: self.url, thumbnail: nil)
        }
        return self.url
    }
    
    public func getURL(thumbnail:CDNThumbnail) -> URL {
        return self.cdn.thumbnail(image: self.url, thumbnail: thumbnail)
    }
    
}
