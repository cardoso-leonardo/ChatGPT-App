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

    

}
