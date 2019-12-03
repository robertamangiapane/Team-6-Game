//
//  Challenge3ViewController.swift
//  JackTheRipper
//
//  Created by Student on 30/11/2019.
//  Copyright © 2019 Team6. All rights reserved.
//

//import Foundation
import UIKit

class Challenge3ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var overlayView: OverLay!
    
    @IBOutlet weak var gridCollectionView: UICollectionView!
    
    @IBOutlet weak var gameResult: UIButton!
    
    fileprivate let nRow = 10
    fileprivate let nCol = 10
    
    fileprivate var grid: Grid = Grid()

    lazy private var gradientLayer: CAGradientLayer = CAGradientLayer()
    lazy fileprivate var gridGenerator: WordGridGenerator = {
        return WordGridGenerator(row: nRow, column: nCol)
    }()
    var wordsFound: [String] = []

    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        // Because there's no layout constraint for a CALayer.
        gradientLayer.frame = gridCollectionView.bounds
    }
    
    override func viewDidLoad() {
        gameResult.setTitle("You found all the clues", for: .normal)
        gameResult.isHidden = true

        super.viewDidLoad()
        setupGridCollectionView()
        setupOverlayView()
        loadGame()
        

        // Do any additional setup after loading the view.
    }
    
    private func setupOverlayView() {
        overlayView.row = nRow
        overlayView.col = nCol
    }
    
    //calculate gridcollectionview width and height and divide it for cell, to have cell size
    private var cellSize: CGSize {
        let w = gridCollectionView.bounds.width / CGFloat(nCol)
        let h = gridCollectionView.bounds.height / CGFloat(nRow)
        return CGSize(width: w, height: h)
    }
    
    private func loadGame() {
        //async is needed for correctly handle gesture otherwise first cell will breack action #selector of the UIPanGestureRecognizer
        DispatchQueue.global().async {
            if let grid = self.gridGenerator.generate() {
            self.grid = grid
            }
                DispatchQueue.main.async {
                    self.gridCollectionView.reloadData()
                }
            }
        }
    
    //set up PanGesture
    private func setupGridCollectionView() {
        
        // Setup pan gesture
         let panGR = UIPanGestureRecognizer(target: self, action: #selector(panHandling(gestureRecognizer:)))
          gridCollectionView.addGestureRecognizer(panGR)

    }
    
    private func position(from index: Int) -> Position {
        return Position(row: index / nRow, col: index % nCol)
    }
    
    private func checkWordFound() -> Bool {
        if Set(wordsFound) == Set(gridGenerator.words) {
            return true
        } else {
            return false
        }
    }
    
    @objc func panHandling(gestureRecognizer: UIPanGestureRecognizer) {
        let point = gestureRecognizer.location(in: gridCollectionView)
        
        guard let indexPath = gridCollectionView.indexPathForItem(at: point) else {
            return
        }
        let pos = position(from: indexPath.row)
        
        switch gestureRecognizer.state {
        case .began:
            overlayView.addTempLine(at: pos)

            // Select item to animate the cell
            // Since we set the collection view `selection mode` to single
            // This means only one letter is animated at a time.
            // So in `.ended` event, we just need to deselect one cell.
            gridCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)

        case .changed:
            if overlayView.moveTempLine(to: pos) {
                gridCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
            }

        case .ended:
            // Stop animation
            gridCollectionView.deselectItem(at: indexPath, animated: true)
            guard let startPos = overlayView.tempLine?.startPos else {
                return
            }
//
//            // Get the word from the pre-computed map
            let key = WordGridGenerator.wordKey(for: startPos, and: pos)

            if let word = gridGenerator.wordMap[key] {
                overlayView.acceptLastLine()
                
                //check if the player found all the word. end the game
                wordsFound.append(word)
                
                if checkWordFound() == true {

                    gameResult.isHidden = false
                }
            }

//            // Remove the temp line
            overlayView.removeTempLine()
        default: break
        }
    }
    
    //this function count number of item, to set number of cells in the view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return grid.count * (grid.first?.count ?? 0)

    }
    
    //this function use the cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize

    }
    
    //this function write in the cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.cellId, for: indexPath as IndexPath) as! MyCollectionViewCell

        let pos = position(from: indexPath.row)

        cell.cellLabel.text = String(grid[pos.row][pos.col])
        cell.backgroundColor = UIColor.black
        
        
        return cell
    }
}
