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
                
                Text("Inglés")
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .offset(x: -230, y: -200)
                
                Text("Francés")
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .offset(x: -230, y: -190)
                
                Text("Alemán")
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
                
                Text("Aprendiendo")
                    .bold()
                    .font(.system(size: 60, weight: .regular, design: .default))
                    .offset(x: 230, y: -540)
                
                Text("Emparejar-Inglés")
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .offset(x: 250, y: -530)
                
                Text("Emparejar-Francés")
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .offset(x: 250, y: -525)
                
                Text("Emparejar-Alemán")
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .offset(x: 250, y: -515)
                
                Text("Cartas-Inglés")
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .offset(x: 250, y: -505)
                
                Text("Cartas-Francés")
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .offset(x: 250, y: -495)
                
                Text("Cartas-Alemán")
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .offset(x: 250, y: -485)
                
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
