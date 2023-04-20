//
//  ChatTableViewCell.swift
//  ChatGPT-App
//
//  Created by Leonardo Cardoso on 20/04/23.
//

import UIKit

class ChatCellView: UITableViewCell {
    
    public static let identifier = "ChatCellView"
    
    private let text: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .monospacedDigitSystemFont(ofSize: 12, weight: .regular)
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

    public func configure(with viewModel: ChatCellViewModel) {
        
    }
}
