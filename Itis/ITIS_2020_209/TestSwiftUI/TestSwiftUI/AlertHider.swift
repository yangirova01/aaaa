//
//  AlertHider.swift
//  TestSwiftUI
//
//  Created by Teacher on 04.05.2021.
//

import Foundation
import Combine

class AlertHider: ObservableObject {
    var showAlert: Bool = false
    var cooldown: Int = 5
    var timeToClose: Int = 5

    var objectWillChange: PassthroughSubject<(), Never> = PassthroughSubject()
    private var timer: Timer?

    func start() {
        showAlert = true
        timeToClose = cooldown
        objectWillChange.send()

        timer = Timer.scheduledTimer(
            timeInterval: TimeInterval(1),
            target: self,
            selector: #selector(timerFire),
            userInfo: nil,
            repeats: true
        )
    }

    func stop() {
        timer?.invalidate()
        timer = nil
    }

    @objc private func timerFire() {
        timeToClose -= 1

        guard timeToClose > 0 else {
            timer = nil
            showAlert = false
            objectWillChange.send()
            return
        }
        
        objectWillChange.send()
    }
}
