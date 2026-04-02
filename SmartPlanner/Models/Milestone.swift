import Foundation

struct Milestone: Identifiable, Codable {
    var id = UUID()                 // Gives the milestone a unique background ID
    var title: String               // The name, like "First Draft"
    var dueDate: Date               // When this specific chunk is due
    var isCompleted: Bool = false   // Checkbox status (starts as false)
}
