//
//  Game.swiftbb.swift
//  ProjetoAlvo
//
//  Created by user226746 on 9/9/22.
//

import Foundation

class Game{
    var target : Int = Int.random(in: 1...100)
    var sliderNumber : Double = 0
    var points : Int = 0
    var totalScore : Int = 0
    
    func upDate() -> (Int, Int, Int) {
        
        points = abs(target - (Int(sliderNumber)))
        totalScore += points
        target = Int.random(in: 1...100)
        return (points, totalScore, target)
    }

    func reset() -> (Int, Int, Int){
        points = 0
        totalScore = 0
        target = Int.random(in: 1...100)
        return (points, totalScore, target)
    }
    func getMessage() -> String {
        if(points == 0){
            return "Você acertou!!! 🥳"
        }
        else{
            return "Os Pontos do usuátio são ➡️ \(points)"
        }
    }
}

