//
//  HomeViewController.swift
//  TripSoda
//
//  Created by sangheon on 2020/11/05.
//

import UIKit

class HomeViewController:UIViewController,UICollectionViewDelegate,UICollectionViewDataSource
{
    
    let placeTitle = ["영월","창원","서울","고창"]
    let reservationTime:[String] = ["7/9일 오전 9시 출발,","7/10일 오전 9시 출발","7/11일 오전 11시 출발","7/12일 오전 12시 출발"]
    let spareDate:[Int] = [1,2,3,4]
    let spareTime:[Int] = [3,3,5,6]
    let cellIdentifier = "homeCell"
    
    @IBOutlet weak var collectionView:UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self 
        flowLayout()
        requestSortedCell()
    }
    
    
    func requestSortedCell() {
        spareDate.sorted()
        spareTime.sorted()
        collectionView.reloadData()
    }
    
    
    
    func flowLayout() {
        let collectionViewLayout:UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: 414 , height: 230 )
            layout.minimumLineSpacing = 10
            layout.sectionInset = UIEdgeInsets.zero
            layout.scrollDirection = .vertical
            return layout
        }()
        collectionView.collectionViewLayout = collectionViewLayout
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.spareDate.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell:HomeCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? HomeCollectionCell else {
            return UICollectionViewCell()
        }
        
        cell.placeTitle.text = placeTitle[indexPath.item]
        cell.tourTime.text = reservationTime[indexPath.item]
        cell.restTime.text = "(\(spareTime[indexPath.item])시간)"
        cell.restDate.text = "\(spareDate[indexPath.item])일"
        
        return cell
    }
    
}
