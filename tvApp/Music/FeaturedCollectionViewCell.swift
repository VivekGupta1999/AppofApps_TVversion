//
//  FeaturedCollectionViewCell.swift
//  w11TvApp
//
//  Created by Vandan  on 11/18/19.
//  Copyright © 2019 Vandan Inc. All rights reserved.
//

import UIKit

class FeaturedCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var featuredImage : UIImageView!
    @IBOutlet var lbSong : UILabel!
    @IBOutlet var lbArtist : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layoutIfNeeded()
        self.layoutSubviews()
        self.setNeedsDisplay()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if self.isFocused
        {
            self.featuredImage.adjustsImageWhenAncestorFocused = true
            
        }
        else{
            self.featuredImage.adjustsImageWhenAncestorFocused = false
        }
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
