//
//  AppVibration.swift
//  lab_2.1
//
//  Created by Ярослав on 10.10.2023.
//


import AudioToolbox
import UIKit

 
class AppVibration{

    enum Vibration {
            case error
            case success
            case warning
            case light
            case medium
            case heavy
            case soft
            case rigid
            case selection
            case oldSchool

            public func vibrate() {
                switch self {
                case .error:
                    UINotificationFeedbackGenerator().notificationOccurred(.error)
                case .success:
                    UINotificationFeedbackGenerator().notificationOccurred(.success)
                case .warning:
                    UINotificationFeedbackGenerator().notificationOccurred(.warning)
                case .light:
                    UIImpactFeedbackGenerator(style: .light).impactOccurred()
                case .medium:
                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                case .heavy:
                    UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                case .soft:
                    UIImpactFeedbackGenerator(style: .soft).impactOccurred()
                case .rigid:
                    UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
                case .selection:
                    UISelectionFeedbackGenerator().selectionChanged()
                case .oldSchool:
                    AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
                }
            }
        }
}
