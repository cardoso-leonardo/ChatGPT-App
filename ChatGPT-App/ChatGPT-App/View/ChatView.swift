//
//  ChatView.swift
//  ChatGPT-App
//
//  Created by Leonardo Cardoso on 17/04/23.
//

import UIKit

final class ChatView: UIView {
    
    private let viewModel: ChatViewModel = ChatViewModel()

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ChatCellView.self, forCellReuseIdentifier: ChatCellView.identifier)
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.transform = CGAffineTransform(scaleX: 1, y: -1)
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
    
    private lazy var sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .center
        button.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(sendPressed), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(tableView, textField, sendButton)
        addConstraints()
        configureTableView()
        textField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func configureTableView() {
        tableView.dataSource = viewModel
        tableView.delegate = viewModel
    }
    
    @objc func sendPressed() {
        guard let text = textField.text else { return }
        viewModel.addMessages(text: text)
        tableView.reloadData()
        Service.shared.sendMessage(text: text) { result in
            switch result {
            case .success(let success):
                self.viewModel.addMessages(text: success)
                print(self.viewModel.messages)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(_):
                self.viewModel.addMessages(text: "Tente Novamente")
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        textField.text = ""
        
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: textField.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            textField.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 40),
            
            sendButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            sendButton.widthAnchor.constraint(equalToConstant: 40),
            sendButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            sendButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

}
extension ChatView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
