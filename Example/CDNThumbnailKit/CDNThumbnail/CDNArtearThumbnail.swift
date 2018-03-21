//
//  CDNArtearThumbnail.swift
//  tn
//
//  Created by Jose Luis Sagredo on 12/9/17.
//  Copyright © 2017 Artear. All rights reserved.
//

import UIKit
import CDNThumbnailKit

class CDNArtearThumbnail: CDNThumbnailProtocol {
    func validate(_ image:URL) -> Bool {
        if image.host?.lowercased().range(of:"cdn.tn.com.ar") != nil {
            return true
        }
        if image.host?.lowercased().range(of:"cdn-stg.tn.com.ar") != nil {
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
        if let thumbnailArtear = thumbnail {
            return "styles/\(thumbnailArtear.width)x\(thumbnailArtear.height)/public/"
        }
        return nil
    }
    
    func replaceThumbnail(image:URL, thumbnail:String?) -> URL {
        do {
            let urlBase = image.absoluteString
            
            let regex = try NSRegularExpression(
                pattern: "styles/([a-zA-Z0-9_]+)/public/",
                options: NSRegularExpression.Options.caseInsensitive
            )
            
            var urlBaseRegex = regex.stringByReplacingMatches(
                in: urlBase,
                options: [],
                range: NSMakeRange(0,urlBase.count),
                withTemplate: (thumbnail != nil ? thumbnail!:"")
            )
            
            if let filePreset = thumbnail {
                if urlBaseRegex.range(of:"files/styles") == nil {
                    urlBaseRegex = urlBaseRegex.replacingOccurrences(
                        of: "files/",
                        with: "files/\(filePreset)"
                    )
                }
            }
            
            if let newUrl = URL(string: urlBaseRegex) {
                return newUrl
            }
            
        } catch { }
        
        return image
    }
}

