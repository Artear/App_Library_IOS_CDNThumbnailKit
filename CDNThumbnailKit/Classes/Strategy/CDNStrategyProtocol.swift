//
//  CDNStrategy.swift
//  CDNThumbnailKit
//
//  Created by Mauro Gonzalez on 22/02/2018.
//

import Foundation

public protocol CDNStrategyProtocol {
    func getCDNThumbnail(width: Int, height: Int) -> CDNThumbnail?
    func add(cdnThumbnail: CDNThumbnail)
    func remove(cdnThumbnail: CDNThumbnail)
}
