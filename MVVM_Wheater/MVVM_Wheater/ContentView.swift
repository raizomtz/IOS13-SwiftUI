//
//  ContentView.swift
//  MVVM_Wheater
//
//  Created by Alonso Martinez on 14/04/21.
//

import SwiftUI

struct ContentView: View {
    
    //se crea una instancia de wheaterViewModel
    @StateObject var viewModel = wheaterViewModel()
    
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                //mandamos llamar las "properties" de viewModel
                Text(viewModel.timezone).font(.system(size: 32))
                Text(viewModel.temp).font(.system(size: 44))
                Text(viewModel.title).font(.system(size: 24))
                Text(viewModel.descriptionText).font(.system(size: 24))
                
            }.navigationTitle("Weather MVVM")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            
    }
}
