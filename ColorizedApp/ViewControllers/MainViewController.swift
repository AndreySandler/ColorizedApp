//
//  MainViewController.swift
//  ColorizedApp
//
//  Created by Andrey Sandler on 11.10.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func getColor(_ color: UIColor)
}

class MainViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        
        settingsVC.mainViewColor = view.backgroundColor
        settingsVC.delegate = self
    }
}

// MARK: - SettingsViewControllerDelegate
extension MainViewController: SettingsViewControllerDelegate {
    func getColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
