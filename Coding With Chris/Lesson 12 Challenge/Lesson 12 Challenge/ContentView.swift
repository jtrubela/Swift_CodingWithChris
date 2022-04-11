//
//  ContentView.swift
//  Lesson 12 Challenge
//
//  Created by Justin Trubela on 7/14/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var UInumber = 0
    @State var shouldDecrease = false
    
    
    func increase () {
        let number = Int.random(in: 1...10)
 
        UInumber = UInumber + number
    }
    
    func decrease () {
        let number = Int.random(in: 1...10)
        
        UInumber = UInumber - number
    }
    
    var body: some View {

        VStack{
            Text("\(UInumber)")
                .padding()
        
            Button("Click Me") {
                
                // Use the flag to determine which method to call
                if shouldDecrease == false {
                    increase()
                }
                else {
                    decrease()
                }
                // A little bit more advanced, but here's another way to write the above if statement:
                // shouldDecrease ? decrease() : increase()
                
                // See if we should toggle the flag
                if UInumber > 50 {
                    shouldDecrease = true
                }
                else if UInumber < 0 {
                    shouldDecrease = false
                }
                
            }
            
            
            
            .font(.title3)
            .frame(width: 100, height: 50, alignment: .center)
            .background(Color.black)
            .cornerRadius(25)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
