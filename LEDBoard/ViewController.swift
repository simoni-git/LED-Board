//
//  ViewController.swift
//  LEDBoard
//
//  Created by MAC on 2023/03/09.
//

import UIKit

class ViewController: UIViewController , LEDBoardSettingDelegate {

    @IBOutlet weak var contentsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentsLabel.textColor = .yellow
      }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingViewController = segue.destination as? SettingViewController {
            settingViewController.delegate = self
            settingViewController.ledText = self.contentsLabel.text
            settingViewController.textcolor = self.contentsLabel.textColor
            settingViewController.backgroundcolor = self.view.backgroundColor ?? .black
            
        }
    }

    func changedSetting(text: String?, textcolor: UIColor, backgroundcolor: UIColor) {
        if let text = text {
            self.contentsLabel.text = text
        }
        self.contentsLabel.textColor = textcolor
        self.view.backgroundColor = backgroundcolor
    }
    
}

