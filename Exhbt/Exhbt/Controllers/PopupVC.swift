//
//  PopupVC.swift
//  Exhbt
//
//  Created by Rakhmatov Bekzod on 09/03/23.
//

import UIKit

class PopupVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var timerLabbel: UILabel!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    var eventStatus = ["First Competitor Joined", "Competitors Joining", "Exhbt is live", "Exhbt is finished"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension PopupVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}

extension PopupVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableViewHeight.constant = CGFloat(eventStatus.count * 40)
        return eventStatus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell {
            var index = indexPath.row
            if index >= 4 {
                index = 3
            }
            var fontSize = 17
            fontSize = fontSize - index
            cell.label.text = eventStatus[indexPath.row]
            cell.label.font = UIFont.systemFont(ofSize: CGFloat(fontSize), weight: .medium)
            cell.secondLineView.alpha = indexPath.row == (eventStatus.count - 1) ? 0 : 1
            cell.label.alpha = 1.0 - (CGFloat(indexPath.row) / CGFloat(eventStatus.count))
            return cell
        }
        return UITableViewCell()
    }
}
