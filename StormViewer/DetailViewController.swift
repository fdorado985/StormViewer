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

  // MARK: - Computed Properties

  override var prefersHomeIndicatorAutoHidden: Bool {
    return navigationController?.hidesBarsOnTap ?? false
  }

  // MARK: - View cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()

    navigationItem.largeTitleDisplayMode = .never // This avoids large titles on this controller

    title = selectedImage
    
    if let imageToLoad = selectedImage {
      imageView.image = UIImage(named: imageToLoad)
    }
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.hidesBarsOnTap = true
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.hidesBarsOnTap = false
  }
}
