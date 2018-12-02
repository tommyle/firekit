import UIKit

enum ViewSide {
    case Left, Right, Top, Bottom
}

extension UIView {
    func addBorder(toSide side: ViewSide, withColor color: CGColor, andThickness thickness: CGFloat) {
        
        let border = CALayer()
        border.backgroundColor = color
        
        switch side {
        case .Left:
            border.frame = CGRect(x: frame.minX, y: frame.minY, width: thickness, height: frame.height)
            break
        case .Right:
            border.frame = CGRect(x: frame.maxX, y: frame.minY, width: thickness, height: frame.height)
            break
        case .Top:
            border.frame = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: thickness)
            break
        case .Bottom:
            border.frame = CGRect(x: -375, y: frame.maxY - 1, width: frame.width, height: thickness)
            break
        }
        
        layer.addSublayer(border)
    }
}
