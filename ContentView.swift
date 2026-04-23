import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationStack{
        Text("SwiftTalk")
            .bold()
            .offset(x: 0, y: -300)
            .font(.system(size: 60, weight: .regular, design: .default))
            .padding()
        
        Text("Welcome")
                .font(.system(size: 40, weight: .regular, design: .default))
            .offset(x: -350, y: -90)
            .rotationEffect(.degrees(22))
        
        Text("Bienvenido")
                .font(.system(size: 40, weight: .regular, design: .default))
            .offset(x: -275, y: -100)
            .rotationEffect(.degrees(345))
        
        Text("Empfang")
                .font(.system(size: 40, weight: .regular, design: .default))
            .offset(x: 350, y: -200)
            .rotationEffect(.degrees(345))
        
        Text("Bienvenu")
                .font(.system(size: 40, weight: .regular, design: .default))
            .offset(x: 240, y: -200)
            .rotationEffect(.degrees(22))
        
            
                NavigationLink("English 🇬🇧", destination: EnglishView())
                .font(.system(size: 40, weight: .regular, design: .default))
                .foregroundStyle(.black)
                .underline()
                .offset(x: 0, y: -300)
            
            NavigationLink("Español 🇪🇸", destination: SpanishView())
            .font(.system(size: 40, weight: .regular, design: .default))
            .foregroundStyle(.black)
            .underline()
            .offset(x: 0, y: -300)
            
        
            
            NavigationLink("Français 🇫🇷", destination: FrenchView())
            .font(.system(size: 40, weight: .regular, design: .default))
            .foregroundStyle(.black)
            .underline()
            .offset(x: 0, y: -300)
            
            NavigationLink("Deutsch 🇩🇪", destination: GermanView())
            .font(.system(size: 40, weight: .regular, design: .default))
            .foregroundStyle(.black)
            .underline()
            .offset(x: 0, y: -300)
        
        
        }
    }
}
