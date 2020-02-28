import Foundation

class Question {
    
    // Properties
    var text = ""
    var correctAnswer = ""
    var answers: [String] = []
    var chosenAnswer = ""
    
    // Computed properties
    var isAnswerCorrect: Bool { chosenAnswer == correctAnswer}
    var summary: String { isAnswerCorrect ? "Well done! Your answer of \(chosenAnswer) is correct!" : "Wrong! The actual year was \(correctAnswer)." }
    var historyEntry: String {
        // Get the current time & date and format it
        let timeAndDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, h:mm:ss a"
        let formattedDate = dateFormatter.string(from: timeAndDate)
        
        
        var output = "Time & Date: \(formattedDate)\n"
        output += "Question: \(text)\n"
        output += "Your answer of \(chosenAnswer) was "
        output += isAnswerCorrect ? "correct." : "incorrect."
        
        return output
    }
    
    // Return a random question
    static func getRandomQuestion() -> Question {
        
        // Get a random composer
        let composer = Composer.getRandomComposer()
        
        // Choose at random if the question is about birth or death
        let isQuestionAboutBirth = Int.random(in: 0 ... 1) == 0
        
        // Generate text for the question
        var question = "In what year "
        question += isQuestionAboutBirth ? "was" : "did"
        question += " \(composer.name) "
        question += isQuestionAboutBirth ? "born?" : "die?"
        
        // Correct answer is easy to determine
        let correctAnswer = String(isQuestionAboutBirth ? composer.birthYear : composer.deathYear)
        
        // TODO: EXPLAIN BETTER
        var answers = Set<String>()
        answers.insert(correctAnswer)
        while answers.count < 4 {
            answers.insert(String(Int.random(in: 1600 ... 1999)))
        }
        
        // Generate the output
        let output = Question()
        output.text = question
        output.correctAnswer = correctAnswer
        // Sort the set and convert to array
        output.answers = answers.sorted()
        
        // Return the output
        return output
    }
}
