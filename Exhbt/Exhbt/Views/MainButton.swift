//
//  MainButton.swift
//  Exhbt
//
//  Created by Rakhmatov Bekzod on 09/03/23.
//

import UIKit

final class MainButton: UIButton {
    
    var shouldApplyBorder = false
    var title = ""
    init(title: String, shouldApplyBorder: Bool? = nil) {
        super.init(frame: .zero)
        self.title = title
        self.shouldApplyBorder = shouldApplyBorder ?? false
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        if #available(iOS 15.0, *) {
            configuration = .plain()
        }
        titleLabel?.font = .systemFont(ofSize: 20)
        setTitleColor(shouldApplyBorder ? .systemBlue : .white, for: .normal)
        setTitle(title, for: .normal)
        backgroundColor = shouldApplyBorder ? .clear : .systemBlue
        layer.cornerRadius = 8
        if shouldApplyBorder {
            layer.borderWidth = 1
            layer.borderColor = UIColor.systemBlue.cgColor
        }
    }
}
