//
//  WeatherService.swift
//  Weathered
//
//  Created by Ed McCormic on 8/11/17.
//  Copyright © 2017 Swiftbeard. All rights reserved.
//

import Foundation
import Alamofire

class WeatherService {
    
    static let instance = WeatherService()
    fileprivate var _currentWeather = CurrentWeather()
    fileprivate var _forecast = [Forecast]()
    
    var currentWeather: CurrentWeather {
        get {
            return _currentWeather
        } set {
            _currentWeather = newValue
        }
    }
    
    var forecast: [Forecast] {
        get {
            return _forecast
        } set {
            _forecast = newValue
        }
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        
        guard let url = URL(string: API_URL_CURRENT_WEATHER) else { return }
        
        Alamofire.request(url).responseData { (response) in
            
            guard let data = response.data else { return }
            
            self.currentWeather = CurrentWeather.loadCurrentWeatherFromData(data)
            
            print("The data", data)
            
            completed()
            
            
        }
    }
    
    func downloadForecast (completed: @escaping DownloadComplete) {
        let url = URL(string: API_URL_FORECAST)
        Alamofire.request(url!).responseData { (response) in
            self.forecast = Forecast.loadForecastFromData(response.data!)
            
            if self.forecast.count > 0 {
                self.forecast.remove(at: 0)
            }
            
            completed()
        }
    }
}
