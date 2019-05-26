//
//  DetailViewController.swift
//  StormViewer
//
//  Created by Juan Francisco Dorado Torres on 5/26/19.
//  Copyright © 2019 Juan Francisco Dorado Torres. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

  // MARK: - Outlets

  @IBOutlet var imageView: UIImageView!

  // MARK: - Public properties

  var selectedImage: String?

  // MARK: - View cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()

    if let imageToLoad = selectedImage {
      imageView.image = UIImage(named: imageToLoad)
    }
  }
}
