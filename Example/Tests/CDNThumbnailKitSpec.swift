//
//  CDNThumbnailKitSpec.swift
//  CDNThumbnailKit_Tests
//
//  Created by Jose Luis Sagredo on 19/3/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import CDNThumbnailKit

class CDNThumbnailKitSpec: QuickSpec {
    override func spec() {
        describe("the cdn is registered") {
            
            CDNThumbnailKit.shared.register(CDNArtearThumbnail())
            
            describe("create variables") {
                let CDN_HOST_PATH = "https://cdn.tn.com.ar/sites/default/files/styles"
                let IMAGE_PATH = "public/2018/03/19/capturadeeee.jpg"
                
                let imageOne = CDNImage(url:
                    URL(string: "\(CDN_HOST_PATH)/375x212/\(IMAGE_PATH)")!
                )
                
                context("create strategy default") {
                    
                    let wideDimension = CDNStrategyDefault(scale:1)
                    wideDimension.add(cdnThumbnail: CDNThumbnail(width: 153, height: 86, type: .center))
                    wideDimension.add(cdnThumbnail: CDNThumbnail(width: 240, height: 135, type: .center))
                    wideDimension.add(cdnThumbnail: CDNThumbnail(width: 320, height: 180, type: .center))
                    wideDimension.add(cdnThumbnail: CDNThumbnail(width: 375, height: 212, type: .center))
                    wideDimension.add(cdnThumbnail: CDNThumbnail(width: 532, height: 298, type: .center))
                    wideDimension.add(cdnThumbnail: CDNThumbnail(width: 650, height: 365, type: .center))
                    wideDimension.add(cdnThumbnail: CDNThumbnail(width: 760, height: 426, type: .center))
                    wideDimension.add(cdnThumbnail: CDNThumbnail(width: 980, height: 550, type: .center))
                    wideDimension.add(cdnThumbnail: CDNThumbnail(width: 1024, height: 573, type: .center))
                    wideDimension.add(cdnThumbnail: CDNThumbnail(width: 1366, height: 765, type: .center))
                    
                    it("image 375x212 to 320x180") {
                        
                        let preset = imageOne.getURL(
                            thumbnail: wideDimension.getCDNThumbnail(width: 320, height: 180)
                        )
                        expect(preset.absoluteString).to(
                            equal("\(CDN_HOST_PATH)/320x180/\(IMAGE_PATH)")
                        )
                    }
                    
                    it("image 375x212 to 760x426") {
                        let imageOne = CDNImage(url:
                            URL(string: "\(CDN_HOST_PATH)/375x212/\(IMAGE_PATH)")!
                        )
                        
                        let preset = imageOne.getURL(
                            thumbnail: wideDimension.getCDNThumbnail(width: 770, height: 436)
                        )
                        expect(preset.absoluteString).to(
                            equal("\(CDN_HOST_PATH)/760x426/\(IMAGE_PATH)")
                        )
                    }
                    
                    it("image 375x212 to 1366x765") {
                        let imageOne = CDNImage(url:
                            URL(string: "\(CDN_HOST_PATH)/375x212/\(IMAGE_PATH)")!
                        )
                        
                        let preset = imageOne.getURL(
                            thumbnail: wideDimension.getCDNThumbnail(width: 2000, height: 765)
                        )
                        expect(preset.absoluteString).to(
                            equal("\(CDN_HOST_PATH)/1366x765/\(IMAGE_PATH)")
                        )
                    }
                    
                }
            }
        }
    }
}
