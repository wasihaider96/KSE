//
//  ViewController.swift
//  kse
//
//  Created by Dev ILI on 12/08/2021.
//

import UIKit

class ViewController: AppNavigation {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageView: UIPageControl!
    
    var imgArr = [  UIImage(named:"Alexandra Daddario"),
                    UIImage(named:"Angelina Jolie") ,
                    UIImage(named:"Anne Hathaway") ,
                    UIImage(named:"Dakota Johnson") ,
                    UIImage(named:"Emma Stone") ]
    
    var timer = Timer()
    var counter = 0
    
    var centerFlowLayout: SJCenterFlowLayout? {
        if let layout  = collectionView.collectionViewLayout as? SJCenterFlowLayout {
            return layout
        }else {
            return nil
        }
    }
    var scrollToEdgeEnabled: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageView.numberOfPages = imgArr.count
        pageView.currentPage = 0
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
        // Do any additional setup after loading the view, typically from a nib.
        confirmDelegate()
        
        let layout = SJCenterFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 0, height: UIScreen.main.bounds.height / 1 )
        
        collectionView.collectionViewLayout = layout
        scrollToEdgeEnabled =  true
        centerFlowLayout?.animationMode = SJCenterFlowLayoutAnimation.scale(sideItemScale: 0.2, sideItemAlpha: 1.0, sideItemShift: 0)
        centerFlowLayout?.scrollDirection = .horizontal
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func changeImage() {
        if counter < imgArr.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageView.currentPage = counter
            counter += 1
        }
        else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            pageView.currentPage = counter
        }
    }
    
    func confirmDelegate() {
        // Register Custom cell
        collectionView.register(UINib(nibName: ImageCell.identifier, bundle: nil), forCellWithReuseIdentifier: ImageCell.identifier)
        
        collectionView.backgroundColor = .clear
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Cell
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as? ImageCell else {
            return UICollectionViewCell()
        }
        
        // Data Set
        cell.backgroundColor = .clear
        cell.prepareCell(imgArr[indexPath.row] ?? UIImage())
        
        // Return Cell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           collectionView.deselectItem(at: indexPath, animated: true)
           if self.scrollToEdgeEnabled, let cIndexPath = centerFlowLayout?.currentCenteredIndexPath, cIndexPath != indexPath {
               centerFlowLayout?.scrollToPage(atIndex: indexPath.row)
           }
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
