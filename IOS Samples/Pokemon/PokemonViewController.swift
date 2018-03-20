//
//  PokemonViewController.swift
//  IOS Samples
//
//  Created by Eder Padilla on 25/01/18.
//  Copyright © 2018 Eder Padilla. All rights reserved.
//

import UIKit
import GoogleMaps
class PokemonViewController: UIViewController,CLLocationManagerDelegate,GMSMapViewDelegate {
    var mapView : GMSMapView!
    let locationManager = CLLocationManager()
    var oldLocation = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    var listPokemons = [PokemonModel]()
    var playerPower = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        print("🤖Estamos en pokemon!!!!")
        setUpMap()
        loadThePokemons()
        // Do any additional setup after loading the view.
    }
    func setUpMap(){
        let camera = GMSCameraPosition.camera(withLatitude: 43, longitude: -77, zoom: 10)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        do {
            // Set the map style by passing the URL of the local file.
            if let styleURL = Bundle.main.url(forResource: "darkstylejson", withExtension: "json") {
                mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                NSLog("Unable to find style.json")
            }
        } catch {
            NSLog("One or more of the map styles failed to load. \(error)")
        }
        self.view = mapView
        self.mapView .delegate = self
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
        }
    }
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("🤖🤖🤖🤖🤖🤖 \(coordinate.longitude) and latitude \(coordinate.latitude)")
          self.listPokemons.append(PokemonModel(latitude: coordinate.latitude, lontgitud: coordinate.longitude, image: "charmander", name: "Charmander", des: "Char Char!", power: 33, isCatch: false))
        for pokemon in listPokemons{
            if !pokemon.isCatch!{
                let pokeMarker = GMSMarker()
                pokeMarker.position = CLLocationCoordinate2D(latitude: pokemon.latitude!, longitude: pokemon.lontgitud!)
                pokeMarker.title = pokemon.name!
                pokeMarker.snippet = "Pokemon Power \(pokemon.power!), \n \(pokemon.des!)"
                pokeMarker.icon = UIImage(named: pokemon.image!)
                pokeMarker.map = self.mapView
                }
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        oldLocation = manager.location!.coordinate
        let meMarker = GMSMarker()
        meMarker.position = CLLocationCoordinate2D(latitude: oldLocation.latitude, longitude: oldLocation.longitude)
        meMarker.title = "It´s me"
        meMarker.snippet = "Mariiio!"
        meMarker.icon = UIImage(named: "mario")
        self.mapView.clear()
        meMarker.map = self.mapView
        let cameraUpdate = GMSCameraPosition.camera(withLatitude: oldLocation.latitude, longitude: oldLocation.longitude, zoom: 15)
        self.mapView.camera = cameraUpdate
        //show pokemons
        var index = 0
        for pokemon in listPokemons{
            if !pokemon.isCatch!{
            let pokeMarker = GMSMarker()
            pokeMarker.position = CLLocationCoordinate2D(latitude: pokemon.latitude!, longitude: pokemon.lontgitud!)
            pokeMarker.title = pokemon.name!
            pokeMarker.snippet = "Pokemon Power \(pokemon.power!), \n \(pokemon.des!)"
            pokeMarker.icon = UIImage(named: pokemon.image!)
            pokeMarker.map = self.mapView
            if(Double(oldLocation.latitude).roundTo(places: 4)) == (Double(pokemon.latitude!).roundTo(places: 4))
                && Double(oldLocation.longitude).roundTo(places: 4) == (Double(pokemon.lontgitud!).roundTo(places: 4)){
                    listPokemons[index].isCatch = true
                showAlert(Pokemonpower: pokemon.power!)
            }
            index = index + 1
            }
        }
    }
    func loadThePokemons(){
        self.listPokemons.append(PokemonModel(latitude: 19.370446, lontgitud: -99.162954, image: "charmander", name: "Charmander", des: "Char Char!", power: 33, isCatch: false))
          self.listPokemons.append(PokemonModel(latitude: 19.368720, lontgitud: -99.166720, image: "bulbasaur", name: "Bulbasaur", des: "BulbaaaaSaur", power: 29, isCatch: false))
        
        self.listPokemons.append(PokemonModel(latitude: 19.371262, lontgitud: -99.167060, image: "squirtle", name: "Squirtle", des: "Squiiiirtle", power: 30, isCatch: false))
        
    }
    func showAlert(Pokemonpower : Double){
        playerPower = playerPower + Int(Pokemonpower)
        let uiAlert = UIAlertController(title: "Catch a new pokemon", message: "Youre new power is \(playerPower)", preferredStyle: UIAlertControllerStyle.alert)
        uiAlert.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: {
            action in
            print("+ one 🤖🤖🤖🤖")
        }))
        self.present(uiAlert, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
extension Double{
    func roundTo(places : Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self*divisor).rounded()/divisor
    }
}
