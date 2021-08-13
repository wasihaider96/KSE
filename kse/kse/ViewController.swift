//
//  ViewController.swift
//  kse
//
//  Created by Dev ILI on 12/08/2021.
//

import UIKit

class ViewController: UIViewController, NavigationController {
    
    @IBOutlet weak var iCarouselView: iCarousel!
    var imgArr = [  UIImage(named:"Image1.png")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iCarouselView.type = .rotary
        iCarouselView.contentMode = .scaleAspectFill
        iCarouselView.isPagingEnabled = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: iCarouselDelegate, iCarouselDataSource {
    func numberOfItems(in carousel: iCarousel) -> Int {
        return imgArr.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
        var imageView: UIImageView!
        if view == nil {
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 0, height: 300))
            imageView.contentMode = .scaleAspectFit
        } else {
            imageView = view as? UIImageView
        }
        
        imageView.image = imgArr[index]
        return imageView
    }
}
    
    
