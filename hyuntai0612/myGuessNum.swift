//
//  myGuessNum.swift
//  hyuntai0612
//
//  Created by Hyuntai on 2017/6/12.
//  Copyright © 2017年 hyphen. All rights reserved.
//

import Foundation
func myGuessNum() {
    // 產生謎底
    func createAnswer(length: Int) -> String {
        var result = ""
        var balls = Set<Int>()
        while balls.count < length {
            balls.insert(Int(arc4random_uniform(10)))
        }
        for ball in balls {
            result.append(String(ball))
        }
        return result
    }
    
    // 比對
//    func checkAB(answer: String, guess: String) -> (A: Int, B: Int) 
    func checkAB(answer: String, guess: String) -> String {
        var a = 0, b = 0
        var ca: String, cg: String
        for i in 0..<answer.characters.count {
            ca = substring(str: answer, start: i, len: 1)
            cg = substring(str: guess, start: i, len: 1)
            if ca == cg {
                a += 1
            } else if answer.contains(cg) {
                b += 1
            }
        }
        return "\(a)A\(b)B"
    }
    // 自制的substring
    func substring(str: String, start: Int, len: Int) -> String {
        // 3.再做堅固一定
        let sindex = str.index(str.startIndex, offsetBy: start)
        let eindex = str.index(str.startIndex, offsetBy: start + len)
        let range = sindex..<eindex
        return str[range]
    }

    // main flow
    let args = CommandLine.arguments // [String]
    // 2.強化未輸入
    let len = Int(args[1])
    let answer = createAnswer(length: len ?? 3)
    
    var guess: String?
    var isWin: Bool = false
    for i in 1...10 {
        print("\(i). 請猜一個數字(\(len)位):", terminator: "")
        guess = readLine()
        // 檢查機制 1.Homework
        // 1.[0-9]{len!}
        // 2.任一數字不可重複
        if let gus = guess {
            let result = checkAB(answer: answer, guess: gus)
            print("檢查結果: \(result)")
            if result == "\(len)A0B" {
                isWin = true
                break
            }
        }
    }
    if isWin {
        print("WINNER")
    } else {
        print("Loser:\(answer)")
    }
}
