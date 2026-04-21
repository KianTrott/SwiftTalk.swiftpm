import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            
                NavigationLink("English", destination: ESView())
                .font(.system(size: 50, weight: .regular, design: .default))
                .foregroundStyle(.black)
                .underline()
            
            
        }
    }
}
