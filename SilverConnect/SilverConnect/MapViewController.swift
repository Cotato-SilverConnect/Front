import UIKit
import CoreLocation
import MapKit // MapKit Import

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var myLocationBtn: UIButton!
    @IBOutlet weak var mapView: MKMapView! // IBOutlet for MapView
    
    //LocationManager 선언
    var locationManager: CLLocationManager!
    
    //위도와 경도
    var latitude: Double?
    var longitude: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //locationManager 인스턴스 생성 및 델리게이트 생성
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        //포그라운드 상태에서 위치 추적 권한 요청
        locationManager.requestWhenInUseAuthorization()
        
        //배터리에 맞게 권장되는 최적의 정확도
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    @IBAction func myLocationBtnTapped(_ sender: UIButton) {
        //위치업데이트 시작
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //위도 경도 가져오기
        if let coor = locationManager.location?.coordinate {
            latitude = coor.latitude
            longitude = coor.longitude
            
            // 위치 업데이트 종료 (필요에 따라 주석 처리)
            locationManager.stopUpdatingLocation()
            
            //위치 정보 출력 (디버깅용)
            print("latitude: \(latitude ?? 0), longitude: \(longitude ?? 0)")
            
            // 지도 좌표 이동
            let coordinate = CLLocationCoordinate2D(latitude: latitude ?? 0, longitude: longitude ?? 0)
            let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            mapView.setRegion(region, animated: true)
        }
    }
}

