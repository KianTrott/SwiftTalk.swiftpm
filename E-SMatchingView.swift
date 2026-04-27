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
                .offset(x: 0, y: -230)
            
            Divider()
                .background(Color.black)
                .offset(x: 0, y: -250)
            
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
                .navigationBarBackButtonHidden()
        }
    }
}
