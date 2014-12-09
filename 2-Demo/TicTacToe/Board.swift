//
//  Board.swift
//  TicTacToe
//
//  Created by Matt Galloway on 15/11/2014.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import UIKit

protocol BoardDelegate {
}

class Board: UIView {

  var delegate: BoardDelegate?

  private var cellWidth: CGFloat {
    return CGRectGetWidth(self.bounds) / 3.0
  }

  private var cellHeight: CGFloat {
    return CGRectGetHeight(self.bounds) / 3.0
  }

  override func drawRect(rect: CGRect) {
    let width = CGRectGetWidth(self.bounds)
    let height = CGRectGetHeight(self.bounds)

    // Draw background
    UIColor.whiteColor().setFill()
    UIRectFill(self.bounds)

    // Draw lines
    UIColor.blackColor().setFill()
    UIRectFill(CGRectMake(self.cellWidth, 0, 1, height))
    UIRectFill(CGRectMake(self.cellWidth * 2, 0, 1, height))
    UIRectFill(CGRectMake(0, self.cellHeight, width, 1))
    UIRectFill(CGRectMake(0, self.cellHeight * 2, width, 1))
  }

  /*
  private func drawPlayer(player: Player, atPosition position: Position) {
    var image: NSString
    switch player {
    case .X:
      image = "X"
    case .O:
      image = "O"
    }

    if let image = UIImage(named: image) {
      let point = CGPointMake(
        (CGFloat(position.column) + 0.5) * self.cellWidth - image.size.width / 2.0,
        (CGFloat(position.row) + 0.5) * self.cellHeight - image.size.height / 2.0)

      image.drawAtPoint(point)
    }
  }

  override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
    let width = CGRectGetWidth(self.bounds)
    let eachWidth = width / 3.0

    let height = CGRectGetHeight(self.bounds)
    let eachHeight = height / 3.0

    for touch in touches {
      let touch = touch as UITouch

      let position = touch.locationInView(self)
      let col = Int(floor(position.x / eachWidth))
      let row = Int(floor(position.y / eachHeight))
      self.delegate?.board(self, didPressPosition: Position(column: col, row: row))
    }
  }
  */

}
