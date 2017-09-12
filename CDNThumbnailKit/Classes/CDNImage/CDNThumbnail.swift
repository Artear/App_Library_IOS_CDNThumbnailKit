//
//  CDNThumbnail.swift
//  Pods
//
//  Created by Jose Luis Sagredo on 12/9/17.
//
//

import UIKit

public struct CDNThumbnail {
    
    public enum Types {
        case scaleToFill
        case scaleAspectFit
        case scaleAspectFill
        case redraw
        case center
        case top
        case bottom
        case left
        case right
        case topLeft
        case topRight
        case bottomLeft
        case bottomRight
    }
    
    public var width: Int = 0
    public var height: Int = 0
    public var type: Types = .scaleToFill
    public var params:[String:String]?
    
    public init(width: Int, height: Int, type: Types = .scaleToFill, params:[String:String]? = nil) {
        self.width  = width
        self.height = height
        self.type   = type
        self.params = params
    }
}
