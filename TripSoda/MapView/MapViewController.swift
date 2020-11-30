//
//  MapViewController.swift
//  TripSoda
//
//  Created by sangheon on 2020/11/07.
//

import UIKit
import MapKit


class MapViewController: UIViewController ,CLLocationManagerDelegate,MKMapViewDelegate{
    
    @IBOutlet var myMap:MKMapView!
    @IBOutlet var locationView:UIView!

    let locationManager = CLLocationManager()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationView.layer.masksToBounds = true
        self.locationView.layer.cornerRadius = locationView.frame.width/2
        locationManager.delegate = self
        //정확도 최고로
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        myMap.showsUserLocation = true
        myMap.delegate = self
    
      
            
        setAnnotation(latitudeValue: 37.566831, longitudeValue: 127.030945, delta: 0.1, title: "영월 Y파크", subtitle: "영월에 대한 소개")
        

    }
    
    @IBAction func location(_sender:Any) {
        locationManager.startUpdatingLocation()
        myMap.showsUserLocation = true
            
    }
    
    func mapViewSE(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {

           print("viewForannotation")
           if annotation is MKUserLocation {
               //return nil
               return nil
           }

           let reuseId = "pin"
           var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView

           if pinView == nil {
               //println("Pinview was nil")
               pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
               pinView!.canShowCallout = true
               pinView!.animatesDrop = true
           }
        var button = UIButton(type: UIButton.ButtonType.detailDisclosure) as UIButton // button with info sign in it

                pinView?.rightCalloutAccessoryView = button


                return pinView
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
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
           let popupVC = storyBoard.instantiateViewController(withIdentifier: "PopupViewController")
           popupVC.modalPresentationStyle = .overCurrentContext
           present(popupVC, animated: true, completion: nil)
    }
}
