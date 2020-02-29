import UIKit

class HistoryTableViewCell: UITableViewCell {

    // Only one UI element is required
    @IBOutlet weak var historyCellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
