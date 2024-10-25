//
//  ViewController.swift
//  Storyboard
//
//  Created by 서지민 on 10/24/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func BlogButtonTapped(_ sender: UIButton) {
        if let url = URL(string: "https://ios-developer.tistory.com/") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func GithubButtonTapped(_ sender: UIButton) {
        if let url = URL(string: "https://github.com/JIMIN-iOSDev") {
            UIApplication.shared.open(url)
        }
    }
}


