//
//  CDNStrategyConnection.swift
//  CDNThumbnailKit
//
//  Created by Mauro Gonzalez on 26/02/2018.
//

import Foundation
import Reachability
import CoreTelephony

public class CDNStrategyConnection: CDNStrategyDefault {

    let reachability = Reachability()!
    
    
    public override func getCDNThumbnail(width: Int, height: Int) -> CDNThumbnail? {
        var returns : CDNThumbnail?
        
        return returns
    }

    func getConnectionSize(width: Int, height: Int) -> CGSize{
        var size = CGSize()
        switch self.getRechabilityStatus() {
        case .wifi:
            size = CGSize(width: width, height: height)
        case .cellular:
            size = CGSize(width: width / 2, height: height / 2)
        default:
            size = CGSize(width: width / 3, height: height / 3)
        }
        return size
    }
    
    
    func checkType() {
        let netInfo = CTTelephonyNetworkInfo()
        
        guard let connection = netInfo.currentRadioAccessTechnology else {
            return
        }
        
        switch connection {
        case CTRadioAccessTechnologyGPRS,
             CTRadioAccessTechnologyEdge,
             CTRadioAccessTechnologyCDMA1x:
            print("2G")
            return
        case CTRadioAccessTechnologyWCDMA,
             CTRadioAccessTechnologyHSDPA,
             CTRadioAccessTechnologyHSUPA,
             CTRadioAccessTechnologyeHRPD,
             CTRadioAccessTechnologyCDMAEVDORev0,
             CTRadioAccessTechnologyCDMAEVDORevA,
             CTRadioAccessTechnologyCDMAEVDORevB:
            print("3G")
            return
        case CTRadioAccessTechnologyLTE:
            print("4G")
            return
        default:
            print("unknow")
            return

        }
    }
    
    
    
    func getRechabilityStatus() -> Reachability.Connection{
        return self.reachability.connection
    }
    
    
    
}
