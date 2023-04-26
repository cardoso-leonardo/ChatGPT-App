//
//  ChatViewModel.swift
//  ChatGPT-App
//
//  Created by Leonardo Cardoso on 17/04/23.
//

import UIKit

final class ChatViewModel: NSObject {
    
    public var messages: [String] = []
    
    public func addMessages(text: String) {
        messages.append(text)
    }
    
}
extension ChatViewModel: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChatCellView.identifier, for: indexPath) as! ChatCellView
        cell.messageLabel.text = messages[indexPath.row]
        return cell
    }
    
}
