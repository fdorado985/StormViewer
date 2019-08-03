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

  var pictures = [Picture]()

  // MARK: - View cycle

  override func viewDidLoad() {
    super.viewDidLoad()

    navigationController?.navigationBar.prefersLargeTitles = true // This allows largeTitles on this controller and next controllers
    title = "Storm Viewer" // Gives the title to the navigation view
    load()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    self.tableView.reloadData()
  }

  // MARK: - Methods

  func save() {
    let jsonEncoder = JSONEncoder()
    if let savedData = try? jsonEncoder.encode(pictures) {
      let defaults = UserDefaults.standard
      defaults.set(savedData, forKey: "pictures")
    } else {
      print("Failed to save pictures.")
    }
  }

  func load() {
    let defaults = UserDefaults.standard
    if let savedPeople = defaults.object(forKey: "pictures") as? Data {
      let jsonDecoder = JSONDecoder()
      do {
        pictures = try jsonDecoder.decode([Picture].self, from: savedPeople)
        if pictures.isEmpty {
          loadDataFromBundle()
        }
      } catch {
        print("Failed to load pictures")
      }
    } else {
      loadDataFromBundle()
    }
  }

  func loadDataFromBundle() {
    let fm = FileManager.default // This let us work with the filesystem that we will be using to look for files.
    let path = Bundle.main.resourcePath! // This sets the resource path of our app's bundle. "Tell me where I can find all those images I added to my app."
    let items = try! fm.contentsOfDirectory(atPath: path) // This give us a collection of all the contents of the directory at a path.

    // Iterate through each item in our collection
    for item in items {
      if item.hasPrefix("nssl") { // Look just for those who starts with 'nssl' - our images.
        let picture = Picture(name: item) // Create the picture object
        pictures.append(picture) // Add the picture to our pictures property
      }
    }

    print(pictures)
    save()
  }
}

// MARK: - Table View Delegates

extension ViewController {

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return pictures.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
    let picture = pictures[indexPath.row]
    cell.textLabel?.text = picture.name
    cell.detailTextLabel?.text = "Views: \(picture.numOfViews)"
    return cell
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
      vc.selectedImage = pictures[indexPath.row].name
      pictures[indexPath.row].increseView()
      save()
      navigationController?.pushViewController(vc, animated: true)
    }
  }
}
