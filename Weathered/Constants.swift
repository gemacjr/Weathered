//
//  Constants.swift
//  Weathered
//
//  Created by Ed McCormic on 8/11/17.
//  Copyright © 2017 Swiftbeard. All rights reserved.
//

import Foundation

typealias DownloadComplete = () -> ()

let API_HOMEPAGE = "http://openweathermap.org"
let NOTIF_DOWNLOAD_COMPLETE = NSNotification.Name("dataDownloaded")
let API_KEY = "&appid=f9bb59c073915b22aa6f1372d6ef240a"
let API_UNITS = "&units=imperial"
let API_URL_CURRENT_WEATHER = "http://api.openweathermap.org/data/2.5/weather?lat=39.8131&lon=-105.1257\(API_UNITS)\(API_KEY)"
let API_URL_FORECAST = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=39.8131&lon=-105.1257&cnt=8\(API_UNITS)\(API_KEY)"




