//
//  ContentView.swift
//  喝水助手
//
//  Created by Monica Qiu on 2021-03-24.
//

import SwiftUI

// points and drops
var points = 100
var drops = 0

// number of drinks for today
//var totalDrinks = 30
//var drinksLeft = totalDrinks
//var drinksDone = 0
//var goalPercent = 0.7
//var drinkGoal = Int(Double(totalDrinks) * goalPercent)

// past records
var daysAchieved = 0
//var daysFailed = 0
var streak = "N/A"

// alarms
var alarms = [Int]()
var animals = [Int]() // levels of each animal in order. If doesn't have, then level=0.

// colors
//class ColorPalette: ObservableObject {
//    @Published var purple     = Color(red: 218 / 255, green: 220 / 255, blue: 228 / 255)
//    @Published var pink       = Color(red: 255 / 255, green: 214 / 255, blue: 228 / 255)
//    @Published var white      = Color(red: 246 / 255, green: 244 / 255, blue: 244 / 255)
//    @Published var lightBlue  = Color(red: 189 / 255, green: 224 / 255, blue: 254 / 255)
//    @Published var blue       = Color(red: 162 / 255, green: 219 / 255, blue: 255 / 255)
//}


struct ContentView: View {
    
//    @EnvironmentObject var colorPalette: ColorPalette
    @State private var totalDrinks = 30
    @State private var drinksLeft = 30
    @State private var drinksDone = 0
    @State private var drinkGoal = 25
    @State private var goalAchieved = false
//    @State private var goalPercent = 0.7
//    @State private var drinkGoal = Int(Double(totalDrinks) * goalPercent)
    
    var body: some View {
        
        VStack {
            
            // top bar
            HStack {
                
                // points
                VStack {
                    Text("🌟: \(points)")
                        .padding(10)
                    Text("💧: \(drops)")
                        .padding(10)
                }
                
                Spacer()
                
                // notification button
                NavigationLink(destination: Notification()) {
                    Image(systemName: "bell")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.myPurple)
                        .padding(.trailing, 30)
                }
                
                // animals button
                NavigationLink(destination: AnimalCollections()) {
                    Image(systemName: "hare")
                    .resizable()
                    .frame(width: 30, height: 30)
                        .foregroundColor(.myBlue)
                        .padding(.trailing, 20)
                }
                
                
            }
            .padding()
            .background(Color.myWhite)
            .padding(.bottom, 50)
            
            // drink
            HStack {
                
                Rectangle()
                    .frame(width: 100, height: 200)
                    .border(Color.black, width: 3)
                    .foregroundColor(Color(red: 230 / 255, green: 242 / 255, blue: 250 / 255))
                    .overlay(Rectangle().foregroundColor(.blue)
                        .frame(width: 94, height: 200 * (CGFloat(drinksDone) / CGFloat(totalDrinks))).padding(3), alignment: .bottom)
                    .padding(.leading, 50)
                
                Spacer()
                
                // drink stats for today
                VStack(alignment: .leading) {
                    
                    Text("Total: \(totalDrinks) times")
                    Text("Drank: \(drinksDone) times")
                    Text("Left: \(drinksLeft) times")
                    Button("Drink") { // debug - indicate drank
                        if drinksLeft == 1 { // don't add water for the last drink. Instead, change the water color - start flowing?
                            drinksLeft -= 1
                            
                        } else if drinksLeft != 0 {
                            drinksLeft -= 1
                            drinksDone += 1
                        }
                        if drinksDone == drinkGoal && !goalAchieved { // if reach goal
                            goalAchieved = true
                            daysAchieved += 1
                        }

                    }
                }
                .padding(.trailing, 50)
                
                
            }
            .padding()
            .padding(.bottom, 50)
            
            // past records
            VStack {
                Text("Past Records")
                    .font(.title)
                    .padding()
                
                VStack(alignment: .leading) {
                    Text("Days achieved: \(daysAchieved)")
//                    Text("Days failed: \(daysFailed)")
                    Text("Current Streak: \(streak)")
                }
                
            }
            
        }
        .frame(height: UIScreen.main.bounds.size.height, alignment: .top)
        
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
