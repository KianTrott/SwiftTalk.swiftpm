//
//  FTranslateView.swift
//  SwiftTalk
//
//  Created by Kian J. Trotter on 4/27/26.
//

import SwiftUI


struct EFTranslateView: View {
    @State var englishText: String = ""
    var body: some View {
        Text("Translate")
            .bold()
            .offset(x: 0, y: -460)
            .font(.system(size: 80, weight: .regular, design: .default))
        
        Divider()
            .background(Color.black)
            .offset(x: 0, y: -480 )
        HStack{
            VStack {
                Text("English")
                    .font(.system(size: 60, weight: .regular, design: .default))
                
                TextField("Enter text here", text: $englishText)
                    .font(Font.system(size: 40, weight: .regular, design: .default))
                    .frame(width: 300, height: 200, alignment: .topLeading)
                    .border(.black)
            }
            
            Button {
                
            } label: {
                Image(systemName: "arrow.left.arrow.right")
                    .frame(width: 20, height: 200, alignment: .bottom)
                    .font(.system(size: 60, weight: .regular, design: .default))
                    .foregroundStyle(.black)
            }
            .padding(50)
            .offset(x: 0, y: -15)
            
            VStack{
                Text("French")
                    .font(.system(size: 60, weight: .regular, design: .default))
                ZStack{
                    Rectangle()
                        .frame(width: 300, height: 200, alignment: .topLeading)
                        .border(.black)
                        .foregroundStyle(.white)
                    Text("Bonjour")
                        .font(Font.system(size: 40, weight: .regular, design: .default))
                        .frame(width: 300, height: 200, alignment: .topLeading)
                    
                        .toolbar {
                            ToolbarItem(placement: .principal) {
                                HStack {
                                    NavigationLink(destination: EnglishView()) {
                                        Image(systemName: "house")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 100)
                                    }
                                    Spacer(minLength: 900)
                                }
                            }
                        }
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}
