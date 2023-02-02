//
//  ContentView.swift
//  week1
//
//  Created by Betty Demissie on 25/01/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var weightText: String = ""
    @State private var heightText: String = ""
    @State private var bmi: Double = 0
    @State private var classification: String = ""
    
    var body: some View
    { VStack
        {
           Image(systemName: "figure.flexibility")
                .foregroundColor(Color.pink)
            Text("BMI Calculator:").font(.largeTitle).foregroundColor(Color.pink)
    

        TextField("Enter Weight (in kg)", text: $weightText)
    .textFieldStyle(RoundedBorderTextFieldStyle())
    .border(Color.black)

        TextField("Enter Height (in meters)",text: $heightText)
    .textFieldStyle(RoundedBorderTextFieldStyle())
    .border(Color.black)
    }.padding()
        
        Button {
            let weight = Double(self.weightText)!
            let height = Double(self.heightText)!
            self.bmi = weight/(height*height)
            
            if self.bmi < 18.5 {
                self.classification = "Underweight"
            }
            else if self.bmi < 24.9 {
                self.classification = "Healthy weight"
            }
            else if self.bmi < 29.9 {
                self.classification = "Overweight"
            }
            else {
                self.classification = "Obese"
            }
        }label: {
            Text("Calculate BMI")
                .padding()
                .foregroundColor(Color(.white))
                .background(Color.blue)
        }
        Text("BMI: \(bmi, specifier: "%.2f") \(classification)")
            .font(.title)
            .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ZStack{
            Color(.black)
            ContentView().environment(\.colorScheme,.dark)
        }
    }
}
