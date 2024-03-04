
import UIKit

extension UIView {
    func addShadow(color: UIColor, opacity: Float, radius: CGFloat, offset: CGSize) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity // 0.5
        layer.shadowRadius = radius // 5
        layer.shadowOffset = offset // 0, 5
        layer.masksToBounds = false
    }
}
