//
//  CDNStrategyConnection.swift
//  CDNThumbnailKit
//
//  Created by Mauro Gonzalez on 26/02/2018.
//

import Foundation

public class CDNStrategyConnection: CDNStrategyProtocol {
    
    var strategyDefault : CDNStrategyProtocol!
    
    public init() {
        self.strategyDefault = CDNStrategyDefault()
    }
    
    public func getCDNThumbnail(width: Int, height: Int) -> CDNThumbnail? {
        var returns : CDNThumbnail?
        let size = self.getConnectionSize(width: width , height: height)
        returns = self.strategyDefault.getCDNThumbnail(width: Int(size.width), height: Int(size.height))
        return returns
    }

    func getConnectionSize(width: Int, height: Int) -> CGSize{
        var size = CGSize()
        switch self.networkType() {
        case ._WIFI:
            size = CGSize(width: width, height: height)
        case ._LTE:
            size = CGSize(width: width * 2 / 3, height: height * 2 / 3)
        case ._3G:
            size = CGSize(width: width / 2, height: height / 2)
        case ._2G:
            size = CGSize(width: width / 3, height: height / 3)
        default:
            size = CGSize(width: width / 3, height: height / 3)
        }
        return size
    }

    public func add(cdnThumbnail: CDNThumbnail) {
        self.strategyDefault.add(cdnThumbnail: cdnThumbnail)
    }
    
    public func remove(cdnThumbnail: CDNThumbnail) {
        self.strategyDefault.remove(cdnThumbnail: cdnThumbnail)
    }
    
    func networkType() -> NetworkAnalyzer.TelephonyNetwork {
        return NetworkAnalyzer.shared.checkType()
    }

}
