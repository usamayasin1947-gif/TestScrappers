

import Foundation
import GoogleSignIn
import Network
import SwiftUI

class AuthViewModel: BaseViewModel {
    @Published var isSignedIn: Bool = false
    
    
       private let monitor = NWPathMonitor()
    override init() {
        super.init()
          
          monitor.pathUpdateHandler = {[weak self] path in
              if path.status == .unsatisfied {
               
                      self?.signOut() 
                  
              }
          }
          let queue = DispatchQueue(label: "Monitor")
          monitor.start(queue: queue)
      }
   
   func signIn(){
        
        let signInConfig = GIDConfiguration(clientID: "255284071470-hvmi2h7urdqhum7rp363vcu5vhe0g36m.apps.googleusercontent.com")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        guard let rootViewController = windowScene.windows.first?.rootViewController else { return }
        GIDSignIn.sharedInstance.configuration = signInConfig
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)
        {[weak self] user, error in
            if let error = error {
                DispatchQueue.main.async {
                    MyAlerts.shared.showToast("\(error.localizedDescription)",color: .systemRed)
                }
                return
            }
            self?.checkStatus()
        }
        
    }
    
    func signOut(){
        GIDSignIn.sharedInstance.signOut()
        checkStatus()
    }

    func checkStatus(){
        
        if(GIDSignIn.sharedInstance.currentUser != nil){
            let user = GIDSignIn.sharedInstance.currentUser
            guard let user = user else { return }
            _ = user.profile?.givenName
            _ = user.profile!.imageURL(withDimension: 100)!.absoluteString
            print(user.profile?.email as Any)
            
            print(user.idToken?.tokenString as Any)
            
            DispatchQueue.main.async {[weak self] in
                                self?.isSignedIn = true
                MyAlerts.shared.showToast("\("Successfully Login!")")
                            }
                        
        }else{
            
                DispatchQueue.main.async {[weak self] in
                    self?.isSignedIn = false
                    MyAlerts.shared.showToast("\("Successfully Logout!")",color: .systemRed)
                }
            
        }
    }
    func checkPreviousSession(){
        if GIDSignIn.sharedInstance.hasPreviousSignIn(){
            DispatchQueue.main.async {[weak self] in
                self?.isSignedIn = true
            }
        }
    }
    
 
}






