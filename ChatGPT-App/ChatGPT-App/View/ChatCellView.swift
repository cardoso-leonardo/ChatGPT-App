//
//  ChatTableViewCell.swift
//  ChatGPT-App
//
//  Created by Leonardo Cardoso on 20/04/23.
//

import UIKit

class ChatCellView: UITableViewCell {
    
    public static let identifier = "ChatCellView"
    
    public var messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .monospacedDigitSystemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .left
        label.textColor = .white
        label.layer.cornerRadius = 20
        label.numberOfLines = 0
        label.contentMode = .center
        return label
    }()
    
    private let bubbleView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .center
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews(bubbleView, messageLabel)
        addConstraints()
    }

//    public func configure(with viewModel: ChatCellViewModel) {
//
//    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            messageLabel.widthAnchor.constraint(equalToConstant: 250),
            
            bubbleView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -16),
            bubbleView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16),
            bubbleView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -16),
            bubbleView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 16)

        ])
    }
}
