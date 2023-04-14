//
//  ViewController.swift
//  ChatGPT-App
//
//  Created by Leonardo Cardoso on 13/04/23.
//

import UIKit

class ChatViewController: UIViewController {
    
    var button: UIButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle("Test Button", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc
    func buttonTapped(sender: UIButton!) {
        Service.shared.sendMessage(text: "Olá, como você tá?") { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.backgroundColor = .systemBackground
        view.addSubview(button)
        addConstraints()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 250),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
        ])
    }
}

