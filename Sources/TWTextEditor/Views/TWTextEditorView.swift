//
//  TWTextEditorView.swift
//  
//
//  Created by Yousef Elsayed on 01/10/2022.
//

import UIKit

public class TWTextEditorView: UIView {
    
    
    @IBOutlet var view: UIView!
    @IBOutlet weak public var textView: UITextView!
    
    
    var maximumNumberOfLines: Int = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    var twTextColor: UIColor?
    var twTextFont: UIFont?
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        UINib(nibName: String(describing: TWTextEditorView.self), bundle: Bundle.module).instantiate(withOwner: self, options: nil)
        self.attach(view: self.view, toContainer: self)
    }
    
    fileprivate func attach(view: UIView, toContainer container: UIView) {
        container.addSubview(view)
        self.view.fillSuperview()
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        self.setupTextEditor()
    }
    
    
    
    func setupTextEditor() {
        self.textView.textColor = self.twTextColor
        self.twTextFont = UIFont.systemFont(ofSize: 15)
        self.view.layer.borderWidth = 2.0
        self.view.layer.borderColor = UIColor.black.cgColor
    }
}
