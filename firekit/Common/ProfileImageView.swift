//
//  ProfileImageView.swift
//  firekit
//
//  Created by Tommy Le on 2018-12-02.
//  Copyright © 2018 Tommy Le. All rights reserved.
//

import UIKit

@IBDesignable
class ProfileImageView: UIView {

    @IBOutlet var view: UIView!
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightConstraint: NSLayoutConstraint!

    @IBInspectable var borderWidth: CGFloat = 4 {
        didSet {
            topConstraint.constant = borderWidth
            leftConstraint.constant = borderWidth
            bottomConstraint.constant = borderWidth
            rightConstraint.constant = borderWidth
        }
    }

    @IBInspectable var image: UIImage = UIImage() {
        didSet {
            imageView.image = image
        }
    }

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

        view.layer.cornerRadius = view.frame.width / 2.0
        view.layer.borderWidth = 0.4
        view.layer.borderColor = UIColor.gray.cgColor

        imageView.layer.cornerRadius = (view.frame.width - borderWidth) / 2.0

        return view
    }

}
