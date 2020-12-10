//
//  audioMainCollection.swift
//  TripSoda
//
//  Created by sangheon on 2020/11/07.
//

import UIKit

class audioMainCollection: NSObject,UICollectionViewDataSource,UICollectionViewDelegate{
    
    let audioLabel = ["고씨동굴","영월파크","서울공원"]
    let audioSubLabel = ["3개의 오디오 중 첫번째 이야기","3개의 오디오 중 첫번째 이야기","3개의 오디오 중 첫번째 이야기"]
    let cellIdentifier = "audiocell"
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.audioLabel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell:audioCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? audioCell else {
            return UICollectionViewCell()
        }
        cell.audioTitle.text = self.audioLabel[indexPath.item]
        cell.audioSub.text = self.audioSubLabel[indexPath.item]
        
        return cell
    }
    
    
    
}
