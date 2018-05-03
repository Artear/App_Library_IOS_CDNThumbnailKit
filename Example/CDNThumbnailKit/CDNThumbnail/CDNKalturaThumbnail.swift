//
//  CDNKalturaThumbnail.swift
//  CDNThumbnailKit
//
//  Created by Jose Luis Sagredo on 12/9/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import CDNThumbnailKit

class CDNKalturaThumbnail: CDNThumbnailProtocol {
    func validate(_ image:URL) -> Bool {
        if image.host?.lowercased().range(of:"vodgc.com") != nil {
            return true
        }
        return false
    }
    
    func thumbnail(image: URL, thumbnail: CDNThumbnail?) -> URL {
        return self.replaceThumbnail(
            image: image,
            thumbnail: self.getThumbnailPath(thumbnail: thumbnail)
        )
    }
    
    //-----------------------------------------------------------------------------------
    // FUNCTION THUMBNAIL
    //-----------------------------------------------------------------------------------
    
    func getThumbnailPath(thumbnail:CDNThumbnail?) -> String? {
        if let thumbnailKaltura = thumbnail {
            return "width/\(thumbnailKaltura.width)/height/\(thumbnailKaltura.height)/type/2/bgcolor/000000"
        }
        return nil
    }
    
    func replaceThumbnail(image:URL, thumbnail:String?) -> URL {
        do {
            let urlBase = image.absoluteString
            let regex = try NSRegularExpression(
                pattern: [
                    "([a-z]+://)",
                    "vodgc.com/p/",
                    "([0-9]+)",
                    "/sp/",
                    "([0-9]+)",
                    "/thumbnail/entry_id/",
                    "([0-9a-zA-Z_]+)"
                    ].joined(),
                options: NSRegularExpression.Options.caseInsensitive
            )
            
            let matches = regex.matches(
                in: urlBase,
                options: [],
                range: NSMakeRange(0,urlBase.count)
            )
            
            for matche in matches {
                let NSURLBase = (urlBase as NSString)
                if matche.numberOfRanges > 4 {
                    
                    let urlBaseRegex = [
                        NSURLBase.substring(with: matche.range(at: 1)),
                        "vodgc.com/p/",
                        NSURLBase.substring(with: matche.range(at: 2)),
                        "/sp/",
                        NSURLBase.substring(with: matche.range(at: 3)),
                        "/thumbnail/entry_id/",
                        NSURLBase.substring(with: matche.range(at: 4)),
                        (thumbnail != nil ? "/\(thumbnail!)":"")
                    ]
                    
                    if let newUrl = URL(string: urlBaseRegex.joined()) {
                        return newUrl
                    }
                }
            }
            
        } catch { }
        
        return image
    }
}
