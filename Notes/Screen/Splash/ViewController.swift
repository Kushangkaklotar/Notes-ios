//
//  ViewController.swift
//  demo
//
//  Created by Kushang  on 04/10/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeScreen") as? HomeScreen {
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }


}

