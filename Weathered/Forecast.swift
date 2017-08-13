//
//  Forecast.swift
//  Weathered
//
//  Created by Ed McCormic on 8/12/17.
//  Copyright © 2017 Swiftbeard. All rights reserved.
//

import Foundation
import SwiftyJSON

class Forecast {
    
    fileprivate var _date: String!
    fileprivate var _weatherType: String!
    fileprivate var _highTemp: Int!
    fileprivate var _lowTemp: Int!
    
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
    
    var highTemp: Int {
        get {
            return _highTemp
        } set {
            _highTemp = newValue
        }
    }
    
    var lowtemp: Int {
        get {
            return _lowTemp
        } set {
            _lowTemp = newValue
        }
    }
    
    class func loadForecastFromData(_ APIData: Data) -> [Forecast] {
        
        var forecast = [Forecast]()
        
        let json = JSON(data: APIData)
        
        if let list = json["list"].array {
            for day in list {
                let dayForecast = Forecast()
                dayForecast.highTemp = day["temp"]["max"].intValue
                dayForecast.lowtemp = day["temp"]["min"].intValue
                dayForecast.weatherType = day["weather"][0]["main"].stringValue
                
                let date = day["dt"].doubleValue
                let unixConvertedDate = Date(timeIntervalSince1970: date)
                dayForecast.date = unixConvertedDate.dayOfTheWeek()
                
                print(dayForecast.date)
                forecast.append(dayForecast)
            }
        }
        
        
        
        
        return forecast
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
