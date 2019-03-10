//
//  MediaCollectionTile.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/10/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class MediaCollectionTile: UICollectionViewCell {
    var imageHolder: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let textLabel = UILabel(frame: .zero)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            textLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            textLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            ])
        //self.image = UIImage(named: "omaha1")
        imageHolder = UIImageView(frame: CGRect(x: self.contentView.frame.minX, y: self.contentView.frame.minY, width: self.contentView.frame.width, height: self.contentView.frame.height))
        imageHolder.image = UIImage(named: "omaha1")
        self.contentView.addSubview(imageHolder)
        
        self.contentView.backgroundColor = .lightGray
       // self.textLabel.textAlignment = .center
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        fatalError("Interface Builder is not supported!")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        fatalError("Interface Builder is not supported!")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        //self.textLabel.text = nil
    }
}
