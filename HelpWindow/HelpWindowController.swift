//
//  HelpWindowController.swift
//  HelpWindow
//
//  Created by Uli Kusterer on 01/05/16.
//  Copyright © 2016 Uli Kusterer. All rights reserved.
//

import Cocoa

class HelpWindowController: MasterDetailSourceListWindowController {

    override func windowDidLoad() {
		
		do {
			let directoryPath = Bundle.main.path( forResource: "Help", ofType: "")!
			var	filenames = try FileManager.default.contentsOfDirectory( atPath: directoryPath )
			filenames = filenames.sorted()
			for filename in filenames
			{
				let filePath = NSString(string: directoryPath).appendingPathComponent(filename)
				let rtfVC = RTFViewController( filePath: filePath )
				rtfVC!.title = NSString(string:filename).deletingPathExtension
				let	fileImage = NSWorkspace.shared.icon( forFile: filePath )
				self.viewControllers.append( MasterSourceListItem( viewController: rtfVC!, image: fileImage ) )
			}
		}
		catch
		{
			print("Error!")
		}
		
		super.windowDidLoad()
    }
	
}
