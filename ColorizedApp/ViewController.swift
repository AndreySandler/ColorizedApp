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
    }
    
    // MARK: - IB Actions
    @IBAction func slidersAction() {
        redValueLabel.text = roundingValue(of: redColorSlider).formatted()
        greenValueLabel.text = roundingValue(of: greenColorSlider).formatted()
        blueValueLabel.text = roundingValue(of: blueColorSlider).formatted()
        setupMainView()
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
    
    private func roundingValue(of slider: UISlider) -> Float {
        round(slider.value * 100) / 100
    }
}
