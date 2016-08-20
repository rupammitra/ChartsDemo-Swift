//
//  Marker.swift
//  ChartsDemo-Swift
//
//  Created by Rupam Mitra on 01/08/16.
//  Copyright © 2016 Rupam Mitra. All rights reserved.
//

import UIKit

class Marker: ChartMarker {
    
    internal var color: UIColor!;
    internal var arrowSize = CGSize(width: 15, height: 11);
    internal var font: UIFont!;
    internal var insets = UIEdgeInsets();
    internal var minimumSize = CGSize();
    
    private var labelns: NSString!;
    private var _labelSize: CGSize = CGSize();
    private var _size: CGSize = CGSize();
    private var _paragraphStyle: NSMutableParagraphStyle!;
    
    internal init(color: UIColor, font: UIFont, insets: UIEdgeInsets)
    {
        super.init();
        
        self.color = color;
        self.font = font;
        self.insets = insets;
        
        _paragraphStyle = NSParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle;
        _paragraphStyle.alignment = .Left;
    }
    
    internal override var size: CGSize { return _size; }
    
    internal override func draw(context context: CGContext, point: CGPoint)
    {
        if (labelns === nil)
        {
            return;
        }
        
        var rect = CGRect(origin: point, size: _size);
        rect.origin.x -= _size.width / 2.0;
        rect.origin.y -= _size.height;
        
        CGContextSaveGState(context);
        
        CGContextSetFillColorWithColor(context, color.CGColor);
        CGContextBeginPath(context);
        CGContextMoveToPoint(context,
                             rect.origin.x,
                             rect.origin.y);
        CGContextAddLineToPoint(context,
                                rect.origin.x + rect.size.width,
                                rect.origin.y);
        CGContextAddLineToPoint(context,
                                rect.origin.x + rect.size.width,
                                rect.origin.y + rect.size.height - arrowSize.height);
        CGContextAddLineToPoint(context,
                                rect.origin.x + (rect.size.width + arrowSize.width) / 2.0,
                                rect.origin.y + rect.size.height - arrowSize.height);
        CGContextAddLineToPoint(context,
                                rect.origin.x + rect.size.width / 2.0,
                                rect.origin.y + rect.size.height);
        CGContextAddLineToPoint(context,
                                rect.origin.x + (rect.size.width - arrowSize.width) / 2.0,
                                rect.origin.y + rect.size.height - arrowSize.height);
        CGContextAddLineToPoint(context,
                                rect.origin.x,
                                rect.origin.y + rect.size.height - arrowSize.height);
        CGContextAddLineToPoint(context,
                                rect.origin.x,
                                rect.origin.y);
        CGContextFillPath(context);
        
        rect.origin.y += self.insets.top;
        rect.size.height -= self.insets.top + self.insets.bottom;
        
        UIGraphicsPushContext(context);
        
        labelns.drawInRect(rect, withAttributes: [NSFontAttributeName: self.font, NSParagraphStyleAttributeName: _paragraphStyle, NSForegroundColorAttributeName: UIColor.whiteColor()]);
        
        UIGraphicsPopContext();
        
        CGContextRestoreGState(context);
    }
    
    internal override func refreshContent(entry entry: ChartDataEntry, highlight: ChartHighlight)
    {
        labelns = entry.data as! NSString;
        
        _labelSize = labelns.sizeWithAttributes([NSFontAttributeName: self.font]);
        _size.width = _labelSize.width + self.insets.left + self.insets.right;
        _size.height = _labelSize.height + self.insets.top + self.insets.bottom;
        _size.width = max(minimumSize.width, _size.width);
        _size.height = max(minimumSize.height, _size.height);
    }
}
