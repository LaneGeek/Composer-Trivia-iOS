import UIKit

class HistoryTableViewController: UITableViewController {
    
    // The field which stores the history
    var history = UserDefaults.standard.array(forKey: "history") as! [String]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set background color
        self.view.backgroundColor = UIColor.init(named: UserDefaults.standard.string(forKey: "color")!)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // The number of rows
        return history.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath) as! HistoryTableViewCell
        
        // Fill each cell with a reading from history
        cell.historyCellLabel.text = history[indexPath.row]
        cell.backgroundColor = UIColor.init(named: UserDefaults.standard.string(forKey: "color")!)
        return cell
    }
}
