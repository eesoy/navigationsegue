//
//  EditViewController.swift
//  navigation
//
//  Created by soyoung on 2017. 12. 23..
//  Copyright © 2017년 soyoung. All rights reserved.
//

import UIKit

//프로토콜 생성
protocol UserEditCompleteDelegete{
    func editComplete(swithOnOff: Bool, message: String?, zoomInOut: String?)
}

class EditViewController: UIViewController {
//    var segueId = ""
    var segueId: String? = ""
    var message: String?
    var zoomState: String?
    //delegate 선언
    var mainVC: UserEditCompleteDelegete?

    @IBOutlet weak var lbl_segueId: UILabel!
    @IBOutlet weak var switch_onOff: UISwitch!
    @IBOutlet weak var txt_message: UITextField!
    @IBOutlet weak var btn_zoom: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl_segueId.text = segueId
        txt_message.text = message
        btn_zoom.setTitle(zoomState, for: .normal)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func completeClicked(_ sender: UIButton) {
        //원하는 곳에 delegate넣어서 생성
        mainVC?.editComplete(swithOnOff: switch_onOff.isOn, message: txt_message.text, zoomInOut: btn_zoom.title(for: .normal))
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func zoomClicked(_ sender: UIButton) {
        if btn_zoom.title(for: .normal) == "확대"{
            btn_zoom.setTitle("축소", for: .normal)
        } else if btn_zoom.title(for: .normal) == "축소"{
            btn_zoom.setTitle("확대", for: .normal)
        }
    }
    
    

}
