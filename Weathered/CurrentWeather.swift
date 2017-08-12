//
//  CurrentWeather.swift
//  Weathered
//
//  Created by Ed McCormic on 8/12/17.
//  Copyright © 2017 Swiftbeard. All rights reserved.
//

import Foundation

class CurrentWeather {
    
    fileprivate var _cityName: String!
    fileprivate var _date: String!
    fileprivate var _weatherType: String!
    fileprivate var _currentTemp: Int!
    
    var cityName: String {
        get {
            return _cityName
        } set {
            _cityName = newValue
        }
    }
    
    var date: String {
        get {
            return _date
        } set {
            _date = newValue
        }
    }
    
    var weatherType: String {
        get {
            return _weatherType
        } set {
            _weatherType = newValue
        }
    }
    
    var currentTemp: Int {
        get {
            return _currentTemp
        } set {
            _currentTemp = newValue
        }
    }
    
    class func loadCurrentWeatherFromData(_ APIData: Data) -> CurrentWeather {
        
        let currentWeather = CurrentWeather()
        
        
        
        return currentWeather
    }
    
}
