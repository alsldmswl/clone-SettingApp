//
//  MyIDViewController.swift
//  SettingApp
//
//  Created by eun-ji on 2023/02/23.
//

import UIKit

class MyIDViewController: UIViewController {

    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var cancleBtn: UIButton!
    @IBOutlet weak var emailTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTf.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        textFieldDidChange(sender: emailTf)
    }

    @objc func textFieldDidChange(sender: UITextField) {
        if sender.text?.isEmpty == true {
            nextBtn.isEnabled = false
        } else {
            nextBtn.isEnabled = true
        }
        
    }
   
    @IBAction func doCancle(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
