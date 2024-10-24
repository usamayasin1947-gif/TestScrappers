

import UIKit
import Toast
import SwiftUI

class MyAlerts {
    static let shared = MyAlerts()
    
    private init(){}
    

    
    func showToast<T>(_ message: T, duration: TimeInterval = 2.5,color: UIColor = .systemGreen)  {
        if let message = message as? String {
            var style = ToastStyle()
            style.imageSize = CGSize(width: 30, height: 30)
            style.messageAlignment = .center
            style.backgroundColor = color
            DispatchQueue.main.async {
                guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else { return }
                presentingViewController.view.makeToast(message, image: UIImage(systemName: "exclamationmark.square.fill"), style: style)
            }
        }
    }
}
