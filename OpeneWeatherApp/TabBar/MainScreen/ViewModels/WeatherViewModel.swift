import Foundation
import CoreLocation

final class WeatherViewModel {
    //MARK: Constants
    private let locationManager = LocationManager()
    
    //MARK: Variables
    private var weatherData = Bindable<Weather>()
    private var isLoadingdata = Bindable<Bool>()
    private var isUpdateData = false
    
    //MARK: Lifecycle
    init() {
        NotificationCenter.default.addObserver(self, 
                                               selector: #selector(checkLocation),
                                               name: Notification.Name(rawValue: "isLocationChanged"),
                                               object: nil)
        checkLocation()
    }
    //MARK: - Methods
    func refreshWeatherData() {
        isUpdateData = true
        checkLocation()
    }
    
    //MARK: Location Methods
    @objc func checkLocation() {
        guard let authorizedLocation = locationManager.isAutorizedLocation else { return }
        
    }
    
    func getLocationCoordinates() -> CLLocation {
        guard let exposedLocation = locationManager.exposedLocation else {
            return CLLocation(latitude: 0.0, longitude: 0.0)
        }
        return exposedLocation
    }
    
    func getLocationPlace(_ coordinates: CLLocation, completion: @escaping (String) -> Void) {
        self.locationManager.getPlace(for: CLLocation(latitude: coordinates.coordinate.latitude,
                                                      longitude: coordinates.coordinate.longitude)) { placemark in
            guard let placemark = placemark else { return }
            
            if let townName = placemark.locality {
                completion(townName)
            }
        }
    }
    
}

//MARK: - Extensions
    //MARK: API Call
extension WeatherViewModel {
    func getWeatherForLocation(_ coordinates: CLLocation, city: String, lang: String) {
        
    }
}

