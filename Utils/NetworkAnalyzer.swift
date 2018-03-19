//
//  NetworkAnalyzer.swift
//  CDNThumbnailKit
//
//  Created by Mauro Gonzalez on 19/03/2018.
//

import Foundation
import CoreTelephony
import Reachability

public class NetworkAnalyzer {
    public static let shared = NetworkAnalyzer()
    private init() {}

    private let reachability = Reachability()!

    public enum TelephonyNetwork {
        case _LTE
        case _3G
        case _2G
        case _Unknow
    }
    
    public func checkType() ->TelephonyNetwork {
        let netInfo = CTTelephonyNetworkInfo()
        
        guard let connection = netInfo.currentRadioAccessTechnology else {
            return ._Unknow
        }
        
        switch connection {
        case CTRadioAccessTechnologyGPRS,
             CTRadioAccessTechnologyEdge,
             CTRadioAccessTechnologyCDMA1x:
            return ._2G
        case CTRadioAccessTechnologyWCDMA,
             CTRadioAccessTechnologyHSDPA,
             CTRadioAccessTechnologyHSUPA,
             CTRadioAccessTechnologyeHRPD,
             CTRadioAccessTechnologyCDMAEVDORev0,
             CTRadioAccessTechnologyCDMAEVDORevA,
             CTRadioAccessTechnologyCDMAEVDORevB:
            return ._3G
        case CTRadioAccessTechnologyLTE:
            return ._LTE
        default:
            return ._Unknow
            
        }
    }
    
    public func getRechabilityStatus() -> Reachability.Connection{
        return self.reachability.connection
    }

}
