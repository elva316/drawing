//
//  ViewController.swift
//  shawdow view testing
//
//  Created by elva wang on 11/27/17.
//  Copyright © 2017 elva wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var drawView: DrawView!
    @IBAction func erasePressed(_ sender: UIButton) {
        drawView.erase()
//        drawView.isErased = true
        print("Erased xxxxxxx")
    }
    @IBAction func red(_ sender: UIButton) {
        drawView.strokeColor = UIColor.red.cgColor
        print("Red xxxxxxx")
    }
    @IBAction func blue(_ sender: UIButton) {
        drawView.strokeColor = UIColor.blue.cgColor
        print("Blue xxxxxx")
    }
    @IBAction func green(_ sender: UIButton) {
        drawView.strokeColor = UIColor.green.cgColor
        print("green xxxxx")
    }
    
    
    
    

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//

}

