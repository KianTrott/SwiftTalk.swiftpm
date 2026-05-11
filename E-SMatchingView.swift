//
//  SMatchingView.swift
//  SwiftTalk
//
//  Created by Kian J. Trotter on 4/23/26.
//

import SwiftUI

struct ESMatchingView: View {
    @State private var time = 0
    @State private var timerRunning = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack {
            Text("Matching")
                .font(.system(size: 90, weight: .regular, design: .default))
                .offset(x: 0, y: -320)
            
            Divider()
                .background(Color.black)
                .offset(x: 0, y: -360)
            
            
        }
        HStack{
            
            Button(action: {
                
            }, label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 150, height: 150)
                        .border(Color.black, width: 4)
                        .foregroundStyle(.white)
                }
            })
            Button(action: {
                
            }, label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 150, height: 150)
                        .border(Color.black, width: 4)
                        .foregroundStyle(.white)
                }
            })
            .padding()
            Button(action: {
                
            }, label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 150, height: 150)
                        .border(Color.black, width: 4)
                        .foregroundStyle(.white)
                }
            })
        }
        HStack{
            
            Button(action: {
                
            }, label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 150, height: 150)
                        .border(Color.black, width: 4)
                        .foregroundStyle(.white)
                }
            })
            Button(action: {
                
            }, label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 150, height: 150)
                        .border(Color.black, width: 4)
                        .foregroundStyle(.white)
                }
            })
            .padding()
            Button(action: {
                
            }, label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 150, height: 150)
                        .border(Color.black, width: 4)
                        .foregroundStyle(.white)
                }
            })
        }
        HStack{
            
            Button(action: {
                
            }, label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 150, height: 150)
                        .border(Color.black, width: 4)
                        .foregroundStyle(.white)
                }
            })
            Button(action: {
                
            }, label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 150, height: 150)
                        .foregroundStyle(.white)
                }
            })
            .padding()
            Button(action: {
                
            }, label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 150, height: 150)
                        .border(Color.black, width: 4)
                        .foregroundStyle(.white)
                    
                    
                }
                
            })
        }
        Text("\(time)")
            .font(.system(size: 50, weight: .regular, design: .default))
        
            Button(timerRunning ? "Stop" : "Start" ) {
            timerRunning.toggle()
            
        }
        .onReceive(timer) { _ in
            if timerRunning {
                time += 1
            }
        }
        
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
