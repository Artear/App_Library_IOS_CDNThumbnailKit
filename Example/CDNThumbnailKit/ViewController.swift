//
//  ViewController.swift
//  CDNThumbnailKit
//
//  Created by jsagredo.ing@gmail.com on 09/12/2017.
//  Copyright (c) 2017 jsagredo.ing@gmail.com. All rights reserved.
//

import UIKit
import CDNThumbnailKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let wideDimension = CDNStrategyConnection()
        wideDimension.add(cdnThumbnail: CDNThumbnail(width: 153, height: 86, type: .center))
        wideDimension.add(cdnThumbnail: CDNThumbnail(width: 240, height: 135, type: .center))
        wideDimension.add(cdnThumbnail: CDNThumbnail(width: 320, height: 180, type: .center))
        wideDimension.add(cdnThumbnail: CDNThumbnail(width: 375, height: 212, type: .center))
        wideDimension.add(cdnThumbnail: CDNThumbnail(width: 532, height: 298, type: .center))
        wideDimension.add(cdnThumbnail: CDNThumbnail(width: 650,
                                                     height: 365, type: .center))
        wideDimension.add(cdnThumbnail: CDNThumbnail(width: 760, height: 426, type: .center))
        wideDimension.add(cdnThumbnail: CDNThumbnail(width: 980, height: 550, type: .center))
        wideDimension.add(cdnThumbnail: CDNThumbnail(width: 1024, height: 573, type: .center))
        wideDimension.add(cdnThumbnail: CDNThumbnail(width: 1366, height: 765, type: .center))

        var images = [String]()
        images.append("http://vodgc.com/p/107/sp/10700/thumbnail/entry_id/0_4ucbsbhf/width/375/height/212/type/2/bgcolor/000000")
        images.append("http://vodgc.com/p/107/sp/10700/thumbnail/entry_id/0_cp9nzqzy")
        images.append("https://vignette.wikia.nocookie.net/rockosmodernlife/images/5/5e/Rocko_Wallaby.png")

        var count = 0
        for image in images{
            count = count + 1
            print("ViewController - Image: \(count)")
            let imageOne = CDNImage(url: URL(string: image)!)
            
            print("ViewController - [   Image       ]: \(imageOne.getURL())")
            print("ViewController - [   Original    ]: \(imageOne.getURL(original: true))")
            print("ViewController - [   96x96       ]: \(imageOne.getURL(thumbnail: wideDimension.getCDNThumbnail(width: 532, height: 298)))")

        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

