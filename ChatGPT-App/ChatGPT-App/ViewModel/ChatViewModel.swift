//
//  ChatViewModel.swift
//  ChatGPT-App
//
//  Created by Leonardo Cardoso on 17/04/23.
//

import UIKit

final class ChatViewModel: NSObject {
    
    private var messages: [Message] = []
    
    public func addMessages(message: Message) {
        messages.append(message)
    }
    
}
extension ChatViewModel: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if messages[indexPath.row].sender == "user" {
            let cell = tableView.dequeueReusableCell(withIdentifier: UserMessageCellView.identifier, for: indexPath) as! UserMessageCellView
            cell.messageLabel.text = messages[indexPath.row].text
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: GPTMessageCellView.identifier, for: indexPath) as! GPTMessageCellView
        cell.messageLabel.text = messages[indexPath.row].text
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
