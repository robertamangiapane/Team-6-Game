//
//  OverLay.swift
//  provaGrid
//
//  Created by Student on 01/12/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation
import UIKit

class OverLay: UIView {
    var tempLine: Line?
    var permanentLines: [Line] = []

    
    /// Row and col should be set externally by the game configurator
    var row: Int = 0
    var col: Int = 0
    
    /// Should be set externally for future positions computation
    var cellSize: CGSize {
        let w = bounds.width / CGFloat(col)
        let h = bounds.height / CGFloat(row)
        return CGSize(width: w, height: h)
    }
    
    /// We define styles for temp lines and permanent lines
    lazy private var selectingStyle: LineStyle = LineStyle(
        opacity: 0.5,
        lineWidth: min(cellSize.width, cellSize.height) * 0.8,
        strokeColor: UIColor.blue.cgColor
    )
    
    lazy private var selectedStyle: LineStyle = LineStyle(
        opacity: 0.5,
        lineWidth: min(cellSize.width, cellSize.height) * 0.8,
        strokeColor:
        UIColor.orange.cgColor
    )
    
    func addTempLine(at position: Position) {
        tempLine = Line(style: selectingStyle)
        tempLine?.cellSize = cellSize
        tempLine?.startPos = position
        tempLine?.endPos = position
    }
    
    /// Draw the line from start position to end position
    /// if it's valid.
    ///
    /// - Parameter position: target end position
    /// - Returns: true if the line should be updated/drawn.
    func moveTempLine(to position: Position) -> Bool {
        if tempLine?.attempt(endPos: position) == true {
            tempLine?.draw(on: self)
            return true
        }
        return false
    }
    
    func removeTempLine() {
        self.tempLine?.clear()
        self.tempLine = nil
    }
    
    /// User has selected a corrected word, convert to a permanent line
    func acceptLastLine() {
//        print(tempLine)
        if let permLine = tempLine {
            permLine.lineStyle = selectedStyle
            permanentLines.append(permLine)
            setNeedsDisplay()
        }
    }
    
    /// Draw function of a UIView object.
    /// This is called when a line changes
    /// Or even orientation changes and the content
    /// mode is et to `Redraw`.
    ///
    /// - Parameter rect: rect
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        tempLine?.cellSize = cellSize
        tempLine?.draw(on: self)
        for line in permanentLines {
            line.cellSize = cellSize
            line.draw(on: self)
        }
    }
}
