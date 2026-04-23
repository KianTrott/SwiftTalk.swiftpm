//
//  ESView.swift
//  SwiftTalk
//
//  Created by Kian J. Trotter on 4/21/26.
//
import SwiftUI

struct EnglishView: View {
    var body: some View {
        NavigationStack{
        
        VStack {
            Text("Select a language")
                .font(.system(size: 90, weight: .regular, design: .default))
                .offset(x: 0, y: -230)
            
                Divider()
                .background(Color.black)
                .offset(x: 0, y: -250 )
            
            Text("Translate")
                .bold()
                .font(.system(size: 60, weight: .regular, design: .default))
                .offset(x: -230, y: -230)
            
            Text("Spanish")
                .font(.system(size: 50, weight: .regular, design: .default))
                .offset(x: -230, y: -200)
            
            Text("French")
                .font(.system(size: 50, weight: .regular, design: .default))
                .offset(x: -230, y: -190)
            
            Text("German")
                .font(.system(size: 50, weight: .regular, design: .default))
                .offset(x: -230, y: -180)
            
            Divider()
                .background(Color.black)
                .rotationEffect(.degrees(90))
                .offset(x: 0, y: 500)
            Divider()
                .background(Color.black)
                .rotationEffect(.degrees(90))
                .offset(x: 0, y: -46 )
            
            Text("Learning")
                .bold()
                .font(.system(size: 60, weight: .regular, design: .default))
                .offset(x: 230, y: -540)
            
            Text("Matching-Spanish")
                .font(.system(size: 50, weight: .regular, design: .default))
                .offset(x: 250, y: -530)
            
            Text("Matching-French")
                .font(.system(size: 50, weight: .regular, design: .default))
                .offset(x: 250, y: -525)
            
            Text("Matching-German")
                .font(.system(size: 50, weight: .regular, design: .default))
                .offset(x: 250, y: -515)
            
            Text("Cards-Spanish")
                .font(.system(size: 50, weight: .regular, design: .default))
                .offset(x: 250, y: -505)
            
            Text("Cards-French")
                .font(.system(size: 50, weight: .regular, design: .default))
                .offset(x: 250, y: -495)
            
            Text("Cards-German")
                .font(.system(size: 50, weight: .regular, design: .default))
                .offset(x: 250, y: -485)
            
            
            VStack {
                Text("Translate")
                    .bold()
                    .font(.system(size: 60, weight: .regular, design: .default))
                    .offset(x: -230, y: -570)
                
                
                
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        NavigationLink(destination: ContentView()) {
                            Image(systemName: "house")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                        }
                        
                        Spacer(minLength: 900)
                    }
                    
                        
                        
                }
                
            }
        }.navigationBarBackButtonHidden()
        
    }
}

#Preview {
    EnglishView()
}

