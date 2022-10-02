//
//  TWTextEditorView.swift
//  
//
//  Created by Yousef Elsayed on 01/10/2022.
//

import UIKit

public protocol TWTextEditorViewDelegate: AnyObject {
    func textDidChange(_ textView: UITextView)
}

public class TWTextEditorView: UIView {
    
    
    @IBOutlet var view: UIView!
    @IBOutlet public weak var textView: UITextView!
    
    public var placeholderLabel : UILabel!
    
    
    public  var twTextColor: UIColor?
    var twTextFont: UIFont?
    weak public  var viewDelegate: TWTextEditorViewDelegate?
    
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
        self.setupPlaceHodler()
        self.textView.delegate = self
    }
    
    //MARK:- Setup text view UI
  private func setupTextEditor() {
        self.textView.textColor = self.twTextColor
        self.textView.font = .twFontReqularWithSize(size: 14)
        self.view.layer.borderWidth = 1.0
        self.view.layer.cornerRadius = 12
        self.view.layer.borderColor = UIColor.twBorderColor.cgColor
        self.textView.keyboardType = .twitter
        self.view.layer.applyFigmaShadow()
    }
    
    //MARK:- Setup text view placeholder
    private func setupPlaceHodler() {
        self.placeholderLabel = UILabel()
        self.placeholderLabel.text = "Start typing! You can enter up to 280 characters"
        self.placeholderLabel.font = .twFontReqularWithSize(size: 14)
        self.placeholderLabel.sizeToFit()
        self.textView.addSubview(placeholderLabel)
        self.placeholderLabel.frame.origin = CGPoint(x: 8, y: (textView.font?.pointSize)! / 2)
        self.placeholderLabel.textColor = UIColor.twPlaceHolderColor
        self.placeholderLabel.alpha = (textView.text.isEmpty) ? 1 : 0
    }
}

extension TWTextEditorView: UITextViewDelegate {
    public func textViewDidChange(_ textView: UITextView) {
        DispatchQueue.main.async {
            self.placeholderLabel.alpha = (textView.text.isEmpty) ? 1 : 0
            self.viewDelegate?.textDidChange(textView)
        }

    }
}
