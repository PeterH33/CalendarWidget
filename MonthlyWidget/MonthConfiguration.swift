//
//  MonthConfiguration.swift
//  MonthlyWidgetExtension
//
//  Created by Peter Hartnett on 8/24/22.
//

import SwiftUI


struct MonthConfig {
    let backGroundImage: String
    let emojiText: String
    let weekdayTextColor: Color
    let dayTextColor: Color
    
    static func determineConfig(from date: Date) -> MonthConfig {
        let monthInt = Calendar.current.component(.month, from: date)
        
        switch monthInt {
        case 1:
            return MonthConfig(backGroundImage: String(monthInt),
                               emojiText: "⛄️",
                               weekdayTextColor: .black.opacity(0.8),
                               dayTextColor: .red.opacity(0.9))
        case 2:
            return MonthConfig(backGroundImage: String(monthInt),
                               emojiText: "❤️",
                               weekdayTextColor: .white.opacity(0.8),
                               dayTextColor: .pink.opacity(0.9))
        case 3:
            return MonthConfig(backGroundImage: String(monthInt),
                               emojiText: "☘️",
                               weekdayTextColor: .white.opacity(0.9),
                               dayTextColor: .green.opacity(0.9))
        case 4:
            return MonthConfig(backGroundImage: String(monthInt),
                               emojiText: "☔️",
                               weekdayTextColor: .white.opacity(0.9),
                               dayTextColor: .purple.opacity(0.9))
        case 5:
            return MonthConfig(backGroundImage: String(monthInt),
                               emojiText: "🌺",
                               weekdayTextColor: .white.opacity(0.9),
                               dayTextColor: .pink.opacity(0.7))
        case 6:
            return MonthConfig(backGroundImage: String(monthInt),
                               emojiText: "🌤",
                               weekdayTextColor: .black.opacity(0.7),
                               dayTextColor: .paleYellow.opacity(0.9))
        case 7:
            return MonthConfig(backGroundImage: String(monthInt),
                               emojiText: "🏖",
                               weekdayTextColor: .black.opacity(0.9),
                               dayTextColor: .paleBlue.opacity(0.9))
        case 8:
            return MonthConfig(backGroundImage: String(monthInt),
                               emojiText: "☀️",
                               weekdayTextColor: .black.opacity(0.7),
                               dayTextColor: .darkOrange.opacity(0.8))
        case 9:
            return MonthConfig(backGroundImage: String(monthInt),
                               emojiText: "🍁",
                               weekdayTextColor: .white.opacity(0.9),
                               dayTextColor: .red.opacity(0.9))
        case 10:
            return MonthConfig(backGroundImage: String(monthInt),
                               emojiText: "👻",
                               weekdayTextColor: .black.opacity(0.9),
                               dayTextColor: .darkOrange.opacity(0.9))
        case 11:
            return MonthConfig(backGroundImage: String(monthInt),
                               emojiText: "🦃",
                               weekdayTextColor: .white.opacity(0.9),
                               dayTextColor: .black.opacity(0.9))
        case 12:
            return MonthConfig(backGroundImage: String(monthInt),
                               emojiText: "🎄",
                               weekdayTextColor: .white.opacity(0.9),
                               dayTextColor: .black.opacity(0.9))
        default:
            return MonthConfig(backGroundImage: String(monthInt),
                               emojiText: "📅",
                               weekdayTextColor: .black.opacity(0.6),
                               dayTextColor: .white.opacity(0.8))
        }
    }
}

extension Color {
    static let paleYellow   = Color(red: 252/255, green: 225/255, blue: 121/255)
    static let palePink     = Color(red: 254/255, green: 138/255, blue: 138/255)
    static let darkGreen    = Color(red: 0/255, green: 67/255, blue: 13/255)
    static let paleGreen    = Color(red: 163/255, green: 230/255, blue: 127/255)
    static let paleBlue     = Color(red: 139/255, green: 229/255, blue: 233/255)
    static let skyBlue      = Color(red: 103/255, green: 155/255, blue: 197/255)
    static let paleOrange   = Color(red: 197/255, green: 161/255, blue: 103/255)
    static let darkOrange   = Color(red: 172/255, green: 110/255, blue: 16/255)
    static let paleRed      = Color(red: 174/255, green: 80/255, blue: 80/255)
    static let paleBrown    = Color(red: 124/255, green: 102/255, blue: 85/255)
}
