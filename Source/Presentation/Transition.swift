import UIKit

class Transition: NSObject, UIViewControllerTransitioningDelegate {

    private let alertStyle: AlertControllerStyle
    let backgroundAlpha: CGFloat

    init(alertStyle: AlertControllerStyle, backgroundAlpha: CGFloat) {
        self.alertStyle = alertStyle
        self.backgroundAlpha = backgroundAlpha
    }

    func presentationController(forPresented presented: UIViewController,
        presenting: UIViewController?, source: UIViewController)
        -> UIPresentationController?
    {
        return PresentationController(presentedViewController: presented, presenting: presenting, backgroundAlpha: self.backgroundAlpha)
    }

    func animationController(forPresented presented: UIViewController,
        presenting: UIViewController, source: UIViewController)
        -> UIViewControllerAnimatedTransitioning?
    {
        if self.alertStyle == .actionSheet {
            return nil
        }

        return AnimationController(presentation: true)
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self.alertStyle == .alert ? AnimationController(presentation: false) : nil
    }
}
