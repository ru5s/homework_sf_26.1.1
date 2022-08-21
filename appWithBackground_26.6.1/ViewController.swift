//
//  ViewController.swift
//  appWithBackground_26.6.1
//
//  Created by Ruslan Ismailov on 21/08/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchTheme: UISwitch!
    
    @IBOutlet weak var labelOfTheme: UILabel!
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var alternaitiveShiftButton: UIButton!
    
    
    @IBOutlet weak var labelAboveAltBtn: UILabel!
    
    let myState = UserDefaults.standard
    var state: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        state =  myState.bool(forKey: "theme")
        
        alternaitiveShiftButton.layer.cornerRadius = 5

        themeState()
    }
    
    func themeState(){
        !state ? dark() : light()
    }
    
    @IBAction func switchThemeAction(_ sender: Any) {
        switchTheme.isOn ? dark() : light()
        switchTheme.isOn ? myState.set(false, forKey: "theme") : myState.set(true, forKey: "theme")
        state = !state
    }
    
    @IBAction func actionAlternativeShiftButton(_ sender: Any) {
        state ? dark() : light()
        state = !state
        state ? myState.set(true, forKey: "theme") : myState.set(false, forKey: "theme")
        
    }
    
    
    func light(){
        switchTheme.isOn = false
        mainImageView.image = UIImage(named: "Merilyn light")
        view.backgroundColor = .white
        labelOfTheme.text = "Light"
        labelOfTheme.textColor = .black
        alternaitiveShiftButton.backgroundColor = .black
        alternaitiveShiftButton.setTitle("Switch to dark", for: .normal)
        alternaitiveShiftButton.setTitleColor(.white, for: .normal)
        labelAboveAltBtn.textColor = .black
    }
    
    func dark(){
        switchTheme.isOn = true
        mainImageView.image = UIImage(named: "Merilyn dark")
        view.backgroundColor = .black
        labelOfTheme.text = "Dark"
        labelOfTheme.textColor = .white
        alternaitiveShiftButton.backgroundColor = .white
        alternaitiveShiftButton.setTitle("Switch to light", for: .normal)
        alternaitiveShiftButton.setTitleColor(.black, for: .normal)
        labelAboveAltBtn.textColor = .white
    }
    
}

