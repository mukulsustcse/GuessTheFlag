//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by M. A. Alim Mukul on 20.09.22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = [
        "Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"
    ].shuffled()
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var answerMessage = ""
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        
        ZStack {
//            Color.blue
//                .ignoresSafeArea()
//            Color.secondary
//                .ignoresSafeArea()
            
            LinearGradient(gradient: Gradient(colors: [.black, .blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
//            RadialGradient(stops: [
//                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
//                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
//            ], center: .top, startRadius: 200, endRadius: 700)
//            .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .bold()
//                            .foregroundColor(.black)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) {
                        
                        number in
                        
                        Button(action: {
                            
                            flagTapped(number)
                            
                        }, label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .cornerRadius(15)
                                .shadow(radius: 3, x: 12, y: 10)
                        })
                    }
                }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            
            Button("Continue", action: askQuestion)
            
        } message: {
            Text(answerMessage)
        }
        
    }
    
    func flagTapped(_ number:Int) {
        
        if number == correctAnswer {
            scoreTitle = "Correct"
            
            score += 100
            
            answerMessage  = "Yahoo! Your answer is Correct. You have earned 100 points."
        }
        else {
            scoreTitle = "Wrong"
            
            score -= 50
            
            answerMessage  = "Oops! Your answer is Wrong. You have lost 50 points."
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
