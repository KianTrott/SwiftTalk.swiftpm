//
//  SMatchingView.swift
//  SwiftTalk
//
//  Created by Kian J. Trotter on 4/23/26.
//

import SwiftUI

struct ESMatchingView: View {
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
#Preview {
    ESMatchingView()
}
