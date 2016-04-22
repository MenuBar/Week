//
//  AppDelegate.swift
//  Week
//
//  Created by Thomas Paul Mann on 22.04.16.
//  Copyright © 2016 Thomas Paul Mann. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let hour = 3600.0
    let menu = NSMenu()
    var weekStatusItem: NSStatusItem?

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        weekStatusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength)

        initMenu()

        NSTimer.scheduledTimerWithTimeInterval(hour, target: self, selector: #selector(update), userInfo: nil, repeats: true)

        update()
    }

    func update() {
        let calendar = NSCalendar.currentCalendar().components(.WeekOfYear, fromDate: NSDate())
        weekStatusItem?.title = "🗓\(calendar.weekOfYear)"
    }

    private func initMenu() {
        if let statusItem = weekStatusItem {
            // Add Menu
            statusItem.menu = menu

            // Add Menu Item for Quiting
            let quitMenuItem = NSMenuItem()
            quitMenuItem.title = "Quit"
            quitMenuItem.target = self
            quitMenuItem.action = #selector(quit)
            menu.addItem(quitMenuItem)
        }
    }


    func quit() {
        NSApplication.sharedApplication().terminate(self)
    }

}

