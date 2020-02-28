import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var buuton1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    var correctTotal = 0
    var incorrectTotal = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func answerButtonClicked(_ sender: UIButton) {
        correctTotal += 1
        incorrectTotal += 100
        UserDefaults.standard.set(correctTotal, forKey: "correctTotal")
        UserDefaults.standard.set(incorrectTotal, forKey: "incorrectTotal")
    }
    
    @IBAction func returnToScoreboardClicked(_ sender: UIButton) {
    }
}
