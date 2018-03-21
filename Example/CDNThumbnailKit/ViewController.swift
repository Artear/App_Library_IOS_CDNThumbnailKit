//
//  ViewController.swift
//  CDNThumbnailKit
//
//  Created by jsagredo.ing@gmail.com on 09/12/2017.
//  Copyright (c) 2017 jsagredo.ing@gmail.com. All rights reserved.
//

import UIKit
import CDNThumbnailKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var secondLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.loadImages()
        
        
    }

    @IBAction func reloadImages(_ sender: Any) {
        self.loadImages()
    }
    
    
    func loadImages() {
        
        let wideDimension = CDNStrategyConnection()
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
        
        let image = "http://vodgc.com/p/107/sp/10700/thumbnail/entry_id/0_4ucbsbhf/width/375/height/212/type/2/bgcolor/000000"
        
        let imageOne = CDNImage(url: URL(string: image)!)
        
        self.firstImageView.image = nil
        self.secondImageView.image = nil

        self.firstImageView.imageURL(imageOne.getURL().absoluteString)
        let thumbnail = wideDimension.getCDNThumbnail(width: 532, height: 298)
        self.secondImageView.imageURL(imageOne.getURL(thumbnail: thumbnail).absoluteString)

        self.firstLabel.text = "Size original: (375, 212)"
        self.secondLabel.text = "Size strategy: (\(thumbnail!.width), \(thumbnail!.height) \n \(NetworkAnalyzer.shared.checkType()) )"

    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

