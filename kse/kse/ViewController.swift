//
//  ViewController.swift
//  kse
//
//  Created by Dev ILI on 12/08/2021.
//

import UIKit

class ViewController: NavigationController {
    @IBOutlet weak var CollectionViewIB: UICollectionView!
    
    var images = ["", "", "", "", "", ""]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewFlowLayout
{
    func collectionView(_ collectview: UICollectionView, numberOfItemsInSection section: Int ) ->Int {
        return
    }
    func collectionView(_ collectview: UICollectionView, cellForItemAt indexPath: IndexPath ) ->UICollectionViewCell {
        
    }
}
