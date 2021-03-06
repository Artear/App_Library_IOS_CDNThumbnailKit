//
//  CDNStrategyDefault.swift
//  CDNThumbnailKit
//
//  Created by Mauro Gonzalez on 22/02/2018.
//

import Foundation

public class CDNStrategyDefault: CDNStrategyProtocol {
    private var cdnList: [CDNThumbnail]
    
    public init() {
        self.cdnList = [CDNThumbnail]()
    }
    
    public func add(cdnThumbnail: CDNThumbnail) {
        self.cdnList.append(cdnThumbnail)
    }
    
    public func remove(cdnThumbnail: CDNThumbnail) {
        self.remove(cdnThumbnail: cdnThumbnail)
    }
    
    public func getCDNThumbnail(_ size: CGSize) -> CDNThumbnail? {
        return self.getCDNThumbnail(width: Int(size.width), height: Int(size.height))
    }
    
    public func getCDNThumbnail(width: Int, height: Int) -> CDNThumbnail? {
        var returns : CDNThumbnail?
        if cdnList.count != 0 {
            var bestWidthDiff = Int.max
            for cdn in self.cdnList {
                let diff = abs(cdn.width - width * Int(screenScale()))
                if diff < bestWidthDiff{
                    bestWidthDiff = diff
                    returns = cdn
                }
            }
        }
        return returns
    }
    
    func screenScale() -> CGFloat{
        return UIScreen.main.scale
    }
}
