
import UIKit

struct ViewFactory {
    static func makeFancyView() -> UIView {
        let fancyView = UIView(frame: .zero)
        /* Complex customization, adding subviews, rendering stuff
         */
        return fancyView
    }
}

final class ViewController: UIViewController {
    /* Defering heavy allocation until we need it
       (not so heavy in this particular case, but lets imagine tons of allocations and very complex view hierarchy)
     */
    lazy var fancyComplexView = ViewFactory.makeFancyView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func presentFancyView() {
        fancyComplexView.frame = view.frame
        view.addSubview(fancyComplexView)
        fancyComplexView.center = view.center
    }
}
