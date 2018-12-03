//
//  ComposerView.swift
//  firekit
//
//  Created by Tommy Le on 2018-12-01.
//  Copyright © 2018 Tommy Le. All rights reserved.
//

import UIKit

protocol ComposerViewDelegate: class {
    func sendButtonPressed(_ sender: String)
    func didBeginEditing(_ sender: UITextField)
}

@IBDesignable
class ComposerView: UIView, UITextFieldDelegate {
    
    weak var delegate: ComposerViewDelegate?

    @IBOutlet var view: UIView!
    @IBOutlet weak var textField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.view = setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.view = setup()
    }
    
    func setup() -> UIView! {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(view)
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 20))
        textField.leftViewMode = .always
        textField.delegate = self
        
        return view
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        guard let message = textField.text else {
            return
        }
        
        if (message == "") {
            return
        }
        
        self.textField.text = ""
        
        self.sendButtonPressed(message)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.didBeginEditing(textField)
    }
}

extension ComposerView: ComposerViewDelegate {
    
    func sendButtonPressed(_ sender: String) {
        delegate?.sendButtonPressed(sender)
    }
    
    func didBeginEditing(_ sender: UITextField) {
        delegate?.didBeginEditing(sender)
    }
    
}
