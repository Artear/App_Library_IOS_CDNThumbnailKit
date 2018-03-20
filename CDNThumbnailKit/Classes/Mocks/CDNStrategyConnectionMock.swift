//
//  CDNStrategyConnectionMock.swift
//  CDNThumbnailKit
//
//  Created by Mauro Gonzalez on 20/03/2018.
//

import Foundation

public class CDNStrategyConnectionMock: CDNStrategyConnection {
    private var connection = NetworkAnalyzer.TelephonyNetwork._unknow
    
    public init(scale: CGFloat, connection:NetworkAnalyzer.TelephonyNetwork) {
        super.init()
        self.strategyDefault = CDNStrategyDefaultMock(scale: scale)
        self.connection = connection
    }
    
    override func networkType() -> NetworkAnalyzer.TelephonyNetwork {
        return self.connection
    }
}
