import UIKit

class PreferencesViewController: UIViewController {

    @IBOutlet weak var colorSelector: UISegmentedControl!
    
    var color = UserDefaults.standard.string(forKey: "color")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set background color
        self.view.backgroundColor = UIColor.init(named: color!)
        
        // Set color swich to what it currently is
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
        UserDefaults.standard.set(color, forKey: "color")
        self.view.backgroundColor = UIColor.init(named: color!)
    }
    
    
    @IBAction func deleteHistoryButtonClicked(_ sender: UIButton) {
    }
    
    
    
}
