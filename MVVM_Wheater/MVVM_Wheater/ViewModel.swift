//
//  ViewModel.swift
//  MVVM_Wheater
//
//  Created by Alonso Martinez on 14/04/21.
//

import Foundation


//DATA NEEDED BY DE VIEW

class wheaterViewModel: ObservableObject{
    
    //@Published - cada objeto (UI) ligado a estas variables se actualiza cada vez que la informacion de estas variables cambia
    
    @Published var title: String = "_"
    @Published var descriptionText: String = "_"
    @Published var temp: String = "_"
    @Published var timezone: String = "_"

    
    //haciendo llamado a la API
    init() {
        fetchWeather()
    }
    
    func fetchWeather(){
        
        //la URL de la API que nos da el clima
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?exclude=hourly,daily,minutely&lat=20.5880600&lon=-100.3880600&units=metric&appid=dace773db4c5a32fdf2dd059dd5bcc23")else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data =  data, error == nil else {
                
                return
            }
            
            //conver DATA to model
            
            do{
                let model = try JSONDecoder().decode(weatherModel.self, from: data)
                
                DispatchQueue.main.async {
                    self.title = model.current.weather.first?.main ?? "No title"
                    self.descriptionText = model.current.weather.first?.main ?? "No description"
                    self.temp = "\(model.current.temp)º"
                    self.timezone = model.timezone
                    
                }
              }
            catch{
                print("Failed")
            }
          }
          task.resume()
       }
    }
