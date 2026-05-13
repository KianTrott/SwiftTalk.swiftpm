//
//  GTranslateView.swift
//  SwiftTalk
//
//  Created by Kian J. Trotter on 4/27/26.
//
import SwiftUI
import UIKit


struct EGTranslateView: View {
    @State var englishText: String
    @State var germanText: String
    var body: some View {
        Text("Translate")
            .bold()
            .offset(x: 0, y: -1)
            .font(.system(size: 80, weight: .regular, design: .default))
        
        Divider()
            .background(Color.black)
            .offset(x: 0, y: -4 )
        
        VStack{
            HStack{
                VStack {
                    Text("English")
                        .font(.system(size: 60, weight: .regular, design: .default))
                    
                    TextField("Enter text here", text: $englishText)
                        .font(Font.system(size: 40, weight: .regular, design: .default))
                        .frame(width: 300, height: 200, alignment: .topLeading)
                        .border(.black)
                }
                
                .padding(50)
                Button {
                    if englishText.isEmpty {
                        germanText = ""
                        return
                    }
                    let url = URL(string: "https://api.mymemory.translated.net/get?q=\(englishText)&langpair=en|de")!
                                  
                    let session = URLSession.shared.dataTask(with: url) { data, response, error in
                        if let data = data {
                            if let json = try? JSONSerialization.jsonObject(with: data) as? NSDictionary {
                                let dictionary = json["responseData"] as? NSDictionary
                                germanText = (dictionary?["translatedText"] as! String)
                            }
                        }
                    }.resume()
                                  
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 35)
                            .fill(.blue)
                            .frame(width: 300, height: 100)
                        Text("Translate")
                            .foregroundStyle(.white)
                            .bold()
                            .font(.title)
                        
                    }
                }
                .frame(width: 1, height: 1000, alignment: .bottom)
                .padding(50)
                
                VStack{
                    Text("German")
                        .font(.system(size: 60, weight: .regular, design: .default))
                    ZStack{
                        Rectangle()
                            .frame(width: 300, height: 200, alignment: .topLeading)
                            .border(.black)
                            .foregroundStyle(.white)
                        Text("\(germanText)")
                            .font(Font.system(size: 40, weight: .regular, design: .default))
                            .frame(width: 300, height: 200, alignment: .topLeading)
                        
                        
                        
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
            }
        }
    }
}
//api.mymemory.translated.net/get?q=red&langpair=en|es
