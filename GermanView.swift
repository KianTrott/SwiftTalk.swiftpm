//
//  GermanView.swift
//  SwiftTalk
//
//  Created by Kian J. Trotter on 4/23/26.
//

import SwiftUI

struct GermanView: View {
    var body: some View {
        NavigationStack{
            
            VStack {
                Text("Sprache auswählen")
                    .font(.system(size: 90, weight: .regular, design: .default))
                    .offset(x: 30, y: -230)
                
                Divider()
                    .background(Color.black)
                    .offset(x: 0, y: -250 )
                
                Text("Übersetzen")
                    .bold()
                    .font(.system(size: 60, weight: .regular, design: .default))
                    .offset(x: -230, y: -230)
                
                Text("Englisch")
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .offset(x: -230, y: -200)
                
                Text("Französisch")
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .offset(x: -230, y: -190)
                
                Text("Spanisch")
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
                
                Text("Lernen")
                    .bold()
                    .font(.system(size: 60, weight: .regular, design: .default))
                    .offset(x: 230, y: -540)
                
                Text("Zuordnung-Englisch")
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .offset(x: 250, y: -530)
                
                Text("Zuordnung-Französisch")
                    .font(.system(size: 48, weight: .regular, design: .default))
                    .offset(x: 250, y: -525)
                
                Text("Zuordnung-Spanisch")
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .offset(x: 250, y: -515)
                
                Text("Karten-Englisch")
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .offset(x: 250, y: -505)
                
                Text("Karten-Französisch")
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .offset(x: 250, y: -495)
                
                Text("Karten-Spanisch")
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
