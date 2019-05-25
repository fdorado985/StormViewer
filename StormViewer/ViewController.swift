//
//  ViewController.swift
//  StormViewer
//
//  Created by Juan Francisco Dorado Torres on 5/25/19.
//  Copyright © 2019 Juan Francisco Dorado Torres. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  // MARK: - Public Properties

  var pictures = [String]()

  // MARK: - View cycle

  override func viewDidLoad() {
    super.viewDidLoad()

    let fm = FileManager.default // This let us work with the filesystem that we will be using to look for files.
    let path = Bundle.main.resourcePath! // This sets the resource path of our app's bundle. "Tell me where I can find all those images I added to my app."
    let items = try! fm.contentsOfDirectory(atPath: path) // This give us a collection of all the contents of the directory at a path.

    // Iterate through each item in our collection
    for item in items {
      if item.hasPrefix("nssl") { // Look just for those who starts with 'nssl' - our images.
        pictures.append(item) // Add the item to our pictures property
      }
    }

    print(pictures)
  }
}
