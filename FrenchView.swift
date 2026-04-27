//
//  FrenchView.swift
//  SwiftTalk
//
//  Created by Kian J. Trotter on 4/23/26.
//
import SwiftUI

struct FrenchView: View {
    var body: some View {
        NavigationStack{
            
            VStack {
                Text("Sélectionnez une langue")
                    .font(.system(size: 75, weight: .regular, design: .default))
                    .offset(x: 0, y: -230)
                
                Divider()
                    .background(Color.black)
                    .offset(x: 0, y: -250 )
                
                Text("Traduire")
                    .bold()
                    .font(.system(size: 60, weight: .regular, design: .default))
                    .offset(x: -230, y: -230)
                
                Text("Anglais")
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .offset(x: -230, y: -200)
                
                Text("Espagnol")
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .offset(x: -230, y: -190)
                
                Text("Allemand")
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
                
                Text("Apprentissage")
                    .bold()
                    .font(.system(size: 60, weight: .regular, design: .default))
                    .offset(x: 230, y: -540)
                
                Text("Appariement-Anglais")
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .offset(x: 250, y: -530)
                
                Text("Appariement-Espagnol")
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .offset(x: 250, y: -525)
                
                Text("Appariement-Allemand")
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .offset(x: 250, y: -515)
                
                Text("Cartes-Anglais")
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .offset(x: 250, y: -505)
                
                Text("Cartes-Espagnol")
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .offset(x: 250, y: -495)
                
                Text("Cartes-Allemand")
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
                    
                }
            }.navigationBarBackButtonHidden()
            
        }
    }
