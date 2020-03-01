import UIKit

class PreferencesViewController: UIViewController {

    @IBOutlet weak var colorSelector: UISegmentedControl!
    
    // Get current color from user defaults
    var color = UserDefaults.standard.string(forKey: "color")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set background color
        self.view.backgroundColor = UIColor.init(named: color)
        
        // Set color switch to what it currently is
        switch color {
        case "redDark":
            colorSelector.selectedSegmentIndex = 0
        case "greenDark":
            colorSelector.selectedSegmentIndex = 1
        default:
            colorSelector.selectedSegmentIndex = 2
        }
    }
    
    @IBAction func colorSelector(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            color = "redDark"
        case 1:
            color = "greenDark"
        default:
            color = "blueDark"
        }
        
        // Save to user defaults and set the new background color
        UserDefaults.standard.set(color, forKey: "color")
        self.view.backgroundColor = UIColor.init(named: color)
    }
    
    
    @IBAction func deleteHistoryButtonClicked(_ sender: UIButton) {
        // The action sheet is created
        let action = UIAlertController(title: "Delete History", message: "Do you really want to do this?", preferredStyle: .alert)
        
        // The yes action will create an alert confirming that history has been deleted
        let yesAction = UIAlertAction(title: "You leave me no choice.", style: .default, handler: {
            (_: UIAlertAction) -> Void in
            let alert = UIAlertController(title: "History", message: "is now deleted 😞", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alert, animated: true, completion: nil)
            // Reset user defaults
            UserDefaults.standard.set([], forKey: "history")
            UserDefaults.standard.set(0, forKey: "correctTotal")
            UserDefaults.standard.set(0, forKey: "incorrectTotal")
        })
        
        // The no action will do nothing
        let noAction = UIAlertAction(title: "No, I was just kidding!", style: .default, handler: nil)
        
        // Add the actions to the action sheet
        action.addAction(yesAction)
        action.addAction(noAction)
        
        // Show the action sheet
        present(action, animated: true)
    }
}
