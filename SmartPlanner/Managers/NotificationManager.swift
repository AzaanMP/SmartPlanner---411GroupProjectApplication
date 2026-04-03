import Foundation
import UserNotifications

class NotificationManager {
    
    static let shared = NotificationManager()
    
    // Call this exactly once when the app first opens
    func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                print("Notification permission granted.")
            } else if let error = error {
                print("Error requesting permission: \(error.localizedDescription)")
            }
        }
    }
    
    // Schedule a reminder exactly 24 hours before the milestone deadline
    func scheduleSassyReminder(for milestone: Milestone) {
        let content = UNMutableNotificationContent()
        content.title = "Assignment Check-In"
        
        // Pick a random sassy string from this array
        let sassyMessages = [
            "Don't make me tell your professor you haven't started \(milestone.title) yet.",
            "Are we really going to wait until the last minute for \(milestone.title)?",
            "Future you is begging present you to do \(milestone.title) right now."
        ]
        content.body = sassyMessages.randomElement() ?? "Time to work on \(milestone.title)!"
        content.sound = .default
        
        // Math to find the date 24 hours before the due date
        let triggerDate = Calendar.current.date(byAdding: .hour, value: -24, to: milestone.dueDate) ?? Date()
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: triggerDate)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request = UNNotificationRequest(identifier: milestone.id.uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            }
        }
    }
}
