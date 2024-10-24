

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
struct LoginView: View {
    @StateObject var authViewModel = AuthViewModel()
    var body: some View {
        NavigationView {
            VStack {
                if authViewModel.isSignedIn {
                    SecondView()
                } else {
                    GoogleSignInButton{
                        authViewModel.signIn()
                    }
                    .frame(width: 300,height: 300)
                }
            }
           
            .onAppear {
                authViewModel.checkPreviousSession()
            }
        }
        
    }
}




#Preview {
    LoginView()
}


