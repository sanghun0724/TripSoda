//
//  MapViewController.swift
//  TripSoda
//
//  Created by sangheon on 2020/11/07.
//

import UIKit
import MapKit
import DropDown

class MapViewController: UIViewController ,CLLocationManagerDelegate{

    @IBOutlet var myMap:MKMapView!
    @IBOutlet var musicView:UIView!
    @IBOutlet var DrogdownView:UIView!
    
    let locationManager = CLLocationManager()
    let dropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = self
        //정확도 최고로
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        myMap.showsUserLocation = true
        
        musicView.layer.masksToBounds = true // 지정크기를 넘어가면 자르기
        musicView.layer.cornerRadius = 30
        
        DrogdownView = UIView(frame: navigationController?.navigationBar.frame ?? .zero)
        guard let topMenu = navigationController?.navigationBar.topItem?.rightBarButtonItem else {
            return
        }
        dropDown.anchorView = topMenu
    }
    
    @IBAction func menuItem(_ sender:Any) {
        dropDown.dataSource = ["영월역","고씨동굴"]
        dropDown.show()
    }
    
    @IBAction func location(_sender:Any) {
        locationManager.startUpdatingLocation()
        myMap.showsUserLocation = true
        
        self.tabBarItem.title = nil
    }
    
    
    // 위도와 경도, 스팬(영역 폭)을 입력받아 지도에 표시
        func goLocation(latitudeValue: CLLocationDegrees,
                        longtudeValue: CLLocationDegrees,
                        delta span: Double) -> CLLocationCoordinate2D {
            let pLocation = CLLocationCoordinate2DMake(latitudeValue, longtudeValue)
            let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
            let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
            myMap.setRegion(pRegion, animated: true)
            return pLocation
        }

    // 특정 위도와 경도에 핀 설치하고 핀에 타이틀과 서브 타이틀의 문자열 표시
        func setAnnotation(latitudeValue: CLLocationDegrees,
                           longitudeValue: CLLocationDegrees,
                           delta span :Double,
                           title strTitle: String,
                           subtitle strSubTitle:String){
            let annotation = MKPointAnnotation()
            annotation.coordinate = goLocation(latitudeValue: latitudeValue, longtudeValue: longitudeValue, delta: span)
            annotation.title = strTitle
            annotation.subtitle = strSubTitle
            myMap.addAnnotation(annotation)
        }
    
    // 위치 정보에서 국가, 지역, 도로를 추출하여 레이블에 표시
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            let pLocation = locations.last
            _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!,
                       longtudeValue: (pLocation?.coordinate.longitude)!,
                       delta: 0.01)
            CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {(placemarks, error) -> Void in
                let pm = placemarks!.first
                let country = pm!.country
                var address: String = ""
                if country != nil {
                    address = country!
                }
                if pm!.locality != nil {
                    address += " "
                    address += pm!.locality!
                }
                if pm!.thoroughfare != nil {
                    address += " "
                    address += pm!.thoroughfare!
                }
               
            })
            locationManager.stopUpdatingLocation()
        }

}
