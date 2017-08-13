//
//  WeatherVC.swift
//  Weathered
//
//  Created by Ed McCormic on 8/11/17.
//  Copyright © 2017 Swiftbeard. All rights reserved.
//

import Cocoa


class WeatherVC: NSViewController {

    @IBOutlet weak var dateLabel: NSTextField!
    @IBOutlet weak var tempLabel: NSTextField!
    @IBOutlet weak var locationLabel: NSTextField!
    @IBOutlet weak var weatherImage: NSImageView!
    @IBOutlet weak var weatherConditionLabel: NSTextField!
    
    @IBOutlet weak var collectionView: NSCollectionView!
    
    @IBOutlet weak var poweredByButton: NSButton!
    @IBOutlet weak var quitButton: NSButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        updateUI()
    }
    
    @IBAction func poweredByBtnClicked(_ sender: Any) {
        
        guard let url = URL(string: API_HOMEPAGE) else { return }
        
        NSWorkspace.shared().open(url)
    }
    
    @IBAction func quitBtnClicked(_ sender: Any) {
        NSApplication.shared().terminate(nil)
    }
    
    override func viewDidAppear() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(WeatherVC.dataDownloadedNotif(_:)), name: NOTIF_DOWNLOAD_COMPLETE, object: nil)
        self.view.layer?.backgroundColor = CGColor(red: 0.29, green: 0.72, blue: 0.98, alpha: 1.0)
        quitButton.styleButtonText(button: quitButton, buttonName: "Quit", fontColor: .darkGray, alignment: .center, font: "Avenir Next", size: 11)
        poweredByButton.styleButtonText(button: poweredByButton, buttonName: "Powered by OpenWeathermap", fontColor: .darkGray, alignment: .center, font: "Avenir Next", size: 11)
        
    }
    
    override func viewDidDisappear() {
        NotificationCenter.default.removeObserver(self, name: NOTIF_DOWNLOAD_COMPLETE, object: nil)
    }
    
    func dataDownloadedNotif(_ notif: Notification){
        updateUI()
    }

    func updateUI() {
        
        let weather = WeatherService.instance.currentWeather
        
        dateLabel.stringValue = weather.date
        tempLabel.stringValue = "\(weather.currentTemp)°"
        locationLabel.stringValue = weather.cityName
        weatherConditionLabel.stringValue = weather.weatherType
        weatherImage.image = NSImage(named: weather.weatherType)
        collectionView.reloadData()
    }


}

extension WeatherVC: NSCollectionViewDelegate, NSCollectionViewDataSource, NSCollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        
        
        let forecastItem = collectionView.makeItem(withIdentifier: "WeatherCell", for: indexPath)
        
        guard let forecastCell = forecastItem as? WeatherCell else { return  forecastItem }
        
        forecastCell.configureCell(weatherCell: WeatherService.instance.forecast[indexPath.item])
        
        return forecastCell
    }
    
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return WeatherService.instance.forecast.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        
        return NSSize(width: 125, height: 125)
    }
}
