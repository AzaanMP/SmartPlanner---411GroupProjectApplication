import Foundation

class DateHelper {
    
    // We use 'static' so we don't have to create a new DateHelper every time we need math done.
    static func generateMilestones(for assignmentTitle: String, finalDate: Date) -> [Milestone] {
        let calendar = Calendar.current
        var milestones: [Milestone] = []
        
        // Milestone 1: The Outline (Due 5 days before final date)
        if let outlineDate = calendar.date(byAdding: .day, value: -5, to: finalDate) {
            milestones.append(Milestone(title: "Outline / Planning", dueDate: outlineDate))
        }
        
        // Milestone 2: First Draft (Due 3 days before final date)
        if let draftDate = calendar.date(byAdding: .day, value: -3, to: finalDate) {
            milestones.append(Milestone(title: "First Draft", dueDate: draftDate))
        }
        
        // Milestone 3: Final Polish (Due 1 day before final date)
        if let polishDate = calendar.date(byAdding: .day, value: -1, to: finalDate) {
            milestones.append(Milestone(title: "Final Review", dueDate: polishDate))
        }
        
        return milestones
    }
}
