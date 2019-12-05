//
//  File.swift
//  provaGrid
//
//  Created by Student on 01/12/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

typealias Grid = [[Character]]

/// Helper class to get a random alpha char
fileprivate class CharacterRandomizer {
    private var alphaSet = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    func randomChar() -> Character {
        return alphaSet.randomElement()!
    }
}

// Alias for a 2d-array
// with a helper function to fill out placeholders with random chars.
fileprivate extension Grid {
    func randomizePlaceHolders() -> Grid {
        var grid = self
        guard !self.isEmpty && !self[0].isEmpty else {
            return grid
        }
        let randomizer = CharacterRandomizer()
        for i in 0..<self.count {
            for j in 0..<self[0].count {
                if grid[i][j] == WordGridGenerator.placeholder {
                    grid[i][j] = randomizer.randomChar()
                }
            }
        }
        return grid
    }
}

class WordGridGenerator {
    
    var words: [String] = ["DUTFIELDS", "YARD", "GOLDSTEIN", "LEON", "MORTIMER"]
    var nRow: Int = 10
    var nCol: Int = 10
    var wordMap: [String: String] = [:]

    static let placeholder: Character = "#"
    
    init(row: Int, column: Int) {
            self.nRow = row
            self.nCol = column
        }
    
    public func generate() -> Grid? {
        
        var grid = Grid(repeating: [Character](repeating: WordGridGenerator.placeholder, count: nCol), count: nRow)
        grid = assignWord(word: words[0], grid: grid, start: Position(row: 0, col: 0), direction: "v")
        grid = assignWord(word: words[1], grid: grid, start: Position(row: 1, col: 4), direction: "h")
        grid = assignWord(word: words[2], grid: grid, start: Position(row: 1, col: 1), direction: "d")
        grid = assignWord(word: words[3], grid: grid, start: Position(row: 6, col: 0), direction: "h")
        grid = assignWord(word: words[4], grid: grid, start: Position(row: 1, col: 9), direction: "v")
        
        return grid.randomizePlaceHolders()
    }
    
    private func assignWord(word: String, grid: Grid, start: Position, direction: Character) -> Grid {
        let wordLength = word.count
        var dupGrid = grid
        var endPos: Position
        
        switch direction {
        case "v":
            endPos = Position(row: start.row + wordLength - 1, col: start.col)
            for r in 0..<(wordLength) {
                dupGrid[start.row + r][start.col] = Array(word)[r]
            }
        case "h":
            endPos = Position(row: start.row, col: start.col + wordLength - 1)
            for c in 0..<(wordLength) {
                dupGrid[start.row][start.col + c] = Array(word)[c]
            }
        case "d":
            endPos = Position(row: start.row + wordLength - 1, col: start.col + wordLength - 1)
            for d in 0..<(wordLength) {
                dupGrid[start.row + d][start.col + d] = Array(word)[d]
            }
        default:
            return dupGrid
        }
        
        addWordMap(word: word, startPos: start, endPos: endPos)
        
        return dupGrid
    }
    
    // function that is returning the starting point(rows and column) and end point(rows and columns) for each clue-words, called creating the grid
    static func wordKey(for startPos: Position, and endPos: Position) -> String {
//        print("\(startPos.row):\(startPos.col):\(endPos.row):\(endPos.col)")
        return "\(startPos.row):\(startPos.col):\(endPos.row):\(endPos.col)"
    }
    
    //funcion to put clue-words inside the grid, executed for each of the words, called creating the grid
    private func addWordMap(word: String, startPos: Position, endPos: Position) {
        wordMap[WordGridGenerator.wordKey(for: startPos, and: endPos)] = word
    }

}


