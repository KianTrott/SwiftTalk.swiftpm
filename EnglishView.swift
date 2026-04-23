//
//  ESView.swift
//  SwiftTalk
//
//  Created by Kian J. Trotter on 4/21/26.
//
import SwiftUI

struct EnglishView: View {
    var body: some View {
        Text("Select a language")
            .font(.system(size: 90, weight: .regular, design: .default))
            .offset(x: 0, y: -570)
        
            Divider()
            .background(Color.black)
            .offset(x: 0, y: -600 )
        
        VStack {
            Text("Translate")
                .bold()
                .font(.system(size: 60, weight: .regular, design: .default))
                .offset(x: -230, y: -570)
            
            
            
        }
        
    }
}

