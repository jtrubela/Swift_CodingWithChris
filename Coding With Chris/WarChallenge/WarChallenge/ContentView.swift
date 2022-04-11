//
//  ContentView.swift
//  WarChallenge
//
//  Created by Justin Trubela on 7/3/21.
//

import SwiftUI

struct ContentView: View {
    // Random Card generator
    var randNum = 0
    
    //Player/CPU Card
    @State var playerCard = "back"
    @State var cpuCard = "back"
    
    // Player/CPU Scores
    @State var playerScore = 0
    @State var cpuScore = 0
    
    var body: some View {
        
    // Z Stack showing everything on top of the background
        ZStack{
            Image("background").ignoresSafeArea()
            
            
    //Vertical Stack showing 5 elements
            //Element 1 - War Logo
            VStack{
                
                Spacer()
                Image("logo")
                Spacer()
                
                
                //Element 2 - VStack of cards
                HStack{
                    
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()

                }
                
                Spacer()
                
                //Element 3 - Deal "Button"
                Button(action: {
                    
                    // Generate a random number
                    let playerRand = Int.random(in: 2...14)
                    let cpuRand = Int.random(in: 2...14)
                    
                    // update the cards
                    playerCard = "card" + String(playerRand)
                    cpuCard = "card" + String(cpuRand)
                    
                    // update the score
                    if(playerRand > cpuRand){
                        playerScore += 1
                    }
                    else if cpuRand > playerRand{
                        cpuScore += 1
                    }
                    
                    
                }, label: {
                    Image("dealbutton")
                })
                

                
                Spacer()
                
                //Element 4 - Scores
                HStack{
                    Spacer()
                    // Player Score Text
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom,10.0)
                        
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                    
                // Computer Score
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom,10.0)
                        
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                Spacer()
            }
            .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
