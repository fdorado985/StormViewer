//
//  ViewController.swift
//  StormViewer
//
//  Created by Juan Francisco Dorado Torres on 5/25/19.
//  Copyright © 2019 Juan Francisco Dorado Torres. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

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

// MARK: - Table View Delegates

extension ViewController {

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return pictures.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
    cell.textLabel?.text = pictures[indexPath.row]
    return cell
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
      vc.selectedImage = pictures[indexPath.row]
      navigationController?.pushViewController(vc, animated: true)
    }
  }
}
