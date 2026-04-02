import Foundation

struct Assignment: Identifiable, Codable {
    var id = UUID()                 // Gives the assignment a unique ID
    var title: String               // The name, like "History Essay"
    var finalDueDate: Date          // The ultimate deadline
    var milestones: [Milestone]     // A list holding the smaller chunks
}
