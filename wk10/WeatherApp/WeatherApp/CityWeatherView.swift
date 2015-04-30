//
//  CityWeatherView.swift
//  WeatherApp
//
//  Created by Thomas Sesselmann on 30/04/2015.
//  Copyright (c) 2015 Thomas Sesselmann. All rights reserved.
//

import UIKit

@IBDesignable
class CityWeatherView: UIView {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    
    @IBInspectable var image: UIImage? {
        get {
            return self.weatherImage?.image
        }
        set {
            self.weatherImage?.image = newValue
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        loadNib()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadNib()
        
    }
    
    func loadNib() {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "CityWeatherView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        view.frame = self.bounds
        view.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        
        addSubview(view)
    }
    
    override func drawRect(rect: CGRect) {
        let path = UIBezierPath(ovalInRect: CGRectMake(20, 20, 150, 150))
        path.lineWidth = 4
        UIColor.redColor().setStroke()
        path.closePath()
        path.stroke()
        
        UIColor.blueColor().setFill()
        path.fill()
    }
    
}
