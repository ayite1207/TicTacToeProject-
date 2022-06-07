//
//  ViewController.swift
//  TicTacToe
//
//  Created by Ayité FOLLY on 27/05/2022.
//

import UIKit

class ViewController: UIViewController {
    
    var mainView: UIView = {
        var view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var grid: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.backgroundColor = .blue
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var box: UIView = {
        var box = UIView()
        box.backgroundColor = .green
        return box
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(mainView)
        mainView.addSubview(grid)
        
        var constraints: [NSLayoutConstraint] = [
            mainView.topAnchor.constraint(equalTo: view.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            grid.widthAnchor.constraint(equalTo:mainView.widthAnchor, multiplier: 0.9),
            grid.heightAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.9),
            grid.centerXAnchor.constraint(equalTo:mainView.centerXAnchor),
            grid.centerYAnchor.constraint(equalTo: mainView.centerYAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }


}

