//
//  PopupVC.swift
//  Exhbt
//
//  Created by Rakhmatov Bekzod on 09/03/23.
//

import UIKit

class PopupVC: UIViewController {
    
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var timerLabbel: UILabel!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var expandButton: UIButton!
    @IBOutlet weak var lineView: UIView!
    
    var eventStatus = ["First Competitor Joined", "Competitors Joining", "Exhbt is live", "Exhbt is finished"]

    override func viewDidLoad() {
        super.viewDidLoad()
        popupView.layer.cornerRadius = 16
        bottomConstraint.constant = -1000
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(animateDismissView))
        tapGesture.numberOfTapsRequired = 1
        view.addGestureRecognizer(tapGesture)
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateContentView()
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func animateContentView() {
        UIView.animate(withDuration: 0.4) {
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        }
        UIView.animate(withDuration: 0.3) {
            self.bottomConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func animateDismissView() {
        UIView.animate(withDuration: 0.4) {
            self.view.alpha = 0
        } completion: { _ in
            self.dismiss(animated: false)
        }
        UIView.animate(withDuration: 0.3) {
            self.bottomConstraint.constant = -1000
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func expandButtonPressed() {
        UIView.animate(withDuration: 0.25) {
            self.tableView.isHidden.toggle()
            self.lineView.isHidden.toggle()
            if self.tableView.isHidden {
                self.expandButton.transform = CGAffineTransform.identity
            } else {
                self.expandButton.transform = CGAffineTransform(rotationAngle: -CGFloat.pi)
            }
        }
    }
    
    @IBAction func gotItButtonPressed() {
        animateDismissView()
    }
    
    @IBAction func inviteCompetitors() {
        animateDismissView()
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
