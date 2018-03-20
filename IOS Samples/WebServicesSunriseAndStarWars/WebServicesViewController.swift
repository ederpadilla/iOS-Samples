//
//  WebServicesViewController.swift
//  IOS Samples
//
//  Created by Eder Padilla on 29/01/18.
//  Copyright © 2018 Eder Padilla. All rights reserved.
//

import UIKit

class WebServicesViewController: UIViewController {

    @IBOutlet weak var mTvShowTime: UILabel!
    @IBOutlet weak var mTvCityName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buFindSunRise(_ sender: Any) {
        let url = "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22\(mTvCityName.text!)%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys"
        guard let urlTwo = URL(string: url) else{ return }
        URLSession.shared.dataTask(with: urlTwo) { (data, respone, error) in
            
        }
        loadUrl(url: url)
        
    }
    func loadUrl(url : String){
        DispatchQueue.global().async {
            do{
                let appUrl = URL(string : url)!
                let data = try Data(contentsOf : appUrl)
                let json = try JSONSerialization.jsonObject(with: data) as! [String : Any]
                //print("🌮🌮🌮 el jonson \(json)")
                let query = json["query"] as! [String:Any]
                let results = query["results"] as! [String:Any]
                let channel = results["channel"] as! [String:Any]
                let astronomy = channel["astronomy"] as! [String:Any]
                print("🧐🧐🧐 el channel \(channel)")
                DispatchQueue.main.async {
                    self.mTvShowTime.text = "Sunrise is \(astronomy["sunrise"]!)"
                }
                
            }catch{
                DispatchQueue.main.async {
                    self.mTvShowTime.text = " cannot reach server"
                }
            }
        }
       
    }
    


}
