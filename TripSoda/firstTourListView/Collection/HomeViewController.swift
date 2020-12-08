//
//  HomeViewController.swift
//  TripSoda
//
//  Created by sangheon on 2020/11/05.
//

import UIKit
import DropDown

class HomeViewController:TTNavigationBar,UICollectionViewDelegate,UICollectionViewDataSource
{
    
    let imageFile = ["sample1","sample2","sample3","sample1",]
    var placeTitle = ["영월","창원","서울","고창"]
    var reservationTime:[String] = ["7/9일 오전 9시 출발,","7/10일 오전 9시 출발","7/11일 오전 11시 출발","7/12일 오전 12시 출발"]
    var spareDate:[Int] = [2,5,3,1]
    var spareTime:[Int] = [6,3,5,3]
    let cellIdentifier = "homeCell"
    let dropDown = DropDown()
    

    
    @IBOutlet weak var collectionView:UICollectionView!
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        blur()
       
        self.tabBarController?.tabBar.layer.masksToBounds = true
               self.tabBarController?.tabBar.isTranslucent = true
               self.tabBarController?.tabBar.barStyle = .default
               self.tabBarController?.tabBar.layer.cornerRadius = 30
               self.tabBarController?.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = attributeTitleView() //titleVIew 코드로 constrant 으로 센터 고정
        
        collectionView.delegate = self
        collectionView.dataSource = self 
        flowLayout()
        guard let topMenu = navigationController?.navigationBar.topItem?.rightBarButtonItem else {
            return
        }
        dropDown.anchorView = topMenu
        dropDown.selectionAction = { index ,String in
            if index == 0 {
                //메뉴 날짜순 정렬
                self.requestSortedCell()
                //체크표시하려면 여기에 나눠서 그떄그떄 cell 추가 해서 이미지보여주는 방법
                //추후에
            }
        }
        
        
       

        
        
    }
    
    @IBAction func backButton(_sender:Any) {
        self.performSegue(withIdentifier: "back", sender: self)
    }
    
    @IBAction func menuItem(_ sender:Any) {
        dropDown.dataSource = ["투어날짜 임박순","투어날짜 시작순"]
        dropDown.show()
    }
    
    //sorted menu
    func requestSortedCell() {
        spareDate.sort()
        spareTime.sort()
        collectionView.reloadData()
    }
    
    //layout Design
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
        //cell.restTime.text = "(\(spareTime[indexPath.item])시간)"
        cell.restDate.text = "7월9일 오전9시 출발,\(spareDate[indexPath.item])일(\(spareTime[indexPath.item])시간)"
        cell.viewPhoto.image = UIImage(named: imageFile[indexPath.item])
        
        return cell
    }
    
    //transmit Data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "more" {
            guard let nextController:HomeCollectionDetail = segue.destination as? HomeCollectionDetail else {
                return
            }
            guard let cell:HomeCollectionCell = sender as? HomeCollectionCell else {
                return
            }
            guard let index:IndexPath = self.collectionView.indexPath(for: cell) else {
                return
            }
            
            nextController.selectIndex = index.item
        }
    }
}
