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
			let directoryPath = NSBundle.mainBundle().pathForResource( "Help", ofType: "")!
			var	filenames = try NSFileManager.defaultManager().contentsOfDirectoryAtPath(directoryPath)
			filenames = filenames.sort()
			for filename in filenames
			{
				let filePath = NSString(string: directoryPath).stringByAppendingPathComponent(filename)
				let rtfVC = RTFViewController( filePath: filePath )
				rtfVC!.title = NSString(string:filename).stringByDeletingPathExtension
				let	fileImage = NSWorkspace.sharedWorkspace().iconForFile( filePath )
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
