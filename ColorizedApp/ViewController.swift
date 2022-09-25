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
        setupLabels()
    }
    
    // MARK: - Private properties
    
    
    // MARK: - IB Actions
    @IBAction func redColorSliderAction() {
        let x = round(redColorSlider.value * 100) / 100
        redValueLabel.text = x.formatted()
        setupMainView()
    }
    
    @IBAction func greenColorSliderAction() {
        let x = round(greenColorSlider.value * 100) / 100
        greenValueLabel.text = x.formatted()
        setupMainView()
    }
    
    @IBAction func blueColorSliderAction() {
        let x = round(blueColorSlider.value * 100) / 100
        blueValueLabel.text = x.formatted()
        setupMainView()
    }
    
    // MARK: - Private methods
    private func setupLabels() {
        redValueLabel.text = "0"
        greenValueLabel.text = "0"
        blueValueLabel.text = "0"
    }
    
    private func setupMainView() {
        mainView.backgroundColor = UIColor(
            red: CGFloat(redColorSlider.value),
            green: CGFloat(greenColorSlider.value),
            blue: CGFloat(blueColorSlider.value),
            alpha: 1
        )
    }
}

