//
//  LogoSwipViewController.swift
//  S.O.F.E
//
//  Created by Meme Mhd on 22/09/2020.
//  Copyright © 2020 S.O.F.E. All rights reserved.
//

import UIKit

class LogoCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView?
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 150, height: 150)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.backgroundColor = .red
        collectionView?.delegate = self
        guard let myCollection = collectionView else {return}
        view.addSubview(myCollection)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: 150).integral
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
