//
//  AppTextField.swift
//  Nano2
//
//  Created by Stephen Giovanni Saputra on 24/07/22.
//

import UIKit

class AppTextField: UITextField {

    //MARK: - Initializers
    public private(set) var placeholderText: String
    
    init(placeholderText: String) {
        
        self.placeholderText = placeholderText
        super.init(frame: .zero)
        configureTF()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    private func configureTF() {
        
        configureTFStyle()
    }
    
    private func configureTFStyle() {
        
        var bottomLine: CALayer = {
            let line = CALayer()
            line.frame = CGRect(
                x: 0.0,
                y: 35,
                width: UIScreen.main.bounds.width - 40,
                height: 1.0
            )
            line.backgroundColor = UIColor.textColor?.cgColor
            return line
        }()
        
        self.autocapitalizationType = .none
        self.keyboardType = .default
        self.borderStyle = .none
        self.textColor = .textColor
        self.font = UIFont.textField()
        self.layer.addSublayer(bottomLine)
        self.attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor(named: "tFHintTextColor"),
                .font: UIFont.textField()
            ]
        )
    }
}