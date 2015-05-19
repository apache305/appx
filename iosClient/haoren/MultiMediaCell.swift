//
//  MultiMediaCell.swift
//  haoren
//
//  Copyright (c) 2015 cooldown. All rights reserved.
//

import Foundation
import UIKit
class MultiMediaCell: UITableViewCell {
    
    //this will be used for question details tableview, maybe extent later.
    
    //there could be tree types of cell, image, voice, text. or maybe video.
    
    //currently , we only support image and text.
    
    //
    

    
    //we will draw things we need dynamicly.
    //could be a image.

    var cellImage : UIImageView
    var cellLabel  : UILabel
    
    //由于这里不是大量使用，所以先用不复用的，因为复用会导致混合。
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {

        cellImage = UIImageView(frame: CGRectZero)
        cellLabel = UILabel (frame: CGRectZero)
        cellLabel.numberOfLines = 0
        cellLabel.lineBreakMode = .ByWordWrapping
        //cellLabel.preferredMaxLayoutWidth=218

        super.init(style: .Default , reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cellImage)
        contentView.addSubview(cellLabel)
        
    }
    
    func configureWithContent(multiMedia : MultiMedia ) {
        //cellLabel = UILabel( frame: CGRectMake(0, 0, viewSize.width, viewSize.height) )

        
        if(multiMedia.isLabel){
            self.cellLabel.frame = CGRectMake(0, 0, 200, 50)  // should be auto layout.
            self.cellLabel.text = multiMedia.text!
            self.cellImage.image = nil//UIImage()
            //self.cellImage.removeFromSuperview()
            //self.cellLabel.sizeToFit()

            //println(self.cellLabel.frame.height)
            
            if (multiMedia.isNeedLargeFontSize){
                self.cellLabel.font = UIFont.systemFontOfSize(24)
            }else{
                self.cellLabel.font = UIFont.systemFontOfSize(18)
            }
            
            //self.cellLabel.preferredMaxLayoutWidth = 285


        }
        if(multiMedia.isImage){
            self.cellImage.image = UIImage(named: multiMedia.imageName!)
            self.cellLabel.text = ""
        }

        
        self.cellImage.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.cellLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        
        //加上狗日的constrain
        if (multiMedia.isLabel){
            //距离cell的左边10
            //println(contentView.frame)
            
            contentView.addConstraint(NSLayoutConstraint(item:  self.cellLabel, attribute: .Left, relatedBy: .Equal, toItem: contentView, attribute: .Left, multiplier: 1, constant: 25))
            //距离cell的右边10
            contentView.addConstraint(NSLayoutConstraint(item:  self.cellLabel, attribute: .Trailing , relatedBy: .Equal, toItem: contentView, attribute: .Trailing, multiplier: 1, constant: -15))
            //距离cell的上顶5
            contentView.addConstraint(NSLayoutConstraint(item:  self.cellLabel, attribute: .Top, relatedBy: .Equal, toItem: contentView, attribute: .Top, multiplier: 1, constant: 5))
            
            contentView.addConstraint(NSLayoutConstraint(item:  self.cellLabel, attribute: .Bottom, relatedBy: .Equal, toItem: contentView, attribute: .Bottom, multiplier: 1, constant: -5))
            //self.cellLabel.addConstraint(NSLayoutConstraint(item: self.cellLabel, attribute: .Width , relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier:1, constant: 200   ))
            
            
        }
        
        if (multiMedia.isImage){
            //self.cellImage.center = contentView.center
            //距离cell的左边10
            //contentView.addConstraint(NSLayoutConstraint(item: self.cellImage, attribute: .Left, relatedBy: .Equal, toItem: contentView, attribute: .Left, multiplier: 1, constant: 30))
            //距离cell的上顶4.5
            contentView.addConstraint(NSLayoutConstraint(item: self.cellImage, attribute: .Top, relatedBy: .Equal, toItem: contentView, attribute: .Top, multiplier: 1, constant: 5))
            //contentView.addConstraint(NSLayoutConstraint(item: self.cellImage, attribute: .Bottom, relatedBy: .Equal, toItem: contentView, attribute: .Bottom, multiplier: 1, constant: -5))
            
            self.cellImage.addConstraint(NSLayoutConstraint(item: self.cellImage, attribute: .Height , relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier:1, constant: 180   ))
            self.cellImage.addConstraint(NSLayoutConstraint(item: self.cellImage, attribute: .Width , relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier:1, constant: 180   ))
            
            
            contentView.addConstraint(NSLayoutConstraint(item: self.cellImage, attribute: .CenterX, relatedBy: .Equal, toItem: contentView, attribute: .CenterX, multiplier: 1, constant: 0))
            contentView.addConstraint(NSLayoutConstraint(item: self.cellImage, attribute: .CenterY, relatedBy: .Equal, toItem: contentView, attribute: .CenterY, multiplier: 1, constant: 0))
        }
        
        
        
        

    }

    //why this function???
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
}
