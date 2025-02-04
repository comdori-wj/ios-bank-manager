//
//  InterfaceMessage.swift
//  BankManagerConsoleApp
//
//  Created by Swain Yun on 10/31/23.
//

import Foundation

enum InterfaceMessage: CustomStringConvertible {
    case menuMessage
    case inputMenu
    case bankDidClose(totalCustomerCount: Int, totalSeconds: Double)
    case startWork(customer: Customer)
    case completeWork(customer: Customer)
    
    var description: String {
        switch self {
        case .menuMessage:
            "1 : 은행개점\n2 : 종료"
        case .inputMenu:
            "입력 : "
        case .bankDidClose(let totalCustomerCount, let totalSeconds):
            "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총\(totalCustomerCount)명이며, 총 업무시간은 \(String(format: "%.2f", totalSeconds))초입니다."
        case .startWork(let customer):
            "\(customer.id)번 고객 \(customer.workType)업무 시작"
        case .completeWork(let customer):
            "\(customer.id)번 고객 \(customer.workType)업무 완료"
        }
    }
    
    static func printMenuScript() {
        print(self.menuMessage)
        print(self.inputMenu, terminator: "")
    }
    
    static func printBankDidClose(servicedCustomersCount totalCustomerCount: Int, totalServicedTimes totalSeconds: Double) {
        print(self.bankDidClose(totalCustomerCount: totalCustomerCount, totalSeconds: totalSeconds))
    }
    
    static func printStartWork(customer: Customer) {
        print(self.startWork(customer: customer))
    }
    
    static func printCompleteWork(customer: Customer) {
        print(self.completeWork(customer: customer))
    }
}

enum InterfaceErrorMessage: Error, CustomDebugStringConvertible {
    case wrongMenuSelected
    
    var debugDescription: String {
        switch self {
        case .wrongMenuSelected: "뭔가 입력이 잘못되었습니다. 1~2 사이 숫자를 입력해주세요."
        }
    }
}
