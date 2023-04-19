//
//  ChatView.swift
//  ChatGPT-App
//
//  Created by Leonardo Cardoso on 17/04/23.
//

import UIKit

final class ChatView: UIView {

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Ask me something"
        textField.setLeftPaddingPoints(15)
        textField.setRightPaddingPoints(15)
        textField.layer.cornerRadius = 20
        textField.backgroundColor = .secondarySystemFill
        return textField
    }()
    
    private let sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .center
        button.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.layer.cornerRadius = 20
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(tableView, textField, sendButton)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: textField.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            textField.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -5),
            textField.heightAnchor.constraint(equalToConstant: 40),
            
            sendButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            sendButton.widthAnchor.constraint(equalToConstant: 40),
            sendButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            sendButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

}
