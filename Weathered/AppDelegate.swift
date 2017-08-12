//
//  AppDelegate.swift
//  Weathered
//
//  Created by Ed McCormic on 8/11/17.
//  Copyright © 2017 Swiftbeard. All rights reserved.
//

import Cocoa


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {


    // Variables
    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        statusItem.button?.title = "--°"
        statusItem.action = #selector(AppDelegate.displayPopUp(_:))
        WeatherService.instance.downloadWeatherDetails()
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        
    }
    
    func displayPopUp(_ sender: AnyObject?) {
        
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateController(withIdentifier: "WeatherVC") as? NSViewController else { return }
        
        let popoverView = NSPopover()
        popoverView.contentViewController = vc
        popoverView.behavior = .transient
        popoverView.show(relativeTo: statusItem.button!.bounds, of: statusItem.button!, preferredEdge: .maxY)
        
    }
    


}

