//
//  NemoViewController.swift
//  baseProject
//
//  Created by 황석현 on 10/24/24.
//

import UIKit

class NemoViewController: UIViewController {
    
    @IBOutlet weak var mainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainButton.titleLabel?.text = "힘들 때 눌러보기"
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickMainButton(_ sender: UIButton) {

        mainButton.titleLabel?.text = "버 텨"

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
