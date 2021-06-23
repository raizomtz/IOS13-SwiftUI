//
//  Model.swift
//  MVVM_Wheater
//
//  Created by Alonso Martinez on 14/04/21.
//

import Foundation

//DATA

//Codable es usado para convertir un JSon
struct weatherModel: Codable {
    let timezone: String
    let current: currentWeather
}

//se crea un sub-modelo
struct currentWeather:Codable {
    
    let temp: Float
    let weather: [wheatherInfo]
}

//se crea otro sub-modelo

struct wheatherInfo: Codable {
    let main: String
    let description: String
}

