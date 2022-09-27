//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Andrey Sandler on 25.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var redColorSlider: UISlider!
    @IBOutlet var greenColorSlider: UISlider!
    @IBOutlet var blueColorSlider: UISlider!
    
    @IBOutlet var mainView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.layer.cornerRadius = 20
        setupMainView()
        setupValue()
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
        redValueLabel.text = string(from: redColorSlider)
        greenValueLabel.text = string(from: greenColorSlider)
        blueValueLabel.text = string(from: blueColorSlider)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}
