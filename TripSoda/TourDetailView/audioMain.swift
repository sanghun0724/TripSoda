//
//  audioMain.swift
//  TripSoda
//
//  Created by sangheon on 2020/11/07.
//

import UIKit
import AVFoundation

class audioMain: UIViewController,AVAudioPlayerDelegate,UICollectionViewDelegateFlowLayout{

    var player: AVAudioPlayer!
    var timer: Timer!
    
    
    @IBOutlet weak var layoutCell: UICollectionViewFlowLayout! {
        didSet{
            layoutCell.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    @IBOutlet var decoTopView:UIView!
    @IBOutlet var decoMusicView:UIView!
    @IBOutlet var playPauseButton: UIButton!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var progressSlider: UISlider!
    @IBOutlet var collectionView:UICollectionView!
    
    // Problem: Push로 했는데도 탭바가 자꾸 없어짐 -> 각 여행지에 맞는 음악파일에따라 맞게 prepare 메소드로
    // 전달하면서 sague 써보기
    
    let collectionDatasource = audioMainCollection()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.decoTopView.layer.cornerRadius = 25
        self.decoMusicView.layer.cornerRadius = 25
        decoMusicView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        decoTopView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        playPauseButton.setImage(UIImage(named:"play-button" ), for: UIControl.State.normal)
        playPauseButton.setImage(UIImage(named:"pause"), for: UIControl.State.selected)
        initializePlayer()
        collectionView.delegate = collectionDatasource
        collectionView.dataSource = collectionDatasource
        UIDesine()
        collectionView.reloadData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func backButton(_ sender:Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

    func UIDesine() {
        let collectionViewLayout:UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.minimumLineSpacing = 20
            layout.sectionInset = UIEdgeInsets.zero
            layout.scrollDirection = .horizontal
            layout.itemSize = CGSize(width: view.bounds.width, height: collectionView.bounds.height)
            return layout
        }()
        collectionView.collectionViewLayout = collectionViewLayout
    }
    
    func initializePlayer() {
        
        guard let soundAsset: NSDataAsset = NSDataAsset(name: "sound") else {
            print("음원 파일 에셋을 가져올 수 없습니다")
            return
        }
        
        do {
            try self.player = AVAudioPlayer(data: soundAsset.data)
            self.player.delegate = self
        } catch let error as NSError {
            print("플레이어 초기화 실패")
            print("코드 : \(error.code), 메세지 : \(error.localizedDescription)")
        }
        
        self.progressSlider.maximumValue = Float(self.player.duration)
        self.progressSlider.minimumValue = 0
        self.progressSlider.value = Float(self.player.currentTime)
    }
    
    func updateTimeLabelText(time: TimeInterval) {
        let minute: Int = Int(time / 60)
        let second: Int = Int(time.truncatingRemainder(dividingBy: 60))
        let milisecond: Int = Int(time.truncatingRemainder(dividingBy: 1) * 100)
        
        let timeText: String = String(format: "%02ld:%02ld", minute, second, milisecond)
        
        self.timeLabel.text = timeText
    }
    
    func makeAndFireTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [unowned self] (timer: Timer) in
          
            if self.progressSlider.isTracking { return }
            
            self.updateTimeLabelText(time: self.player.currentTime)
            self.progressSlider.value = Float(self.player.currentTime)
        })
        self.timer.fire()
    }
    
    func invalidateTimer() {
        self.timer.invalidate()
        self.timer = nil
    }
    @IBAction func touchUpPlayPauseButton(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            self.player?.play()
        } else {
            self.player?.pause()
        }
        
        if sender.isSelected {
            self.makeAndFireTimer()
        } else {
            self.invalidateTimer()
        }
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        self.updateTimeLabelText(time: TimeInterval(sender.value))
        if sender.isTracking { return }
        self.player.currentTime = TimeInterval(sender.value)
    }
    
    
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        
        guard let error: Error = error else {
            print("오디오 플레이어 디코드 오류발생")
            return
        }
        
        let message: String
        message = "오디오 플레이어 오류 발생 \(error.localizedDescription)"
        
        let alert: UIAlertController = UIAlertController(title: "알림", message: message, preferredStyle: UIAlertController.Style.alert)
        
        let okAction: UIAlertAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default) { (action: UIAlertAction) -> Void in
            
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        self.playPauseButton.isSelected = false
        self.progressSlider.value = 0
        self.updateTimeLabelText(time: 0)
        self.invalidateTimer()
    }
    
}
