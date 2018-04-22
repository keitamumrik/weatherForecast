//
//  ViewController.swift
//  weatherForecast
//
//  Created by 松村敬太 on 2018/04/22.
//  Copyright © 2018年 KeitaMatsumura. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        cityLabel.text = cityTextField.text
        cityTextField.resignFirstResponder()
        return true
    }
    
    @IBAction func findWeather(_ sender: Any) {
        super.viewDidLoad()
        
        var success = false
        
//        let attemptedUrl = NSURL(string: "http://www.weather-forecast.com/locations/" + self.cityTextField.text!.stringByReplacingOccurrencesOfString(" ", withString: "-") + "/forecasts/latest")

        let attemptedUrl = NSURL(string: "http://www.weather-forecast.com/locations/" + self.cityTextField.text! + "/forecasts/latest")

        if let url = attemptedUrl {
            
            let task = URLSession.shared.dataTask(with: url as URL) { (data, response, error) -> Void in
                
                if let urlContent = data {
                    //データがnilではない
                    print(url)
                    let webContent = NSString(data: urlContent, encoding: String.Encoding.utf8.rawValue)
                    
                    let websiteArray = webContent?.components(separatedBy: "3 days)</span><p class=\"b-forecast__table-description-content\"><span class=\"phrase\">")
                    
                    if websiteArray!.count > 1 {
                        print("websiteArray>1")
//                        let weatherArray = websiteArray![1].componentsSeparatedByString("</span>")
                        let weatherArray = websiteArray![1].components(separatedBy: "</span>")
                        
                        if weatherArray.count > 1 {
                            print("weatherArray>1")
//                            let weatherSummary = weatherArray[0].stringByReplacingOccurrencesOfString("&deg;", withString: "°")
                            let weatherSummary = weatherArray[0].replacingOccurrences(of: "&deg;", with:  "°")
                            
//                            dispatch_async(dispatch_get_main_queue(), { () -> Void in
//
//                                success = true
//
//                                self.resultLabel.text = weatherSummary
//                            }
                            DispatchQueue.main.async {() -> Void in
                                
                            success = true
                                
                            self.resultLabel.text = weatherSummary
                            }
                        }
                    }
                }
            }
            
            task.resume()
            
            if success == false{
                self.resultLabel.text = "Sorry, something went wrong."
            }
        }
        
    }
    override func viewDidLoad() {
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

