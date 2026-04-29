
import SwiftUI


struct ESTranslateView: View {
    @State var englishText: String = ""
    var body: some View {
        Text("Translate")
            .bold()
            .offset(x: 0, y: -330)
            .font(.system(size: 80, weight: .regular, design: .default))
        
        Divider()
            .background(Color.black)
            .offset(x: 0, y: -320 )
        VStack {
            Text("English")
                .font(.system(size: 60, weight: .regular, design: .default))
                .offset(x: -250, y: -100)
            TextField("Enter english text here", text: $englishText)
                .frame(width: 300, height: 200)
                .border(.black)
                .offset(x: -250, y: -100)
            
            Image(systemName: "Arrow")
            
            Text("Spanish")
                .font(.system(size: 60, weight: .regular, design: .default))
                .offset(x: 0, y: -170)
            
                .frame(width: 300, height: 200)
                .border(.black)
                .offset(x: 300, y: -312)
        }
    }
}
