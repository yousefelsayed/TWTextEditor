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
    
    public var typedCharachtersCount: Int! { return TWTextEditorView.lengthOf(tweet: self.text) }
    
    public var remainingCharachtersCount: Int! { return (self.maxCountOfCharchters - typedCharachtersCount) }
    
    public var maxCountOfCharchters: Int = 280
    
    private var text: String { return self.textView.text }
    
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
        self.textView.textColor = .black
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
    
    //MARK:- Dimiss keyboard when user click outside the textview 
    public func dimissKeyboard() {
        self.textView.resignFirstResponder()
    }
    
    //MARK:- Clear all the current text
   public func clearText() {
        self.textView.text = ""
        self.textViewDidChange(self.textView)
    }
    
    //MARK:- Copy the current text to clipboard
    public func copyCurrentText() {
        UIPasteboard.general.string = self.text
    }
    
    //MARK:- Calculate length of given tweet
    static public func lengthOf(tweet: String) -> Int {
        
        let (cleanText, urlLength) = cleanAndCountURLs(text: tweet)
        
        var weightedLength = urlLength
        
        for char in cleanText {
            if char.isEmoji == true {
                weightedLength += 2 //2 is the count of characters for any emoji according to twitter docs
                continue
            } else {
                weightedLength += 1
            }
        }
        
        return weightedLength
    }
    
    static public  func cleanAndCountURLs(text: String) -> (String, Int) {
        var output = text
        var lenght = 0
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        let matches = detector.matches(in: text, options: [], range: NSRange(location: 0, length: text.utf16.count))
        
        matches.forEach {
            output = (text as NSString).replacingCharacters(in: $0.range, with: "")
            lenght += 23 //23 is the count of characters for any url according to twitter docs
        }
        return (output, lenght)
    }
    
    
}

extension TWTextEditorView: UITextViewDelegate {
    
    public func textViewDidChange(_ textView: UITextView) {
        DispatchQueue.main.async { [weak self] in
            
            self?.placeholderLabel.alpha = (textView.text.isEmpty) ? 1 : 0
            
            self?.viewDelegate?.textDidChange(textView)
        }
    }
    
    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // get the current text, or use an empty string if that failed
          let currentText = textView.text ?? ""

          // attempt to read the range they are trying to change, or exit if we can't
          guard let stringRange = Range(range, in: currentText) else { return false }

          // add their new text to the existing text
          let updatedText = currentText.replacingCharacters(in: stringRange, with: text)

        // make sure the result is under 280 characters
           return updatedText.count <= maxCountOfCharchters
        
    
    }
}
