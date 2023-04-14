//
//  ViewController.swift
//  ChatGPT-App
//
//  Created by Leonardo Cardoso on 13/04/23.
//

import UIKit

class ChatViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        Service.shared.sendMessage(text: "Olá, como você tá?") { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
}

