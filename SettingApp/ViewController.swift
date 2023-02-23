//
//  ViewController.swift
//  SettingApp
//
//  Created by eun-ji on 2023/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    // 여러 배열을 넣어줄수있는 settingModel 변수 선언
    var settingModel = [[SettingModel]]()
    
    
    @IBOutlet weak var settingTableView: UITableView!
    
    // makeData 메서드 생성
    func makeData(){
        //settinModel에 배열 append 해주기
        settingModel.append(
        [SettingModel(leftImageName: "person.circle", menuTitle: "Sign in to your iPhone", subTitle: "Set up iCloud, the App Store, and more", rightImageName: nil )]
        )
        
        settingModel.append(
       [ SettingModel(leftImageName: "gear", menuTitle: "General", subTitle: nil, rightImageName: "chevron.right"),
        SettingModel(leftImageName: "person.fill", menuTitle: "Accessibility", subTitle: nil, rightImageName: "chevron.right"),
        SettingModel(leftImageName: "hand.raised.fill", menuTitle: "Privacy", subTitle: nil, rightImageName: "chevron.right")]
        )
    }
    
    override func viewWillAppear(_ animated: Bool) { // view가 나타나는 시점
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true // 네비게이션 상단 바 title 지정
    }
    
    // 처음생성될 때 한번만
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.backgroundColor = UIColor(white: 245/255, alpha: 1)
        // Do any additional setup after loading the view.
        
        // xib 등록
        settingTableView.register(UINib(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "ProfileCell")
        
        settingTableView.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
        title = "Settings"
        
        self.view.backgroundColor =  UIColor(white: 245/255, alpha: 1)
        makeData()
        
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    //section별 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingModel[section].count
    }
    //section 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingModel.count
    }
    
    // 셀 눌렀을 때 화면 전환
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // MyIDViewController로 화면이동
        if indexPath.section == 0 && indexPath.row == 0 {// 0번째 section, 0번째 row
           let myidVC =  MyIDViewController(nibName: "MyIDViewController", bundle: nil)
            
            self.present(myidVC, animated: true, completion: nil)
        }
        // GeneralViewController로 화면이동
        else if indexPath.section == 1 && indexPath.row == 0 { // 1번째 section, 0번째 row
            if let generalVC = UIStoryboard(name: "GeneralViewController", bundle: nil).instantiateViewController(identifier: "GeneralViewController") as?  GeneralViewController{
                self.navigationController?.pushViewController(generalVC, animated: true)
            }
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 0번째 section에 만든 커스텀셀(ProfileCell 적용
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
            cell.topTitle.text =  settingModel[indexPath.section][indexPath.row].menuTitle
            cell.profileImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].leftImageName)
            cell.bottonDescription.text = settingModel[indexPath.section][indexPath.row].subTitle
            
            return cell
        }
        
        // 1번째 section에 커스텀셀(MenuCell) 적용
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        cell.leftImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].leftImageName)
        cell.leftImageView.tintColor = .red
        cell.middleTitle.text = settingModel[indexPath.section][indexPath.row].menuTitle
        cell.rightImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].rightImageName ?? "")
        
        return cell
    }
    
    // 0번째 셀 높이 잡기
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return UITableView.automaticDimension // 셀 자동 크기조절
        }
        return 60
    }
    
}
