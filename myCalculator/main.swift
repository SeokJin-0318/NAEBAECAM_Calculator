//
//  계산기
//  myCalculator
//
//  Created by 석진 on 11/30/23.
//

import Foundation

// 구체적인 연산 클래스들의 공통 기능을 구현한 추상 클래스
class AbstractOperation 
{
    func operate(firstNumber: Double, secondNumber: Double) -> Double
    {
        return 0
    }
}

// 더하기 연산 클래스
class addOperation: AbstractOperation       //addOperation 함수에 기본 함수형 전달
{
    override func operate(firstNumber: Double, secondNumber: Double) -> Double 
    {
        return firstNumber + secondNumber
    }
}

// 빼기 연산 클래스
class subtractOperation: AbstractOperation
{
    override func operate(firstNumber: Double, secondNumber: Double) -> Double 
    {
        return firstNumber - secondNumber
    }
}

// 곱하기 연산 클래스
class multiplyOperation: AbstractOperation
{
    override func operate(firstNumber: Double, secondNumber: Double) -> Double 
    {
        return firstNumber * secondNumber
    }
}

// 나누기 연산 클래스
class divideOperation: AbstractOperation
{
    override func operate(firstNumber: Double, secondNumber: Double) -> Double
    {
        if secondNumber != 0 
        {
            return firstNumber / secondNumber
        } 
        else
        {
            print("0으로 나눌 수 없습니다.")
            return 0
        }
    }
}

//제곱 연산 클래스
class squareOperation: AbstractOperation
{
    override func operate(firstNumber: Double, secondNumber: Double) -> Double
    {
        return pow(firstNumber, secondNumber)
    }
}


class Calculator 
{
    var operation: AbstractOperation?       //
    var inputNumber1: Double = 0
    var inputNumber2: Double = 0
    
    init() 
    {
        print("첫 번째 숫자 값을 입력하세요 : ", terminator: "")
        guard let inputNum1 = readLine(), let number1 = Double(inputNum1) else { return }
        self.inputNumber1 = number1
                
        print("부호를 입력하세요 (+, -, *, /, ** 중 하나) : ", terminator: "")
        guard let inputOperation = readLine() else { return }
        
        // 사용자 입력에 따라 적절한 연산 객체를 생성
        switch inputOperation
        {
            case "+":   self.operation = addOperation()
            case "-":   self.operation = subtractOperation()
            case "*":   self.operation = multiplyOperation()
            case "/":   self.operation = divideOperation()
            case "**":  self.operation = squareOperation()
            
            default:
            print("유효하지 않은 부호입니다.")
            return
        }
        
        print("두 번째 숫자 값을 입력하세요 : ", terminator: "")
        guard let inputNum2 = readLine(), let number2 = Double(inputNum2) else { return }
        self.inputNumber2 = number2
    }
    
    func calculate() -> Double      // 메소드 calculate 생성
    {
        guard let operation = operation         //
        else
        {
            print("부호를 입력해야 합니다.")
            return 0
        }
        
        return operation.operate(firstNumber: inputNumber1, secondNumber: inputNumber2)     //
                                        // 입력받은 inputNumber1, inputNumber2를 함수에 삽입
    }
}

let calculator = Calculator()       // Calculator 클래스의 인스턴스를 생성

let printResult = calculator.calculate()

print("결과는 \(printResult) 입니다")
