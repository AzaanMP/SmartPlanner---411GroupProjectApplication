import UIKit

// We add "UITableViewDataSource" and "UITableViewDelegate" so this file is legally allowed to control a list.
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // 1. The Wire: This empty socket will connect directly to your Storyboard list.
    @IBOutlet weak var tableView: UITableView!
    
    // 2. The Data: A blank array to hold your homework.
    var assignments: [Assignment] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 3. The Setup: Tell the table view that this file is the boss.
        tableView.dataSource = self
        tableView.delegate = self
        
        // 4. The MVP Test: We create one fake assignment just to prove the list works!
        let fakeAssignment = Assignment(title: "Test Math Homework", finalDueDate: Date())
        assignments.append(fakeAssignment)
    }
    
    // MARK: - Table View Rules
    
    // Rule 1: How many rows should the list have?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return assignments.count // Make exactly as many rows as there are assignments
    }
    
    // Rule 2: What text goes inside each row?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // This "AssignmentCell" text MUST match exactly what you typed in the Storyboard identifier earlier!
        let cell = tableView.dequeueReusableCell(withIdentifier: "AssignmentCell", for: indexPath)
        
        // Find the right assignment for this specific row
        let currentAssignment = assignments[indexPath.row]
        
        // Put the title of the assignment onto the screen
        cell.textLabel?.text = currentAssignment.title
        
        return cell
    }
}
