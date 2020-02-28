import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var summaryLabel: UILabel!
    
    var correctTotal = 0
    var incorrectTotal = 0
    var question = Question.getRandomQuestion()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = question.text
        button1.setTitle(question.answers[0], for: .normal)
        button2.setTitle(question.answers[1], for: .normal)
        button3.setTitle(question.answers[2], for: .normal)
        button4.setTitle(question.answers[3], for: .normal)
    }
    
    @IBAction func answerButtonClicked(_ sender: UIButton) {
        question.chosenAnswer = sender.titleLabel?.text! ?? ""
        summaryLabel.text = question.summary()
        
        if question.isAnswerCorrect() {
            correctTotal += 1
        } else {
            incorrectTotal += 1
        }
        
        UserDefaults.standard.set(correctTotal, forKey: "correctTotal")
        UserDefaults.standard.set(incorrectTotal, forKey: "incorrectTotal")
    }
    
    @IBAction func returnToScoreboardClicked(_ sender: UIButton) {
    }
}
