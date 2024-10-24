

import SwiftUI

struct SecondView: View {
    var body: some View {
        GeometryReader { geometry in
            NavigationLink(destination: DetailScreen()) {
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: geometry.size.width / 2, height: geometry.size.width / 2)
                    .cornerRadius(20)
                    .overlay(
                        Text("Tap Here")
                            .foregroundColor(.white)
                            .font(.headline)
                    )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
    }
}




#Preview {
    SecondView()
}



