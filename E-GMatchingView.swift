//
//  GMatchingView.swift
//  SwiftTalk
//
//  Created by Kian J. Trotter on 4/23/26.
//
import SwiftUI

struct MatchItemG: Identifiable {
    let id = UUID()
    let pairID: Int
    let text: String
    var isMatched: Bool = false
}

struct EGMatchingView: View {
    @State var time: Double = 0
    @State var isRunning = false
    @State var cards: [MatchItemG] = []
    @State var selectedWords: [Int] = []
    @AppStorage("EGMatchingTopScores") var topScoresDataG: Data = Data()
    @State var topScoresG: [Double] = []
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    let samplePairs: [MatchItemG] = [
        MatchItemG(pairID: 1, text: "Hello"),
        MatchItemG(pairID: 1, text: "Hallo"),
        
        MatchItemG(pairID: 2, text: "Bye"),
        MatchItemG(pairID: 2, text: "Tschüss"),
        
        MatchItemG(pairID: 3, text: "Thanks"),
        MatchItemG(pairID: 3, text: "Danke"),
        
        MatchItemG(pairID: 4, text: "Happy"),
        MatchItemG(pairID: 4, text: "Glücklich"),
        
        MatchItemG(pairID: 5, text: "Sad"),
        MatchItemG(pairID: 5, text: "Traurig"),
        
        MatchItemG(pairID: 6, text: "Please"),
        MatchItemG(pairID: 6, text: "Bitte"),
        
        MatchItemG(pairID: 7, text: "yes"),
        MatchItemG(pairID: 7, text: "Ja"),
        
        MatchItemG(pairID: 8, text: "What?"),
        MatchItemG(pairID: 8, text: "Was?"),
        
        MatchItemG(pairID: 9, text: "Who?"),
        MatchItemG(pairID: 9, text: "Wer?"),
        
        MatchItemG(pairID: 10, text: "where?"),
        MatchItemG(pairID: 10, text: "Wo?"),
        
        MatchItemG(pairID: 11, text: "When?"),
        MatchItemG(pairID: 11, text: "Wann?"),
        
        MatchItemG(pairID: 12, text: "Why?"),
        MatchItemG(pairID: 12, text: "Warum?"),
        
        MatchItemG(pairID: 13, text: "How?"),
        MatchItemG(pairID: 13, text: "Wie?")
    ]
    
     func buildDeck() -> [MatchItemG] {
        let pairs = Dictionary(grouping: samplePairs, by: { $0.pairID })
        let chosenKeys = Array(pairs.keys).shuffled().prefix(5)
        var deck: [MatchItemG] = []
        for key in chosenKeys {
            if var items = pairs[key] {
                items.shuffle()
                deck.append(contentsOf: items.prefix(2))
            }
        }
        return deck.shuffled()
    }
    
     func resetGame() {
        cards = buildDeck()
        selectedWords = []
        time = 0
        isRunning = true
    }
    
     func loadTopScoresG() {
        guard !topScoresDataG.isEmpty else { topScoresG = []; return }
        do {
            topScoresG = try JSONDecoder().decode([Double].self, from: topScoresDataG)
        } catch {
            topScoresG = []
        }
    }
    
     func saveTopScoresG() {
        do {
            topScoresDataG = try JSONEncoder().encode(topScoresG)
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
                    loadTopScoresG()
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
                if topScoresG.isEmpty {
                    Text("No scores yet. Finish a game to record your time!")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                } else {
                    ForEach(Array(topScoresG.enumerated()), id: \.offset) { idx, score in
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
            topScoresG.append(time)
            topScoresG.sort()
            if topScoresG.count > 5 { topScoresG = Array(topScoresG.prefix(5)) }
            saveTopScoresG()
        }
    }
}

