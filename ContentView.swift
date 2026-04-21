import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationStack{
        Text("SwiftTalk")
            .bold()
            .offset(x: 0, y: -300)
            .font(.largeTitle)
        
        
        Text("Welcome")
            .font(.title)
            .offset(x: -350, y: -100)
            .rotationEffect(.degrees(22))
        
        Text("Bienvenido")
            .font(.title)
            .offset(x: -275, y: -100)
            .rotationEffect(.degrees(345))
        
        Text("Empfang")
            .font(.title)
            .offset(x: 350, y: -190)
            .rotationEffect(.degrees(345))
        
        Text("Bienvenu")
            .font(.title)
            .offset(x: 240, y: -190)
            .rotationEffect(.degrees(22))
        
            
                NavigationLink("English", destination: ESView())
                .font(.system(size: 40, weight: .regular, design: .default))
                .foregroundStyle(.black)
                .underline()
                .offset(x: 0, y: -300)
            
            
        }
    }
}
