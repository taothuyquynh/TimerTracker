//
//  stateSegmentedControl.swift
//  TimeTracker
//

import UIKit

class StateSegmentedControl: UISegmentedControl {
  override open func layoutSubviews() {
    super.layoutSubviews()
    layer.cornerRadius = self.bounds.size.height / 2.0
    self.backgroundColor = hexStringToUIColor(hex: "F6F9F9")
  }
}
