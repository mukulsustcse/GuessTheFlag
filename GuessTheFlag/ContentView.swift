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
    
    var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        
        ZStack {
            Color.blue
                .ignoresSafeArea()
            Color.secondary
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .bold()
                        .foregroundColor(.white)
                }
                
                ForEach(0..<3) {
                    
                    number in
                    
                    Button(action: {
                        
                    }, label: {
                        Image(countries[number])
                            .renderingMode(.original)
                    })
                }
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
