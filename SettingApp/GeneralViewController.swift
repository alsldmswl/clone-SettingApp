//
//  GeneralViewController.swift
//  SettingApp
//
//  Created by eun-ji on 2023/02/23.
//

import UIKit

class GeneralCell: UITableViewCell {
    
    @IBOutlet weak var leftLable: UILabel!
    @IBOutlet weak var rightImageView: UIImageView! {
        didSet { // didset - 처음 세팅 할때
            rightImageView.image = UIImage.init(systemName: "chevron.right")
            rightImageView.tintColor = .lightGray
        }
    }

}

struct GeneralModel {
    var leftTitle = ""
}

class GeneralViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var model = [[GeneralModel]]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GeneralCell", for: indexPath) as! GeneralCell
        cell.leftLable.text = model[indexPath.section][indexPath.row].leftTitle
        
        return cell
    }
    
    

    @IBOutlet weak var generalTableView: UITableView!
    
    func makeData() {
        //0번째 섹션
        model.append([GeneralModel(leftTitle: "About")])
        
        //1번째 섹션
        model.append([GeneralModel(leftTitle: "Keyboard"),
        GeneralModel(leftTitle: "Game Controller"),
        GeneralModel(leftTitle: "Fonts"),
        GeneralModel(leftTitle: "Language & Region"),
        GeneralModel(leftTitle: "Dictionary")])
        
        //3번째 섹션
        model.append( [GeneralModel(leftTitle: "Reset")])

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "General"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        generalTableView.delegate = self
        generalTableView.dataSource = self
        generalTableView.backgroundColor = UIColor(white: 245/255, alpha: 1)

        makeData()
    }
 
}
