//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Spencer Shortt on 8/28/19.
//  Copyright © 2019 Spencer Shortt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var player_turn = 1 // X=1, O=2
    
    var squareState = Array(repeating: 0, count: 81)
    
    var gameState = Array(repeating: 0, count: 9)

    var currentBoard = -1
    
    
    
    @IBOutlet weak var board1: UIImageView!
    @IBOutlet weak var board2: UIImageView!
    @IBOutlet weak var board3: UIImageView!
    @IBOutlet weak var board4: UIImageView!
    @IBOutlet weak var board5: UIImageView!
    @IBOutlet weak var board6: UIImageView!
    @IBOutlet weak var board7: UIImageView!
    @IBOutlet weak var board8: UIImageView!
    @IBOutlet weak var board9: UIImageView!
    
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var CurrentBoardLabel: UILabel!
    
    @IBOutlet weak var turnLabel: UILabel!
    
    
    
    
    @IBAction func Action(_ sender: UIButton) {
        
        if (squareState[sender.tag] == 0) && validMove(sender.tag, currentBoard)
        {
            
            
            if (player_turn == 1){
                sender.setImage(UIImage(named: "x.png"), for: UIControl.State())
                squareState[sender.tag] = 1
                player_turn = 2
                
                turnLabel.text = " O's Turn"
                
                
                if (currentBoard == -1){
                    currentBoard = sender.tag / 9
                }
                    
                
                
                if (isBoardWon(currentBoard, squareState) == 1){
                    for n in 0...8{
                        //Takes all the sqaures of the won board out the game
                        squareState[n + 9*currentBoard] = 1
                        
                        gameState[currentBoard] = 1
                        
                        
                        
                        //Fix the image
                        changeBoardImage_X(currentBoard)
                        
                    }
                }
                
            }
            else{
                sender.setImage(UIImage(named: "o.png"), for: UIControl.State())
                squareState[sender.tag] = 2
                player_turn = 1
                turnLabel.text = " X's Turn"
                
                if (currentBoard == -1){
                    currentBoard = sender.tag / 9
                }
                
                if (isBoardWon(currentBoard, squareState) == 2){
                    for n in 0...8{
                        //Takes all the sqaures of the won board out the game
                        squareState[n + 9*currentBoard] = 2
                        
                        gameState[currentBoard] = 2
                        
                        //Fix the image
                        changeBoardImage_O(currentBoard)
                        
                    }
                }
            }
            
            if (isGameOver(gameState) == 1){
                CurrentBoardLabel.text = "THANKS FOR PLAYING!"
                winnerLabel.text = "CONGRATULATIONS, X WINS!!!"
            }
            if (isGameOver(gameState) == 2){
                CurrentBoardLabel.text = "THANKS FOR PLAYING!"
                winnerLabel.text = "CONGRATULATIONS, O WINS!!!"
            }
            
            
            
            
            if (gameState[getNextBoard(sender.tag)] == 1) || (gameState[getNextBoard(sender.tag)] == 2){
                currentBoard = -1
                CurrentBoardLabel.text = "Pick any open square!"
            }
            
            else{
            currentBoard = getNextBoard(sender.tag)
            CurrentBoardLabel.text = "Current Board = \(currentBoard+1)"
            }
        }
    }
    
    func getNextBoard(_ square: Int) -> Int{
        for n in 0...8{
            if ([0+n,9+n,18+n,27+n,36+n,45+n,54+n,63+n,72+n].contains(square)){
                return n
            }
        }
        return -1
    }
    
    func validMove(_ move: Int , _ board: Int) -> Bool{
        
        if (currentBoard == -1){
            return true
        }
        
        
        else if ([0+9*board,1+9*board,2+9*board,3+9*board,4+9*board,5+9*board,6+9*board,7+9*board,8+9*board].contains(move)){
            return true
        }
        return false
    }
    
    func isBoardWon(_ board: Int, _ status: [Int]) -> Int{
        
        
        //Look at values for this board
        let boardStatus = Array(status[9*board..<(9+9*board)])
        //Check Rows:
        if (boardStatus[0] == boardStatus[1]) && (boardStatus[1] == boardStatus[2]) && (boardStatus[0] != 0) {
            return boardStatus[0]
        }
        else if (boardStatus[3] == boardStatus[4]) && (boardStatus[4] == boardStatus[5]) && (boardStatus[3] != 0) {
            return boardStatus[3]
        }
        else if (boardStatus[6] == boardStatus[7]) && (boardStatus[7] == boardStatus[8]) && (boardStatus[6] != 0) {
            return boardStatus[6]
        }
            //Check Columns
        else if (boardStatus[0] == boardStatus[3]) && (boardStatus[3] == boardStatus[6]) && (boardStatus[0] != 0) {
            return boardStatus[0]
        }
        else if (boardStatus[1] == boardStatus[4]) && (boardStatus[4] == boardStatus[7]) && (boardStatus[1] != 0) {
            return boardStatus[1]
        }
        else if (boardStatus[2] == boardStatus[5]) && (boardStatus[5] == boardStatus[8]) && (boardStatus[2] != 0) {
            return boardStatus[2]
        }
            //Check Diagonals
        else if (boardStatus[0] == boardStatus[4]) && (boardStatus[4] == boardStatus[8]) && (boardStatus[0] != 0) {
            return boardStatus[0]
        }
        else if (boardStatus[2] == boardStatus[4]) && (boardStatus[4] == boardStatus[6]) && (boardStatus[2] != 0) {
            return boardStatus[2]
        }
        else{
            return 0
            
        }
        
    }
    
    func changeBoardImage_X(_ board: Int){
        if (board == 0){
            board1.image = UIImage(named: "x2.png")
        }
        else if (board == 1){
            board2.image = UIImage(named: "x2.png")
        }
        else if (board == 2){
            board3.image = UIImage(named: "x2.png")
        }
        else if (board == 3){
            board4.image = UIImage(named: "x2.png")
        }
        else if (board == 4){
            board5.image = UIImage(named: "x2.png")
        }
        else if (board == 5){
            board6.image = UIImage(named: "x2.png")
        }
        else if (board == 6){
            board7.image = UIImage(named: "x2.png")
        }
        else if (board == 7){
            board8.image = UIImage(named: "x2.png")
        }
        else{
            board9.image = UIImage(named: "x2.png")
        }
    }
    func changeBoardImage_O(_ board: Int){
        if (board == 0){
            board1.image = UIImage(named: "o2.png")
        }
        else if (board == 1){
            board2.image = UIImage(named: "o2.png")
        }
        else if (board == 2){
            board3.image = UIImage(named: "o2.png")
        }
        else if (board == 3){
            board4.image = UIImage(named: "o2.png")
        }
        else if (board == 4){
            board5.image = UIImage(named: "o2.png")
        }
        else if (board == 5){
            board6.image = UIImage(named: "o2.png")
        }
        else if (board == 6){
            board7.image = UIImage(named: "o2.png")
        }
        else if (board == 7){
            board8.image = UIImage(named: "o2.png")
        }
        else{
            board9.image = UIImage(named: "o2.png")
        }
    }
    
    func isGameOver(_ boardStatus:[Int]) -> Int{
        if (boardStatus[0] == boardStatus[1]) && (boardStatus[1] == boardStatus[2]) && (boardStatus[0] != 0) {
            return boardStatus[0]
        }
        else if (boardStatus[3] == boardStatus[4]) && (boardStatus[4] == boardStatus[5]) && (boardStatus[3] != 0) {
            return boardStatus[3]
        }
        else if (boardStatus[6] == boardStatus[7]) && (boardStatus[7] == boardStatus[8]) && (boardStatus[6] != 0) {
            return boardStatus[6]
        }
            //Check Columns
        else if (boardStatus[0] == boardStatus[3]) && (boardStatus[3] == boardStatus[6]) && (boardStatus[0] != 0) {
            return boardStatus[0]
        }
        else if (boardStatus[1] == boardStatus[4]) && (boardStatus[4] == boardStatus[7]) && (boardStatus[1] != 0) {
            return boardStatus[1]
        }
        else if (boardStatus[2] == boardStatus[5]) && (boardStatus[5] == boardStatus[8]) && (boardStatus[2] != 0) {
            return boardStatus[2]
        }
            //Check Diagonals
        else if (boardStatus[0] == boardStatus[4]) && (boardStatus[4] == boardStatus[8]) && (boardStatus[0] != 0) {
            return boardStatus[0]
        }
        else if (boardStatus[2] == boardStatus[4]) && (boardStatus[4] == boardStatus[6]) && (boardStatus[2] != 0) {
            return boardStatus[2]
        }
        else{
            return 0
            
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
     
        
    }
    
 


}

