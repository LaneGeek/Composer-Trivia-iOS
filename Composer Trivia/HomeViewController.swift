import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var totalQuestionsLabel: UILabel!
    @IBOutlet weak var correctQuestionsLabel: UILabel!
    @IBOutlet weak var incorrectQuestionsLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    
    var correctTotal = 0
    var incorrectTotal = 0
    var history: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set prefernces if first time
        if !UserDefaults.standard.bool(forKey: "defaultsAreStored") {
            UserDefaults.standard.set(correctTotal, forKey: "correctTotal")
            UserDefaults.standard.set(incorrectTotal, forKey: "incorrectTotal")
            UserDefaults.standard.set([], forKey: "history")
            UserDefaults.standard.set("blueDark", forKey: "color")
            // Set flag that data is now stored
            UserDefaults.standard.set(true, forKey: "defaultsAreStored")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Set background color
        self.view.backgroundColor = UIColor.init(named: UserDefaults.standard.string(forKey: "color")!)

        // Retrieve prefernces
        correctTotal = UserDefaults.standard.integer(forKey: "correctTotal")
        incorrectTotal = UserDefaults.standard.integer(forKey: "incorrectTotal")
        history = UserDefaults.standard.array(forKey: "history") as! [String]
        
        // Update the display
        updateDisplay()
    }
    
    // Send correctTotal and incorrectToal to the Question View Controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let questionViewController = segue.destination as? QuestionViewController {
            questionViewController.correctTotal = correctTotal
            questionViewController.incorrectTotal = incorrectTotal
        }
    }
    
    func updateDisplay() {
        let totalQuestions = correctTotal + incorrectTotal
        totalQuestionsLabel.text = String(totalQuestions)
        correctQuestionsLabel.text = String(correctTotal)
        incorrectQuestionsLabel.text = String(incorrectTotal)
        
        // Avoid division by zero
        if totalQuestions != 0 {
            percentageLabel.text = String(correctTotal * 100 / (correctTotal + incorrectTotal))
        }
    }
}
