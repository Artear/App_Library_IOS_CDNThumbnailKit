//
//  CDNStrategyConnection.swift
//  CDNThumbnailKit
//
//  Created by Mauro Gonzalez on 26/02/2018.
//

import Foundation

public class CDNStrategyConnection: CDNStrategyDefault {    
    
    public override func getCDNThumbnail(width: Int, height: Int) -> CDNThumbnail? {
        var returns : CDNThumbnail?

        returns = super.getCDNThumbnail(width: width, height: height)
        if (returns != nil) {
            let size = self.getConnectionSize(width: returns!.width , height: returns!.height)
            returns!.height = Int(size.height)
            returns!.width = Int(size.width)
        }
        return returns
    }

    func getConnectionSize(width: Int, height: Int) -> CGSize{
        var size = CGSize()
        switch NetworkAnalyzer.shared.getRechabilityStatus() {
        case .wifi:
            size = CGSize(width: width, height: height)
        case .cellular:
            switch NetworkAnalyzer.shared.checkType(){
            case ._LTE:
                size = CGSize(width: width * 2 / 3, height: height * 2 / 3)
            case ._3G:
                size = CGSize(width: width / 2, height: height / 2)
            case ._2G:
                size = CGSize(width: width / 3, height: height / 3)
            default:
                break
            }
        default:
            size = CGSize(width: width / 3, height: height / 3)
        }
        return size
    }
}
