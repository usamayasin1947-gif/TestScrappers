import SwiftUI

struct DetailScreen: View {
    @StateObject var authVm =  AuthViewModel()
    @StateObject private var ipViewModel = DetailViewModel()

    var body: some View {
        VStack {
            if ipViewModel.isLoading {
                ProgressView() 
            } else {
                Text("IP Address: \(ipViewModel.ipAddress)")
                    .font(.headline)
                    .padding()

                if let geoInfo = ipViewModel.geoInfo {
                    Text("City: \(geoInfo.city ?? "N/A")")
                    Text("Region: \(geoInfo.region ?? "N/A")")
                    Text("Country: \(geoInfo.country ?? "N/A")")
                    Text("Location: \(geoInfo.loc ?? "N/A")")
                    Text("Organization: \(geoInfo.org ?? "N/A")")
                    Text("Postal Code: \(geoInfo.postal ?? "N/A")")
                }
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    authVm.signOut()
                    authVm.backToRootViewController()
                }) {
                    Text("Sign Out")
                }
            }
        }
        .onAppear {
            ipViewModel.fetchPublicIP() 
        }
    }
}

#Preview {
    DetailScreen(authVm: AuthViewModel())
}
