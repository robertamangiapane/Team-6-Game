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
    var score: Int? = nil
    var name: String? = nil
    var game : Game?
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    
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
        
        game = Game()
        game?.title = name ?? "Error"
        game?.score = score ?? 0
        scoreLabel.text = "Score: \(game?.score ?? 0)"
        titleLabel.text = "\(game?.title ?? "Error")"
        
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
        
        print("panGR")
        print(panGR)

    }
    
    // calculate index position to create cells for the grid, called creatin grids
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
        print("inside panhandling")
        
        guard let indexPath = gridCollectionView.indexPathForItem(at: point) else {
            print("indexPath")
//            gridCollectionView.deselectItem(at: indexPath, animated: true)
            overlayView.removeTempLine()
            return
        }
        let pos = position(from: indexPath.row)
        print("before switch case")
        print(gestureRecognizer)
        
        switch gestureRecognizer.state {
        case .began:
            print("inside switch case began")
            overlayView.addTempLine(at: pos)
            gridCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)

        case .changed:
            if overlayView.moveTempLine(to: pos) {
                gridCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
                print("switch case changed")
            }

        case .ended:
            // Stop animation
            gridCollectionView.deselectItem(at: indexPath, animated: true)
            print("inside case ended before guard let")
            print("startPos")
            guard let startPos = overlayView.tempLine?.startPos else {
                print("inside case ended after guard let")
                return
            }
//
//            // Get the word from the pre-computed map
            let key = WordGridGenerator.wordKey(for: startPos, and: pos)

            if let word = gridGenerator.wordMap[key] {
                print("inside view controller function panhandling if let word")
                overlayView.acceptLastLine()
                
                //check if the player found all the word. end the game
                wordsFound.append(word)
                
                if checkWordFound() == true {
                    gameResult.isHidden = false
                }
            }

//            // Remove the temp line
            print("inside case ended after checkWordFound")
            overlayView.removeTempLine()
        default:
            print("inside default")
            gridCollectionView.deselectItem(at: indexPath, animated: true)
            overlayView.removeTempLine()
            break

        }
        print("after switch case")
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let Congrats3ViewController = segue.destination as? Congrats3ViewController {
            Congrats3ViewController.score = game?.score;
            Congrats3ViewController.name = game?.title
        }
    }
}
