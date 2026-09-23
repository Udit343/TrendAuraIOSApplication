
//  TimeZone.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 31/08/26.

import Foundation

extension TimeZone {
    
    func getTimeOffsetString() -> String {
        let seconds = self.secondsFromGMT()
        let hours = seconds / 3600
        let minutes = abs(seconds / 60 % 60)
        let sign = hours >= 0 ? "+" : "-"
        return String(format: "%@%02d:%02d", sign, abs(hours), minutes)
    }
}

