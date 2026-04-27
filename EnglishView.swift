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
                
                NavigationLink("Spanish", destination: ESTranslateView())
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .underline()
                    .foregroundStyle(.primary)
                    .offset(x: -230, y: -200)
                
                NavigationLink("French", destination: EFTranslateView())
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .underline()
                    .foregroundStyle(.primary)
                    .offset(x: -230, y: -190)
                
                NavigationLink("German", destination: EGTranslateView())
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .underline()
                    .foregroundStyle(.primary)
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
                
                NavigationLink("Matching-Spanish", destination: ESMatchingView())
                    .foregroundStyle(.primary)
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .underline()
                    .offset(x: 250, y: -530)
                
                NavigationLink("Matching-French", destination: EFMatchingView())
                    .foregroundStyle(.primary)
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .underline()
                    .offset(x: 250, y: -525)
                
                NavigationLink("Matching-German", destination: EGMatchingView())
                    .foregroundStyle(.primary)
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .underline()
                    .offset(x: 250, y: -515)
                
                NavigationLink("Cards-Spanish", destination: ESCardsView())
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .underline()
                    .foregroundStyle(.primary)
                    .offset(x: 250, y: -505)
                
                NavigationLink("Cards-French", destination: EFCardsView())
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .underline()
                    .foregroundStyle(.primary)
                    .offset(x: 250, y: -495)
                
                NavigationLink("Cards-German", destination: EGCardsView())
                    .font(.system(size: 50, weight: .regular, design: .default))
                    .underline()
                    .foregroundStyle(.primary)
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
