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
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        
        ZStack {
//            Color.blue
//                .ignoresSafeArea()
//            Color.secondary
//                .ignoresSafeArea()
            
            LinearGradient(gradient: Gradient(colors: [.black, .blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                        .font(.subheadline.weight(.heavy))
                    Text(countries[correctAnswer])
                        .bold()
                        .foregroundColor(.white)
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
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is ???")
        }
        
    }
    
    func flagTapped(_ number:Int) {
        
        if number == correctAnswer {
            scoreTitle = "Correct"
        }
        else {
            scoreTitle = "Wrong"
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
