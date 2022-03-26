//
//  ContentView.swift
//  WeSplit
//
//  Created by Navneeth Prasanth on 25/03/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var CheckAmount = 0.0
    @State private var People = 2
    @State private var TipPercentage = 20
    @FocusState private var AmountisFocused: Bool
    
    let Tip = [10 , 15 ,20 , 25 ,0]
    
    var totalPerPerson :Double{
        let numberOfPeople = Double(People + 2)
        let tipSelection = Double(TipPercentage)
        
        let tipValue = CheckAmount / 100 * tipSelection
        let totalAmount = CheckAmount + tipValue
        let total = totalAmount / numberOfPeople
        
        return total
    }
    
    var totalAmount :Double{
        let numberOfPeople = Double(People + 2)
        let tipSelection = Double(TipPercentage)
        
        let tipValue = CheckAmount / 100 * tipSelection
        let totalAmount = CheckAmount + tipValue
        
        return totalAmount
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Amount" , value: $CheckAmount , format:
                        .currency(code:Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($AmountisFocused)
                    
                    Picker("Number of People", selection: $People)
                    {
                        ForEach(2..<100){
                            Text("\($0) people ")
                        }
                    }
                }
                
                Section{
                    Picker("Tip", selection: $TipPercentage){
                        ForEach(Tip , id: \.self){
                            Text($0 , format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }header:{
                    Text("How much tip do you want to leave?")
                    }
                
                Section{
                    Text(totalAmount , format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }
            header:{
                Text("Total Amount")
            }
                
                Section{
                    Text(totalPerPerson , format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }
            header:{
                    Text("Amount Per Person")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard){
                Spacer()
                
                Button("Done"){
                    AmountisFocused = false
                }
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
