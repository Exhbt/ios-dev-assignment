//
//  MainButton.swift
//  Exhbt
//
//  Created by Rakhmatov Bekzod on 09/03/23.
//

import UIKit

final class MainButton: UIButton {
    
    var title = ""
    init(title: String) {
        super.init(frame: .zero)
        self.title = title
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }
    
    func setup() {
        titleLabel?.font = .systemFont(ofSize: 20)
        setTitleColor(.white, for: .normal)
        if !title.isEmpty {
            setTitle(title, for: .normal)
        }
        backgroundColor = .systemBlue
        layer.cornerRadius = 8
    }
}

final class BorderedButton: UIButton {
    
    var title = ""
    init(title: String) {
        super.init(frame: .zero)
        self.title = title
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }
    
    func setup() {
        titleLabel?.font = .systemFont(ofSize: 20)
        setTitleColor(.systemBlue, for: .normal)
        if !title.isEmpty {
            setTitle(title, for: .normal)
        }
        backgroundColor = .clear
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemBlue.cgColor
    }
}
