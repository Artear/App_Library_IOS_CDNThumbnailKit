//
//  CDNThumbnailKit.swift
//  Pods
//
//  Created by Jose Luis Sagredo on 12/9/17.
//
//

import UIKit

public class CDNThumbnailKit {
    public static let shared = CDNThumbnailKit()
    private var cdns = [String:CDNThumbnailProtocol]()
    private init() {}
    
    public func register(_ cdn:CDNThumbnailProtocol) {
        let protocolType = type(of: cdn)
        if self.cdns["\(protocolType)"] != nil {
            self.log("CDN currently exists: \(protocolType)")
            return
        }
        self.cdns["\(protocolType)"] = cdn
    }
    
    public func register(_ cdns:[CDNThumbnailProtocol]) {
        for cdn in cdns {
            self.register(cdn)
        }
    }
    
    public func getCDN(_ image:URL) -> CDNThumbnailProtocol {
        for cdn in self.cdns {
            if cdn.value.validate(image) {
                return cdn.value
            }
        }
        return CDNThumbnailDefault()
    }
    
    private func log(_ data:Any){
        print("[CDNThumbnailKit] \(data)")
    }
}

