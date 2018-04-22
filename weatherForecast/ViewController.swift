//
//  ViewController.swift
//  weatherForecast
//
//  Created by 松村敬太 on 2018/04/22.
//  Copyright © 2018年 KeitaMatsumura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    

    @IBAction func findWeather(_ sender: Any) {
        super.viewDidLoad()
        
    }
    override func viewDidLoad() {
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

