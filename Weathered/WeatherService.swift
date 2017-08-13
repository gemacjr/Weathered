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
    
    var currentWeather: CurrentWeather {
        get {
            return _currentWeather
        } set {
            _currentWeather = newValue
        }
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        
        guard let url = URL(string: API_URL_CURRENT_WEATHER) else { return }
        
        Alamofire.request(url).responseData { (response) in
            
            guard let data = response.data else { return }
            
            self.currentWeather = CurrentWeather.loadCurrentWeatherFromData(data)
            
            
            completed()
            
            
        }
    }
    
    func downloadForecast (completed: @escaping DownloadComplete) {
        let url = URL(string: API_URL_FORECAST)
        Alamofire.request(url!).responseData { (response) in
            Forecast.loadForecastFromData(response.data!)
            completed()
        }
    }
}
