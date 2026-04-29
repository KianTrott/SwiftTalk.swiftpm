//
//  SpanishView.swift
//  SwiftTalk
//
//  Created by Kian J. Trotter on 4/23/26.
//

import SwiftUI

struct SpanishView: View {
    var body: some View {
        NavigationStack{
            
            VStack {
                Text("Seleccione un idioma")
                    .font(.system(size: 90, weight: .regular, design: .default))
                    .offset(x: 30, y: -230)
                
                Divider()
                    .background(Color.black)
                    .offset(x: 0, y: -250 )
                
                Text("Traducir")
                    .bold()
                    .font(.system(size: 60, weight: .regular, design: .default))
                    .offset(x: -230, y: -230)
                
                
                NavigationLink("Inglés", destination: SETranslateView())
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .offset(x: -230, y: -200)
                    .foregroundStyle(.primary)
                    .underline()
                
                NavigationLink("Francés", destination: SFTranslateView())
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .offset(x: -230, y: -190)
                    .foregroundStyle(.primary)
                    .underline()
                NavigationLink("Alemán", destination: SGTranslateView())
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .offset(x: -230, y: -180)
                    .foregroundStyle(.primary)
                    .underline()
                Divider()
                    .background(Color.black)
                    .rotationEffect(.degrees(90))
                    .offset(x: 0, y: 500)
                Divider()
                    .background(Color.black)
                    .rotationEffect(.degrees(90))
                    .offset(x: 0, y: -46 )
                
                Text("Aprendiendo")
                    .bold()
                    .font(.system(size: 60, weight: .regular, design: .default))
                    .offset(x: 230, y: -540)
                
                NavigationLink("Emparejar-Inglés", destination: SEMatchingView())
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .offset(x: 250, y: -530)
                    .foregroundStyle(.primary)
                    .underline()
                NavigationLink("Emparejar-Francés", destination: SFMatchingView())
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .offset(x: 250, y: -525)
                    .foregroundStyle(.primary)
                    .underline()
                NavigationLink("Emparejar-Alemán", destination: SGMatchingView())
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .offset(x: 250, y: -515)
                    .foregroundStyle(.primary)
                    .underline()
                NavigationLink("Cartas-Inglés", destination: SECardsView())
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .offset(x: 250, y: -505)
                    .foregroundStyle(.primary)
                    .underline()
                NavigationLink("Cartas-Francés", destination: SFCardsView())
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .offset(x: 250, y: -495)
                    .foregroundStyle(.primary)
                    .underline()
                NavigationLink("Cartas-Alemán", destination: SGCardsView())
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .offset(x: 250, y: -485)
                    .foregroundStyle(.primary)
                    .underline()
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
    
    
}
