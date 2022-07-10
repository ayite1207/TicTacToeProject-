//
//  ViewController.swift
//  TicTacToe
//
//  Created by Ayité FOLLY on 27/05/2022.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties

    var mainView: UIView = {
        var view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var tictactoeCollectionView: UICollectionView?
    @IBOutlet var gridCollectionView: UICollectionView!

    // MARK: - Cycle life

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(mainView)
        setCollectionView()
        setCollectionViewConstraint()
    }

    // MARK: - Methode

    private func setCollectionView() {
        gridCollectionView.delegate = self
        gridCollectionView.dataSource = self

        gridCollectionView.register(UINib(nibName: "BoxCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BoxCollectionViewCell")

        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 1.0, left: 8.0, bottom: 1.0, right: 8.0)
        gridCollectionView.collectionViewLayout = layout
    }

    private func setCollectionViewConstraint() {
        mainView.addSubview(gridCollectionView)

        let constraints: [NSLayoutConstraint] = [
            mainView.topAnchor.constraint(equalTo: view.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gridCollectionView.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.9),
            gridCollectionView.heightAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.9),
            gridCollectionView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            gridCollectionView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
    }
}

// MARK: - Collection View

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        9
    }

    func collectionView(_: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let boxCollectionViewCell = gridCollectionView.dequeueReusableCell(
            withReuseIdentifier: "BoxCollectionViewCell",
            for: indexPath
        ) as? BoxCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        return boxCollectionViewCell
    }

    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.size.height / 3) - 5,
                      height: (collectionView.bounds.size.height / 3) - 5)
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, minimumInteritemSpacingForSectionAt _: Int) -> CGFloat {
        return 1
    }
}
