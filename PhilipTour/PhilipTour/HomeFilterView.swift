//
//  FilterView.swift
//  PhilipTour
//
//  Created by NHN on 2021/01/31.
//

import UIKit

class HomeFilterView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let recentOrderButton = UIButton(type: .custom)
        recentOrderButton.setTitle("최신순", for: .normal)
        recentOrderButton.setTitleColor(.darkGray, for: .normal)
        recentOrderButton.backgroundColor = .white
        
        
        let pastOrderButton = UIButton(type: .custom)
        pastOrderButton.setTitle("과거순", for: .normal)
        pastOrderButton.setTitleColor(.darkGray, for: .normal)
        pastOrderButton.backgroundColor = .white
        
        let stackView = UIStackView()
        stackView.frame = self.frame
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 0.5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.backgroundColor = .lightGray
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.addSubview(stackView)
        stackView.addArrangedSubview(recentOrderButton)
        stackView.addArrangedSubview(pastOrderButton)

        // StackView
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor ,constant: 0),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
