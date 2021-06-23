//
//  ContentView.swift
//  Cards_Ui
//
//  Created by Alonso Martinez on 23/03/21.
//

import SwiftUI

struct ContentView: View {
    //properties
    
    @State var playerCard = "card3"
    @State var cpuCard = "card4"
    @State var playerScore = 0
    @State var cpuScore = 0
    
    var body: some View {
        
        ZStack{
            
            Image("background").edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                Spacer()
                
                Image("logo")
                
                Spacer()
                
                HStack {
                    
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                
                Spacer()
                
                Button(action: {
                    
                    //generate random number
                    
                    let playerRandom = Int.random(in: 2...14)
                    
                    let cpuRandom = Int.random(in: 2...14)
                    
                    //update cards
                    
                    playerCard = "card" + String(playerRandom)
                    
                    cpuCard = "card" + String(cpuRandom)
                    
                    
                    //update score
                    
                    if playerRandom > cpuRandom {
                        
                        playerScore += 1
                    }
                    else if cpuRandom > playerRandom {
                        cpuScore += 1
                    }
                    
                }, label: {
                    Image("dealbutton")
                })
                
                Spacer()
                
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding(.bottom, 10)
                        
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        
                    }
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding(.bottom, 10)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                Spacer()
            }
   
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
