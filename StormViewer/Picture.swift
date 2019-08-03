//
//  Picture.swift
//  StormViewer
//
//  Created by Juan Francisco Dorado Torres on 8/2/19.
//  Copyright © 2019 Juan Francisco Dorado Torres. All rights reserved.
//

import Foundation

class Picture: NSObject, Codable {

  // MARK: - Properties

  private(set) var name: String
  private(set) var numOfViews: Int

  // MARK: - Lifecycle

  init(name: String, numOfViews: Int = 0) {
    self.name = name
    self.numOfViews = numOfViews
  }

  // MARK: - Methods

  func increseView() {
    self.numOfViews += 1
  }
}
