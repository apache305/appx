//
//  MessageCell.swift
//  haoren
//
//  Copyright (c) 2015 cooldown. All rights reserved.
//

import Foundation
import UIKit

let incomingTag = 0, outgoingTag = 1
let bubbleTag = 8
let messageFontSize: CGFloat = 17


class MessageCell : UITableViewCell{
    
    //自定一个cell有这么痛苦么。。。。
    
    //这个imageview是气泡的背景
    let bubbleImageView : UIImageView
    //这个标签是气泡里面的文字
    let messageLabel: UILabel
    
    //初始化 cell初始化
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        //设置一下 bubble的背景图片是哪个图片
        //下面俩public的函数用来生成bubble的背景。。。
        bubbleImageView  = UIImageView(image: bubbleImage.incoming,
            highlightedImage: bubbleImage.incomingHighlighed)
        //这个标签。。。。
        bubbleImageView.tag = bubbleTag
        bubbleImageView.userInteractionEnabled = true // used for copy
        messageLabel = UILabel(frame: CGRectZero)
        messageLabel.font = UIFont.systemFontOfSize(messageFontSize)
        messageLabel.numberOfLines=0 //允许换行。
        messageLabel.userInteractionEnabled = false
        
        super.init(style: .Default, reuseIdentifier: reuseIdentifier)
        selectionStyle = .None
        //这个 contentView 就是cell自己
        //把背景图片跟文字都load进去吧。
        contentView.addSubview(bubbleImageView)
        bubbleImageView.addSubview(messageLabel)
        
        
        
        // about these constrains.......
        bubbleImageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        messageLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        //距离cell的左边10
        contentView.addConstraint(NSLayoutConstraint(item: bubbleImageView, attribute: .Left, relatedBy: .Equal, toItem: contentView, attribute: .Left, multiplier: 1, constant: 10))
        //距离cell的上顶4.5
        contentView.addConstraint(NSLayoutConstraint(item: bubbleImageView, attribute: .Top, relatedBy: .Equal, toItem: contentView, attribute: .Top, multiplier: 1, constant: 4.5))
        //文字标签距离
        bubbleImageView.addConstraint(NSLayoutConstraint(item: bubbleImageView, attribute: .Width, relatedBy: .Equal, toItem: messageLabel, attribute: .Width, multiplier: 1, constant: 30))
        contentView.addConstraint(NSLayoutConstraint(item: bubbleImageView, attribute: .Bottom, relatedBy: .Equal, toItem: contentView, attribute: .Bottom, multiplier: 1, constant: -4.5))
        
        bubbleImageView.addConstraint(NSLayoutConstraint(item: messageLabel, attribute: .CenterX, relatedBy: .Equal, toItem: bubbleImageView, attribute: .CenterX, multiplier: 1, constant: 3))
        bubbleImageView.addConstraint(NSLayoutConstraint(item: messageLabel, attribute: .CenterY, relatedBy: .Equal, toItem: bubbleImageView, attribute: .CenterY, multiplier: 1, constant: -0.5))
        messageLabel.preferredMaxLayoutWidth = 218
        bubbleImageView.addConstraint(NSLayoutConstraint(item: messageLabel, attribute: .Height, relatedBy: .Equal, toItem: bubbleImageView, attribute: .Height, multiplier: 1, constant: -15))

    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //cell的label设置成消息文本的样子。
    func configureWithMessage(message: Message) {
        messageLabel.text = message.messageBody

        var layoutAttribute: NSLayoutAttribute
        var layoutConstant: CGFloat
        
        //进来的不是我的消息
        if !message.messageIsMe {
            bubbleImageView.image = bubbleImage.incoming
            bubbleImageView.highlightedImage = bubbleImage.incomingHighlighed
            messageLabel.textColor = UIColor.blackColor()
            layoutAttribute = .Left
            layoutConstant = 10
        } else { //是我的消息
            bubbleImageView.image = bubbleImage.outgoing
            bubbleImageView.highlightedImage = bubbleImage.outgoingHighlighed
            messageLabel.textColor = UIColor.whiteColor()
            layoutAttribute = .Right
            layoutConstant = -10
        }
        
        let layoutConstraint: NSLayoutConstraint = bubbleImageView.constraints()[1] as! NSLayoutConstraint //
        layoutConstraint.constant = -layoutConstraint.constant
        
        let constraints: NSArray = contentView.constraints()
        let indexOfConstraint = constraints.indexOfObjectPassingTest { (var constraint, idx, stop) in
            return (constraint.firstItem as! UIView).tag == bubbleTag && (constraint.firstAttribute == NSLayoutAttribute.Left || constraint.firstAttribute == NSLayoutAttribute.Right)
        }
        contentView.removeConstraint(constraints[indexOfConstraint] as! NSLayoutConstraint)
        contentView.addConstraint(NSLayoutConstraint(item: bubbleImageView, attribute: layoutAttribute, relatedBy: .Equal, toItem: contentView, attribute: layoutAttribute, multiplier: 1, constant: layoutConstant))
    }
    
    
    // Highlight cell #CopyMessage
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        bubbleImageView.highlighted = selected
    }
    
    
}

//to create a bubble image, which will be used as the background of the picture.
//返回了一个字典吧 包含输入输出背景的，区别应该就是那个一小撇。
let bubbleImage = bubbleImageMake()
func bubbleImageMake() -> (incoming: UIImage, incomingHighlighed: UIImage, outgoing: UIImage, outgoingHighlighed: UIImage) {
    //这个messagebubble 就是 背景。
    let maskOutgoing = UIImage(named: "MessageBB")!
    //把这个反向了，因为聊天气泡带个小尾巴
    let maskIncoming = UIImage(CGImage: maskOutgoing.CGImage, scale: 2, orientation: .UpMirrored)!
    // 设置左边26.5以左 右边21以右不拉升。。可是这个图片的size是多少。。就敢这么拉
    let capInsetsIncoming = UIEdgeInsets(top: 17, left: 26.5, bottom: 17.5, right: 21)
    let capInsetsOutgoing = UIEdgeInsets(top: 17, left: 21, bottom: 17.5, right: 26.5)
    
    //给丫设置成绿色吧。。。
    let incoming = coloredImage(maskIncoming, 229/255.0, 229/255.0, 234/255.0, 1).resizableImageWithCapInsets(capInsetsIncoming)
    let incomingHighlighted = coloredImage(maskIncoming, 206/255.0, 206/255.0, 210/255.0, 1).resizableImageWithCapInsets(capInsetsIncoming)
    let outgoing = coloredImage(maskOutgoing, 43/255.0, 119/255.0, 250/255.0, 1).resizableImageWithCapInsets(capInsetsOutgoing)
    let outgoingHighlighted = coloredImage(maskOutgoing, 32/255.0, 96/255.0, 200/255.0, 1).resizableImageWithCapInsets(capInsetsOutgoing)
    
    return (incoming, incomingHighlighted, outgoing, outgoingHighlighted)
}

func coloredImage(image: UIImage, red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIImage! {
    // 把一个 uiimage 给染成想染的颜色。。这个方法应该拿去util里面。回头再弄吧。
    //至于这么费劲么？？？擦泪啊
    let rect = CGRect(origin: CGPointZero, size: image.size)
    UIGraphicsBeginImageContextWithOptions(image.size, false, image.scale)
    let context = UIGraphicsGetCurrentContext()
    image.drawInRect(rect)
    CGContextSetRGBFillColor(context, red, green, blue, alpha)
    CGContextSetBlendMode(context, kCGBlendModeSourceAtop)
    CGContextFillRect(context, rect)
    let result = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return result
}


