import UIKit

enum ViewSide {
    case left, right, top, bottom
}

extension UIView {
    func addBorder(toSide side: ViewSide, withColor color: CGColor, andThickness thickness: CGFloat) {

        let border = CALayer()
        border.backgroundColor = color

        switch side {
        case .left:
            border.frame = CGRect(x: frame.minX, y: frame.minY, width: thickness, height: frame.height)
            break
        case .right:
            border.frame = CGRect(x: frame.maxX, y: frame.minY, width: thickness, height: frame.height)
            break
        case .top:
            border.frame = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: thickness)
            break
        case .bottom:
            border.frame = CGRect(x: -375, y: frame.maxY - 1, width: frame.width, height: thickness)
            break
        }

        layer.addSublayer(border)
    }
}
