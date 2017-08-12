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
    
    
    func downloadWeatherDetails() {
        
        guard let url = URL(string: API_URL_CURRENT_WEATHER) else { return }
        
        Alamofire.request(url).responseData { (response) in
            
            
        }
    }
}
