//
//  SettingViewController.swift
//  LEDBoard
//
//  Created by MAC on 2023/03/09.
//

import UIKit

protocol LEDBoardSettingDelegate : AnyObject {
    func changedSetting(text: String? , textcolor: UIColor , backgroundcolor: UIColor)
    //위에 괄호부분에있는 text , textcolor , backgroundcolor 부분도 강사랑 색깔다름 , 강사는 흰색임
}



class SettingViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    
    weak var delegate: LEDBoardSettingDelegate?
    var ledText : String?
    var textcolor: UIColor = .yellow
    var backgroundcolor : UIColor = .black
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureview()
       }
    
    private func configureview() {
        if let  ledText = self.ledText {
            self.textField.text = ledText
        }
        self .changeTextColor(color: self.textcolor)
        self.ChangeBackgroundColorButton(color: self.backgroundcolor)
    }
    
    @IBAction func tapTextColorButton(_ sender: UIButton) {
        if sender == self.yellowButton {
            self.changeTextColor(color: .yellow )
            self.textcolor = .yellow
        } else if sender == self.purpleButton {
            self.changeTextColor(color: .purple)
            self.textcolor = .purple
        } else  {
            self.changeTextColor(color: .green)
            self.textcolor = .green
        }
    }
    
    @IBAction func tapBackgroundColorButton(_ sender: UIButton) {
        
        if sender == self.blackButton {
            self.ChangeBackgroundColorButton(color: .black)
            self .backgroundcolor = .black
        } else if sender == self.blueButton {
            self.ChangeBackgroundColorButton(color: .blue)
            self .backgroundcolor = .blue
        } else {
            self.ChangeBackgroundColorButton(color: .orange)
            self.backgroundcolor = .orange
        }
    }
    
    @IBAction func tapSaveButton(_ sender: UIButton) {
        self .delegate?.changedSetting(
            text: self.textField.text,
            textcolor: self.textcolor,
            backgroundcolor: self.backgroundcolor)
        
        self .navigationController?.popViewController(animated: true)
    }
    private func changeTextColor(color: UIColor) {
        //강사는 위에 changeTextcolor다음 괄호안에있는 color 이 흰색으로나옴. 나랑 이부분이달라서 혹시나어플안되면 이부분다시볼것
        //강의 6분22초 기능구현하기1
        self .yellowButton.alpha = color == UIColor.yellow ? 1 : 0.2
        self .purpleButton.alpha = color == UIColor.purple ? 1 : 0.2
        self .greenButton.alpha = color == UIColor.green ? 1 : 0.2
        
    }
    
    private func ChangeBackgroundColorButton(color: UIColor) {
        //얘도 위에랑 마찬가지
        self .blackButton.alpha = color == UIColor.black ? 1 : 0.2
        self .blueButton.alpha = color == UIColor.blue ? 1 : 0.2
        self .orangeButton.alpha = color == UIColor.orange ? 1 : 0.2
        
    }
}
