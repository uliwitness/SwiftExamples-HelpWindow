//
//  AppDelegate.swift
//  HelpWindow
//
//  Created by Uli Kusterer on 01/05/16.
//  Copyright © 2016 Uli Kusterer. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

	@IBOutlet weak var window: NSWindow!
	var helpWindow : HelpWindowController?

	func applicationDidFinishLaunching( _ aNotification: Notification) {
		helpWindow = HelpWindowController( viewControllers: [] )
		helpWindow!.showWindow( self )
	}

	func applicationWillTerminate( _ aNotification: Notification) {
		// Insert code here to tear down your application
	}


}

