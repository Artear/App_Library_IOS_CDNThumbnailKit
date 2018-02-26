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
        
        let images:[String] = [
            "http://vodgc.com/p/107/sp/10700/thumbnail/entry_id/0_4ucbsbhf/width/375/height/212/type/2/bgcolor/000000",
            "http://vodgc.com/p/107/sp/10700/thumbnail/entry_id/0_cp9nzqzy",
            "https://vignette.wikia.nocookie.net/rockosmodernlife/images/5/5e/Rocko_Wallaby.png"
        ]
        
        let cdnStrategy = CDNStrategyDefault()
        cdnStrategy.add(cdnThumbnail: CDNThumbnail(width: 96, height: 96, type: .center, params: nil))
        cdnStrategy.add(cdnThumbnail: CDNThumbnail(width: 200, height: 200, type: .center, params: nil))
        cdnStrategy.add(cdnThumbnail: CDNThumbnail(width: 300, height: 300, type: .center, params: nil))
        cdnStrategy.add(cdnThumbnail: CDNThumbnail(width: 300, height: 96, type: .center, params: nil))

        var count = 0
        for image in images {
            count+=1
            print("Image \(count)")
            let urlOne = URL(string: image)!
            let imageOne = CDNImage(url: urlOne)
            
            print("[   IMAGE   ]> \(imageOne.getURL())")
            print("[  ORIGIAL  ]> \(imageOne.getURL(original: true))")
            print("[   96X96   ]> \(imageOne.getURL(thumbnail: cdnStrategy.getCDNThumbnail(width: 96, height: 96) ))")
            
            print("")
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

