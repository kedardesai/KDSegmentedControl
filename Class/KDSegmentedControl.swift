//
//  KDSegmentedControl.swift
//  KDSegmentedControl
//
//  Created by Kedar Desai on 06/06/20.
//  Copyright © 2020 Nine Dots Technologies. All rights reserved.
//

import UIKit

@IBDesignable class KDSegmentedControl: UIControl {
    
    
    /// IBInspectable variables
    
    @IBInspectable open var defaultTextFont: UIFont = UIFont.systemFont(ofSize: 12.0)
    @IBInspectable open var selectedTextFont: UIFont = UIFont.systemFont(ofSize: 12.0)
    @IBInspectable open var defaultTextColor: UIColor = UIColor.black
    @IBInspectable open var selectedTextColor: UIColor = UIColor.white
    
    @IBInspectable open var thumbColor: UIColor = UIColor.clear
    @IBInspectable open var thumbShadowColor: UIColor = UIColor(red: 155.0/255.0, green: 155.0/255.0, blue: 155.0/255.0, alpha: 1.0)
    @IBInspectable open var dropShadow:Bool = true
    
    @IBInspectable open var cornerRadius: CGFloat = 0 // for rounded corner radius use negative value, 0 to disable
    @IBInspectable open var borderColor: UIColor = UIColor.white
    @IBInspectable open var borderWidth: CGFloat = 0.0
    
    @IBInspectable open var padding: CGFloat = 5.0
    
    
    /// Private variables that can not be used by developers.
    
    fileprivate var thumbView: UIView = UIView()
    fileprivate var itemLabels: [UILabel] = []
    
    
    /// Open variables that can be called by developers from outside the class.
    
    open var items: [String] = ["Item 1", "Item 1", "Item 1"] {
        didSet {
            setupLabels()
        }
    }
    
    open var selectedIndex: Int = 0 {
        didSet {
             displayNewSelectedIndex()
        }
    }
    
    
    /// Init Methods -
    
    open override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 1. Set up view
        setupView()
        
        // 2. Calculate width
        let newWidth: CGFloat = frame.width / CGFloat(itemLabels.count)
        
        // 3. Set label's frame
        for index in 0...itemLabels.count-1 {
            let label = itemLabels[index]
            
            let xPos = CGFloat(index) * newWidth
            label.frame = CGRect(x: xPos, y: 0.0, width: newWidth, height: frame.height)
        }
        
        // 4. Set thumbView's frame
        thumbView.frame = CGRect(x: 0, y: 0, width: newWidth, height: frame.height)
        
    }
    
    
    /// Private Methods
    
    fileprivate func setupView() {
        
        layer.cornerRadius = cornerRadius < 0 ? 0.5 * thumbView.frame.size.height : cornerRadius
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        
        setupLabels()
        setupThumbView()
    }
    
    fileprivate func setupLabels() {
        // 1. removing all the previous labels
        for label in itemLabels {
            label.removeFromSuperview()
        }
        itemLabels.removeAll()
        
        // 2. adding new labels
        for index in 0...items.count-1 {
            let label: UILabel = UILabel(frame: CGRect.zero)
            label.textColor = defaultTextColor
            label.font = defaultTextFont
            label.textAlignment = .center
            label.text = items[index]
            addSubview(label)
            
            itemLabels.append(label)
        }
    }
    
    fileprivate func setupThumbView() {
        
        
        thumbView.backgroundColor = thumbColor
        
        if dropShadow == true {
            thumbView.layer.shadowOffset = CGSize(width: 0.0, height: 1.0);
            thumbView.layer.shadowOpacity = 0.6;
            thumbView.layer.shadowRadius = 3.0
            thumbView.layer.shadowColor = thumbShadowColor.cgColor
            thumbView.layer.masksToBounds = false
        } else {
            thumbView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0);
            thumbView.layer.shadowOpacity = 0.0;
            thumbView.layer.shadowRadius = 0.0
            thumbView.layer.shadowColor = UIColor.clear.cgColor
            thumbView.layer.masksToBounds = true
        }
        
        if selectedIndex >= 0 {
            insertSubview(thumbView, at: 0)
        }
    }
    
    fileprivate func displayNewSelectedIndex() {
        
        // 1. Change all text label's appearance to default
        for label in itemLabels {
            label.textColor = defaultTextColor
            label.font = defaultTextFont
        }
        
        if selectedIndex >= 0 { // If an item is selected, i.e., selectedIndex != -1
            // 2. Change selected text label's appearance
            let label = itemLabels[selectedIndex]
            label.textColor = selectedTextColor
            label.font = selectedTextFont
            
            // 3. Change thumbView's frame
            thumbView.frame = label.frame
            
            // 4. Add thumbView if it is not added already
            if !thumbView.isDescendant(of: self) {
                insertSubview(thumbView, at: 0)
            }
            
        } else { // If no item is selected
            // 2. Remove thumbview
            thumbView.removeFromSuperview()
        }
    }
    
    
    /// Touch Event Methods -
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: self)
        
        var calculatedIndex : Int = -1
        for(index, item) in itemLabels.enumerated() {
            if item.frame.contains(location) {
                calculatedIndex = index
            }
        }
        
        if calculatedIndex != -1 {
            selectedIndex = calculatedIndex
            sendActions(for: .valueChanged)
        }
        
        return false
    }
    
}
