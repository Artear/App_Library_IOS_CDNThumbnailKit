//
//  CDNStrategyDefaultMock.swift
//  CDNThumbnailKit
//
//  Created by Mauro Gonzalez on 20/03/2018.
//

import Foundation

public class CDNStrategyDefaultMock: CDNStrategyDefault {
    private var mockScale = UIScreen.main.scale
    
    public init(scale:CGFloat = UIScreen.main.scale) {
        super.init()
        self.mockScale = scale
    }
    
    override func screenScale() -> CGFloat{
        return mockScale
    }
    
}


