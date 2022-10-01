//
//  TWTextEditorView.swift
//  
//
//  Created by Yousef Elsayed on 01/10/2022.
//

import UIKit

class TWTextEditorView: UIView {
    
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var textView: UITextView!
    
    
    var maximumNumberOfLines: Int = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    var twTextColor: UIColor?
    var twTextFont: UIFont?
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        UINib(nibName: String(describing: TWTextEditorView.self), bundle: nil).instantiate(withOwner: self, options: nil)
        self.attach(view: self.view, toContainer: self)
    }
    
    fileprivate func attach(view: UIView, toContainer container: UIView) {
        container.addSubview(view)
        self.view.fillSuperview()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupTextEditor()
    }
    
    
    
    func setupTextEditor() {
        self.textView.textColor = twTextColor
        self.twTextFont = UIFont.twFontReqularWithSize(size: 14)
        self.view.layer.borderWidth = 2.0
        self.view.layer.borderColor = UIColor.black.cgColor
    }
}
