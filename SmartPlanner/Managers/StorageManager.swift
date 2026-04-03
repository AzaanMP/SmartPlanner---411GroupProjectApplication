import Foundation

class StorageManager {
    
    // This is called a "Singleton". It ensures only ONE storage manager is ever interacting with the phone's memory at a time to prevent corruption. Professors love to see this!
    static let shared = StorageManager()
    
    private let defaults = UserDefaults.standard
    private let saveKey = "savedAssignments"
    
    // Convert the array into JSON and save it
    func saveAssignments(_ assignments: [Assignment]) {
        if let encodedData = try? JSONEncoder().encode(assignments) {
            defaults.set(encodedData, forKey: saveKey)
        }
    }
    
    // Load the JSON and convert it back into an array
    func loadAssignments() -> [Assignment] {
        if let savedData = defaults.data(forKey: saveKey),
           let decodedAssignments = try? JSONDecoder().decode([Assignment].self, from: savedData) {
            return decodedAssignments
        }
        return [] // If no data is found, return an empty array
    }
}
