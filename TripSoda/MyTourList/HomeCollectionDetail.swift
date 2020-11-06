//
//  HomeCollectionDetail.swift
//  TripSoda
//
//  Created by sangheon on 2020/11/07.
//

import UIKit

class HomeCollectionDetail: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    let placeSquence = ["영월역","고씨동굴","김삿갓 유적지","법흥사","젊은달 테마파크"]
    let placeTime = ["7/9-AM9:00","7/9-AM9:00","7/9-AM9:00","7/9-AM9:00","7/9-AM9:00"]
    let cellIdentifier = "detail"
    var selectIndex:Int!
    
    @IBOutlet weak var collectionView:UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return placeSquence.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell:HomeCollectionDetailCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? HomeCollectionDetailCell else {
            return UICollectionViewCell()
            
        }
        return cell
    }
   

}
