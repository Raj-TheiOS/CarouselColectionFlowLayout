//
//  ViewController.swift
//  CarouselColectionFlowLayoutSwift
//
//  Created by Raj on 12/06/17.
//  Copyright © 2017 Raj. All rights reserved.
//

import UIKit

struct ModelCollectionFlowLayout {
    var title:String = ""
    var image:UIImage!
}

class ViewController: UIViewController {
    var arrData = [ModelCollectionFlowLayout]()
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectData()
        collectionView.register(UINib.init(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        let flowLayout = UPCarouselFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width - 60.0, height:collectionView.frame.size.height)
        flowLayout.scrollDirection = .horizontal
        flowLayout.sideItemScale = 0.8
        flowLayout.sideItemAlpha = 1.0
        flowLayout.spacingMode = .fixed(spacing: 5.0)
        collectionView.collectionViewLayout = flowLayout
    }
    func collectData(){
        arrData = [
            ModelCollectionFlowLayout(title: "Astodiya Darwaza", image: #imageLiteral(resourceName: "astodiyaDarwaza")),
            ModelCollectionFlowLayout(title: "Dariyapur Darwaza", image: #imageLiteral(resourceName: "dariyapurDarwaza")),
            ModelCollectionFlowLayout(title: "Delhi Darwaza", image: #imageLiteral(resourceName: "delhiDarwaza")),
            ModelCollectionFlowLayout(title: "Jamalpur Darwaza", image: #imageLiteral(resourceName: "jamalpurDarwaza")),
            ModelCollectionFlowLayout(title: "Prem Darwaza", image: #imageLiteral(resourceName: "premDarwaza")),
            ModelCollectionFlowLayout(title: "Raipur Darwaza", image: #imageLiteral(resourceName: "raipurDarwaza")),
            ModelCollectionFlowLayout(title: "Teen Darwaza", image: #imageLiteral(resourceName: "teenDarwaza")),
        ]
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let layout = self.collectionView.collectionViewLayout as! UPCarouselFlowLayout
        let pageSide = (layout.scrollDirection == .horizontal) ? self.pageSize.width : self.pageSize.height
        let offset = (layout.scrollDirection == .horizontal) ? scrollView.contentOffset.x : scrollView.contentOffset.y
        currentPage = Int(floor((offset - pageSide / 2) / pageSide) + 1)
    }
    fileprivate var currentPage: Int = 0 {
        didSet {
            print("page at centre = \(currentPage)")
        }
    }
    
    fileprivate var pageSize: CGSize {
        let layout = self.collectionView.collectionViewLayout as! UPCarouselFlowLayout
        var pageSize = layout.itemSize
        if layout.scrollDirection == .horizontal {
            pageSize.width += layout.minimumLineSpacing
        } else {
            pageSize.height += layout.minimumLineSpacing
        }
        return pageSize
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.img.image = arrData[indexPath.row].image
        cell.lbl.text = arrData[indexPath.row].title
        return cell
    }
}
