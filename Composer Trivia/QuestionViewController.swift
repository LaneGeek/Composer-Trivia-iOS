import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var returnToScorecardButton: UIButton!
    
    var correctTotal = 0
    var incorrectTotal = 0
    var question = Question.getRandomQuestion()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set background color
        self.view.backgroundColor = UIColor.init(named: UserDefaults.standard.string(forKey: "color")!)
        
        // Populate the label and buttons with data from the question
        questionLabel.text = question.text
        button1.setTitle(question.answers[0], for: .normal)
        button2.setTitle(question.answers[1], for: .normal)
        button3.setTitle(question.answers[2], for: .normal)
        button4.setTitle(question.answers[3], for: .normal)
        
        // Disable the navigation back button
        navigationItem.hidesBackButton = true;
        
        // Disable to prevent cheating
        returnToScorecardButton.isEnabled = false
    }
    
    @IBAction func answerButtonClicked(_ sender: UIButton) {
        // Get chosen answer from the button 'sender' label
        question.chosenAnswer = sender.titleLabel?.text! ?? ""
        
        // Display the result
        summaryLabel.text = question.summary
        
        // Add to the tally
        if question.isAnswerCorrect {
            correctTotal += 1
        } else {
            incorrectTotal += 1
        }
        
        // Save this data
        UserDefaults.standard.set(correctTotal, forKey: "correctTotal")
        UserDefaults.standard.set(incorrectTotal, forKey: "incorrectTotal")
        
        // Get history entry and save it
        var history = UserDefaults.standard.array(forKey: "history") as! [String]
        history.insert(question.historyEntry, at: 0)
        UserDefaults.standard.set(history, forKey: "history")
        
        // Disable all answer buttons and enable home screen button
        button1.isEnabled = false
        button2.isEnabled = false
        button3.isEnabled = false
        button4.isEnabled = false
        returnToScorecardButton.isEnabled = true
    }
    
    @IBAction func returnToScoreboardClicked(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
