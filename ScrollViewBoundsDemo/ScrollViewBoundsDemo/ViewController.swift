
import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .black.withAlphaComponent(0.2)
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        scrollView.bounces = true
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        scrollView.delegate = self
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("😄" + "bounds.orgin:\(scrollView.bounds.origin)")
        print("😄" + "bounds.contentOffset:\(scrollView.contentOffset)")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        scrollView.contentSize = CGSize(width: view.bounds.size.width, height: view.bounds.size.height * 5)
    }
}

