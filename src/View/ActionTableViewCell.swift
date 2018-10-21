//
//  ActionTableViewCell.swift
//  TSSSaver
//
//  Created by nullpixel on 20/10/2018.
//  Copyright © 2018 Dynastic Development. All rights reserved.
//

import UIKit

class ActionTableViewCell: UITableViewCell {
    private(set) var button = UIButton()
    private var activityIndicator = UIActivityIndicatorView(style: .gray)
    
    convenience init(title: String) {
        self.init(style: .default, reuseIdentifier: nil)
        
        button.setTitle(title, for: .normal)
        button.setTitleColor(tintColor, for: .normal)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        layout()
    }
    
    func startActivity() {
        isUserInteractionEnabled = false
        accessoryView?.isHidden = false
        activityIndicator.startAnimating()
        button.alpha = 0.5
    }
    
    func stopActivity() {
        isUserInteractionEnabled = true
        activityIndicator.stopAnimating()
        button.alpha = 1
    }
    
    private func setup() {
        accessoryView = activityIndicator
        accessoryView?.isHidden = true
        
        button.titleLabel?.textAlignment = .center
        button.isUserInteractionEnabled = false
        
        contentView.addSubview(button)
    }
    
    private func layout() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
}
