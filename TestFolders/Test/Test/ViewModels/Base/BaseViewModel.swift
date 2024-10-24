

import Foundation
import UIKit
import SwiftUI


class BaseViewModel:ObservableObject{
    func backToRootViewController(rootView: AnyView? = AnyView(LoginView())){

        let root = rootView
        let newHostingController = UIHostingController(rootView: root)
        BaseViewModel.makeSpecificViewRoot(vc: newHostingController)
     
    }
    static func makeSpecificViewRoot(vc: UIViewController) {
        DispatchQueue.main.async {
            guard let keyWindow = UIApplication.shared.windows.first(where: \.isKeyWindow), let snapshot = keyWindow.snapshotView(afterScreenUpdates: true) else {
                print("🔥 No snapshot found")
                return
            }
            let screenWidth = UIScreen.main.bounds.width
            snapshot.frame = keyWindow.bounds
            keyWindow.addSubview(snapshot)
            keyWindow.rootViewController = vc
            vc.view.frame = CGRect(x: screenWidth, y: 0, width: screenWidth, height: vc.view.frame.height)
            UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseInOut, animations: {
                snapshot.frame = CGRect(x: -screenWidth, y: 0, width: screenWidth, height: snapshot.frame.height)
                vc.view.frame = keyWindow.bounds
            }, completion: { finished in
                snapshot.removeFromSuperview()
            })
        }
    }
}
