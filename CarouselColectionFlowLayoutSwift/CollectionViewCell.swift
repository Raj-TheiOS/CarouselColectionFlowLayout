//
//  CollectionViewCell.swift
//  CarouselColectionFlowLayoutSwift
//
//  Created by Raj on 12/06/17.
//  Copyright © 2017 Raj. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.mainView.layer.cornerRadius = 13.0
        self.mainView.layer.shadowColor = UIColor.lightGray.cgColor
        self.mainView.layer.shadowOpacity = 0.5
        self.mainView.layer.shadowOpacity = 10.0
        self.mainView.layer.shadowOffset = .zero
        self.mainView.layer.shadowPath = UIBezierPath(rect: self.mainView.bounds).cgPath
        self.mainView.layer.shouldRasterize = true
    }

}
