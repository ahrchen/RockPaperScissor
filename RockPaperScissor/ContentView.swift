//
//  ContentView.swift
//  RockPaperScissor
//
//  Created by Raymond Chen on 9/22/21.
//

import SwiftUI

struct ContentView: View {
    
    let moves = ["Rock", "Paper", "Scissors"]
    @State var playerScore = 0
    @State var round = 1
    @State var appChoice = Int.random(in: 0..<3)
    @State var shouldWin = Bool.random()
    
    
    var body: some View {
        VStack(){
            Text(round >= 10 ? "Score: \(playerScore)/\(round)" : "Round: \(round)")
            Text("CPU is \(moves[appChoice])")
                .padding(.bottom)
            
            Text(shouldWin ? "You Should Win" :
            "You Should Lose")
        
            HStack {
                ForEach(0..<3) { number
                    in Button(action: {self.buttonTapped(number)}) {
                        Text(moves[number])
                    }
                }
            }
        }
        
    }
    
    func buttonTapped(_ number: Int) {
        var isWin: Bool? = nil
        
        if appChoice + 1 == number  {
            isWin = true
        } else if appChoice == 2 && number == 0 {
            isWin = true
        } else if appChoice - 1 == number {
            isWin = false
        } else if appChoice == 0 && number == 2 {
            isWin = false
        }
        
        if shouldWin && (isWin != nil) && isWin!{
            playerScore += 1
        } else if !shouldWin && (isWin != nil) && !isWin! {
            playerScore += 1
        }
        
        round += 1
        appChoice = Int.random(in: 0..<3)
        shouldWin = Bool.random()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
