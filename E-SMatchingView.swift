//
//  SMatchingView.swift
//  SwiftTalk
//
//  Created by Kian J. Trotter on 4/23/26.
//

import SwiftUI

struct MatchItem: Identifiable {
    let id = UUID()
    let pairID: Int
    let text: String
    var isMatched: Bool = false
}

struct ESMatchingView: View {
    @State var time: Double = 0
    @State var isRunning = false
    @State var cards: [MatchItem] = []
    @State var selectedWords: [Int] = []
    @AppStorage("ESMatchingTopScores") var topScoresData: Data = Data()
    @State var topScores: [Double] = []
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    let samplePairs: [MatchItem] = [
        MatchItem(pairID: 1, text: "Hello"),
        MatchItem(pairID: 1, text: "Hola"),
        
        MatchItem(pairID: 2, text: "Bye"),
        MatchItem(pairID: 2, text: "Adios"),
        
        MatchItem(pairID: 3, text: "Thanks"),
        MatchItem(pairID: 3, text: "Gracias"),
        
        MatchItem(pairID: 4, text: "Happy"),
        MatchItem(pairID: 4, text: "Feliz"),
        
        MatchItem(pairID: 5, text: "Sad"),
        MatchItem(pairID: 5, text: "Triste"),
        
        MatchItem(pairID: 6, text: "Please"),
        MatchItem(pairID: 6, text: "Por favor"),
        
        MatchItem(pairID: 7, text: "yes"),
        MatchItem(pairID: 7, text: "Sí"),
        
        MatchItem(pairID: 8, text: "What?"),
        MatchItem(pairID: 8, text: "¿Qué?"),
        
        MatchItem(pairID: 9, text: "Who?"),
        MatchItem(pairID: 9, text: "¿Quién?"),
        
        MatchItem(pairID: 10, text: "where?"),
        MatchItem(pairID: 10, text: "¿Dónde?"),
        
        MatchItem(pairID: 11, text: "When?"),
        MatchItem(pairID: 11, text: "¿Cuándo?"),
        
        MatchItem(pairID: 12, text: "Why?"),
        MatchItem(pairID: 12, text: "¿Por qué?"),
        
        MatchItem(pairID: 13, text: "How?"),
        MatchItem(pairID: 13, text: "¿Cómo? ")
    ]
    
    private func buildDeck() -> [MatchItem] {
        let pairs = Dictionary(grouping: samplePairs, by: { $0.pairID })
        let chosenKeys = Array(pairs.keys).shuffled().prefix(5)
        var deck: [MatchItem] = []
        for key in chosenKeys {
            if var items = pairs[key] {
                items.shuffle()
                deck.append(contentsOf: items.prefix(2))
            }
        }
        return deck.shuffled()
    }
    
    private func resetGame() {
        cards = buildDeck()
        selectedWords = []
        time = 0
        isRunning = true
    }
    
    private func loadTopScores() {
        guard !topScoresData.isEmpty else { topScores = []; return }
        do {
            topScores = try JSONDecoder().decode([Double].self, from: topScoresData)
        } catch {
            topScores = []
        }
    }
    
    private func saveTopScores() {
        do {
            topScoresData = try JSONEncoder().encode(topScores)
        } catch {
        }
    }
    
    init() {
        _cards = State(initialValue: [])
    }
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Matching")
                .font(.system(size: 56, weight: .bold))

            Text(String(format: "Time: %.1fs", time))
                .font(.title)
                .onAppear {
                    if cards.isEmpty {
                        cards = buildDeck()
                    }
                    isRunning = true
                    loadTopScores()
                }
                .onReceive(timer) { _ in
                    if isRunning {
                        time += 0.1
                    }
                }

            LazyVGrid(
                columns: [
                    GridItem(.adaptive(minimum: 200, maximum: 320), spacing: 24)
                ],
                spacing: 20
            ) {
                ForEach(cards.indices, id: \.self) { index in
                    let card = cards[index]
                    Button(action: { cardTapped(index) }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(card.isMatched ? Color.green.opacity(0.3) : Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(selectedWords.contains(index) ? Color.blue : Color.black, lineWidth: 3)
                                )
                            Text(card.text)
                                .foregroundColor(.primary)
                                .font(.title2)
                                .multilineTextAlignment(.center)
                                .padding(8)
                        }
                        .frame(minHeight: 140, idealHeight: 180, maxHeight: 220)
                    }
                    .disabled(card.isMatched || selectedWords.contains(index) || selectedWords.count == 2)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 16)

            VStack(alignment: .leading, spacing: 8) {
                Text("Top Times")
                    .font(.largeTitle)
                if topScores.isEmpty {
                    Text("No scores yet. Finish a game to record your time!")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                } else {
                    ForEach(Array(topScores.enumerated()), id: \.offset) { idx, score in
                        Text("\(idx + 1). \(String(format: "%.1fs", score))")
                            .font(.largeTitle)
                    }
                }
            }
            .padding(.horizontal)

            HStack(spacing: 16) {
                Button("Reset") { resetGame() }
                    .buttonStyle(.borderedProminent)

                Spacer()
            }
            .padding(.horizontal)

            Spacer(minLength: 0)
        }
        .toolbar {
            ToolbarItem(placement: .automatic) {
                HStack {
                    NavigationLink(destination: EnglishView()) {
                        Image(systemName: "house")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                    }
                    Spacer()
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
    
     func cardTapped(_ index: Int) {
        guard index >= 0 && index < cards.count else { return }
        guard !cards[index].isMatched else { return }

        selectedWords.append(index)

        if selectedWords.count == 2 {
            let first = selectedWords[0]
            let second = selectedWords[1]
            if cards[first].pairID == cards[second].pairID {
                cards[first].isMatched = true
                cards[second].isMatched = true
                selectedWords.removeAll()
                checkForWin()
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                    selectedWords.removeAll()
                }
            }
        }
    }
    func checkForWin() {
        if cards.allSatisfy({ $0.isMatched }) {
            isRunning = false
            topScores.append(time)
            topScores.sort()
            if topScores.count > 5 { topScores = Array(topScores.prefix(5)) }
            saveTopScores()
        }
    }
}

