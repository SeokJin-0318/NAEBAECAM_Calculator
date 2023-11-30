//
//  계산기
//  myCalculator
//
//  Created by 석진 on 11/30/23.
//

import Foundation

class Calculator 
{
    var operate: String?
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    
    init() 
    {
        print("첫 번째 숫자 값을 입력하세요 : ", terminator: "")
        guard let input = readLine(), let number = Double(input) else { return }
        self.firstNumber = number
                
        print("부호를 입력하세요 (+, -, *, / 중 하나) : ", terminator: "")
        guard let input2 = readLine() else { return }
        self.operate = input2
                
        print("두 번째 숫자 값을 입력하세요 : ", terminator: "")
        guard let input3 = readLine(), let number3 = Double(input3) else { return }
        self.secondNumber = number3
    }
    
    func calculate() -> Double 
    {
        
        switch operate 
        {
        case "+":
            return firstNumber + secondNumber
        case "-":
            return firstNumber - secondNumber
        case "*":
            return firstNumber * secondNumber
        case "/":
            if secondNumber != 0
            {
                return firstNumber / secondNumber
            }
            else
            {
                print("0으로 나눌 수 없습니다.")
                return 0
            }
        default:
            print("유효하지 않은 부호입니다.")
            return 0
            
        }
    }
}


let calculator = Calculator()

let printResult = calculator.calculate()
print("결과는 \(printResult) 입니다")
