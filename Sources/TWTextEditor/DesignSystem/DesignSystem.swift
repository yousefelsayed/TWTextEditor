//
//  File.swift
//  
//
//  Created by Yousef Elsayed on 01/10/2022.
//

import UIKit


class UpperCornersView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.roundCorners(corners: [.topRight, .topLeft], radius: 12)
    }
}

class TitleLabelWithTithSize14: UILabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.font = .twFontMediumWithSize(size: 14)
        self.textColor = .black
    }
}

public class TWPrimaryButton: UIButton {
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = .twFontBoldWithSize(size: 14)
    }
}

public class CounterLabel: UILabel {
    public override func awakeFromNib() {
        super.awakeFromNib()
        self.font = .twFontMediumWithSize(size: 26)
        self.textColor = .black
    }
}
