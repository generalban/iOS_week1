// SeongsooViewController.swift
// 임성수 개인 자유페이지 관리 ViewController
// 작성자: SeongsooLim
// 작성일: 2024-10-24

import UIKit
import WebKit

class SeongsooViewController: UIViewController {
    
    @IBOutlet weak var seongsooWebView: WKWebView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let url = URL(string: "https://imseongto.vercel.app")!
        
        seongsooWebView.load(URLRequest(url: url))
        
    }
    

}
