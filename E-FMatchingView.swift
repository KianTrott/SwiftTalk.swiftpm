//
//  FMatchingView.swift
//  SwiftTalk
//
//  Created by Kian J. Trotter on 4/23/26.
//

import SwiftUI

struct MatchItemF: Identifiable {
    let id = UUID()
    let pairID: Int
    let text: String
    var isMatched: Bool = false
}

struct EFMatchingView: View {
    @State var time: Double = 0
    @State var isRunning = false
    @State var cards: [MatchItemF] = []
    @State var selectedWords: [Int] = []
    @AppStorage("EFMatchingTopScores") var topScoresData: Data = Data()
    @State var topScores: [Double] = []
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    let samplePairs: [MatchItemF] = [
        MatchItemF(pairID: 1, text: "Hello"),
        MatchItemF(pairID: 1, text: "Bonjour"),
        
        MatchItemF(pairID: 2, text: "Bye"),
        MatchItemF(pairID: 2, text: "Au revoir"),
        
        MatchItemF(pairID: 3, text: "Thanks"),
        MatchItemF(pairID: 3, text: "Merci"),
        
        MatchItemF(pairID: 4, text: "Happy"),
        MatchItemF(pairID: 4, text: "Heureux"),
        
        MatchItemF(pairID: 5, text: "Sad"),
        MatchItemF(pairID: 5, text: "Triste"),
        
        MatchItemF(pairID: 6, text: "Please"),
        MatchItemF(pairID: 6, text: "Plaire"),
        
        MatchItemF(pairID: 7, text: "yes"),
        MatchItemF(pairID: 7, text: "Oui"),
        
        MatchItemF(pairID: 8, text: "What?"),
        MatchItemF(pairID: 8, text: "¿Quoi?"),
        
        MatchItemF(pairID: 9, text: "Who?"),
        MatchItemF(pairID: 9, text: "¿Qui?"),
        
        MatchItemF(pairID: 10, text: "where?"),
        MatchItemF(pairID: 10, text: "¿Ou?"),
        
        MatchItemF(pairID: 11, text: "When?"),
        MatchItemF(pairID: 11, text: "¿Quand?"),
        
        MatchItemF(pairID: 12, text: "Why?"),
        MatchItemF(pairID: 12, text: "¿Porquoi?"),
        
        MatchItemF(pairID: 13, text: "How?"),
        MatchItemF(pairID: 13, text: "¿que? ")
    ]
    
    private func buildDeck() -> [MatchItemF] {
        let pairs = Dictionary(grouping: samplePairs, by: { $0.pairID })
        let chosenKeys = Array(pairs.keys).shuffled().prefix(5)
        var deck: [MatchItemF] = []
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

