//
//  ViewController.swift
//  navigation
//
//  Created by soyoung on 2017. 12. 23..
//  Copyright © 2017년 soyoung. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UserEditCompleteDelegete {
    
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var img_lamp: UIImageView!
    var zoomState: String?
    var zoomIn = true
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let vc = segue.destination as? EditViewController {
////            let segueId = segue.identifier {
//            vc.segueId = segue.identifier
//            vc.delegate = self
//        }
        
        guard let editVC = segue.destination as? EditViewController else {return}
        
        //            let segueId = segue.identifier {
        editVC.segueId = segue.identifier
        editVC.message = messageTextField.text
        if zoomIn {
            editVC.zoomState = "확대"
        } else {
            editVC.zoomState = "축소"
        }
        editVC.mainVC = self
        
    }
    
    func editComplete(swithOnOff: Bool, message: String?, zoomInOut: String?) {
        
        img_lamp.image = swithOnOff ?  #imageLiteral(resourceName: "lamp-on") : #imageLiteral(resourceName: "lamp-off")
        messageTextField.text = message
        if zoomInOut == "확대" {
           img_lamp.frame.size = CGSize(width: 300, height: 300)
            zoomIn = true
        } else if zoomInOut == "축소" {
           img_lamp.frame.size = CGSize(width: 100, height: 100)
            zoomIn = false
        }
    }
    
    
    //버튼 이동
    @IBAction func editButtonClicked(sender: Any){
//        let vc = EditViewController(nibName: "", bundle: nil)
//        vc.segueId = "segue id"
//        vc.delegate = self
//        navigationController?.pushViewController(vc, animated: true)
        
        guard let editVC = storyboard?.instantiateViewController(withIdentifier: "editVC") as? EditViewController else {return}
        //객체 멤버 접근
        editVC.segueId = "Button 이동"
        editVC.message = messageTextField.text
        if zoomIn {
            editVC.zoomState = "확대"
        } else {
            editVC.zoomState = "축소"
        }
        editVC.mainVC = self
        navigationController?.pushViewController(editVC, animated: true)
        
    }


}

