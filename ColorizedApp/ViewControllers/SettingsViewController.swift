//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Andrey Sandler on 25.09.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var redColorSlider: UISlider!
    @IBOutlet var greenColorSlider: UISlider!
    @IBOutlet var blueColorSlider: UISlider!
    
    @IBOutlet var mainView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    // MARK: - Public Properties
    var mainViewColor: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.layer.cornerRadius = 20
        setupValue()
        setupMainView()
    }
    
    // MARK: - IB Actions
    @IBAction func slidersAction(_ sender: UISlider) {
        setupMainView()
        
        switch sender {
        case redColorSlider:
            redValueLabel.text = string(from: redColorSlider)
        case greenColorSlider:
            greenValueLabel.text = string(from: greenColorSlider)
        default:
            blueValueLabel.text = string(from: blueColorSlider)
        }
    }
    
    @IBAction func doneButtonDidTapped() {
        dismiss(animated: true)
        delegate.getColor(mainView.backgroundColor ?? .white)
    }
    // MARK: - Private methods
    private func setupMainView() {
        mainView.backgroundColor = UIColor(
            red: CGFloat(redColorSlider.value),
            green: CGFloat(greenColorSlider.value),
            blue: CGFloat(blueColorSlider.value),
            alpha: 1
        )
    }
    
    private func setupValue() {
        redColorSlider.value = Float(mainViewColor.red)
        blueColorSlider.value = Float(mainViewColor.blue)
        greenColorSlider.value = Float(mainViewColor.green)
        
        redValueLabel.text = string(from: redColorSlider)
        greenValueLabel.text = string(from: greenColorSlider)
        blueValueLabel.text = string(from: blueColorSlider)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

// MARK: - Get UIColor RGB
extension UIColor {
    var red: CGFloat {
        CIColor(color: self).red
    }

    var blue: CGFloat {
        CIColor(color: self).blue
    }
    
    var green: CGFloat {
        CIColor(color: self).green
    }
}
