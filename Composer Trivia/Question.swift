import Foundation

class Question {
    // Properties
    var question = ""
    var correctAnswer = 0
    var answers: [Int] = []
    
    static func getQuestion() -> Question {
        // Get a random composer
        let composer = Composer.getRandomComposer()
        
        // Choose at random if birth or death question
        let isBirthQuestion = Int.random(in: 0 ... 1) == 0
        
        // Generate text for the question
        var question = "In what year "
        question += isBirthQuestion ? "was" : "did"
        question += " \(composer.name) "
        question += isBirthQuestion ? "born?" : "die?"
        
        // Correct answer is easy to determine
        let correctAnswer = isBirthQuestion ? composer.birthYear : composer.deathYear
        
        // Generate three random years which cannot be the same as the answer!
        var answers = Set<Int>()
        answers.insert(correctAnswer)
        while answers.count < 4 {
            answers.insert(Int.random(in: 1600 ... 1999))
        }
        
        let output = Question()
        output.question = question
        output.correctAnswer = correctAnswer
        // Sort the set and convert to array
        output.answers = answers.sorted()
        
        return output
    }
}
