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
        label.font = .monospacedDigitSystemFont(ofSize: 28, weight: .regular)
        label.textAlignment = .left
        label.textColor = .white
        label.backgroundColor = .systemPurple
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews(messageLabel)
        addConstraints()
        self.layer.cornerRadius = 20
    }

    public func configure(with viewModel: ChatCellViewModel) {
        
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: topAnchor),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor)

        ])
    }
}
