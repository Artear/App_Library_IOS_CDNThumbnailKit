//
//  CDNThumbnailProtocol.swift
//  Pods
//
//  Created by Jose Luis Sagredo on 12/9/17.
//
//

import UIKit

public protocol CDNThumbnailProtocol {
    func validate(_ image:URL) -> Bool
    func thumbnail(image:URL, thumbnail:CDNThumbnail?) -> URL
}
