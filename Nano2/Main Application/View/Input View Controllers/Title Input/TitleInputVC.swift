//
//  TitleInputVC.swift
//  Nano2
//
//  Created by Stephen Giovanni Saputra on 25/07/22.
//

import UIKit

class TitleInputVC: UIViewController {

    //MARK: - Properties
    private lazy var largeTitleLabel: RLabel = {
        let label = RLabel(style: .largeTitle, textString: "Let’s write your Reflections")
        return label
    }()
    
    private lazy var headingLabel: RLabel = {
        let label = RLabel(style: .heading, textString: "First, let’s write\ndown a Title")
        return label
    }()
    
    private lazy var bodyLabel: RLabel = {
        let label = RLabel(style: .body, textString: "It could be anything you want 😚")
        return label
    }()
    
    internal lazy var reflectionsTitleTF: RTextField = {
        let tf = RTextField(placeholderText: "Reflections Title")
        tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        return tf
    }()
    
    internal lazy var nextButton: RTButton = {
        let button = RTButton(isEnabled: false, style: .normal, text: "Next", #selector(handleNextButtonTapped), self)
        return button
    }()
    
    private lazy var settingsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "settingsIcon")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .textColor
        button.addTarget(self, action: #selector(handleSettingsButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureUI()
        configureTextFieldObservers()
        
        RKeyboard().slideViewWhenShowKeyboard(self, #selector(self.keyboardWillShow(notification:)), #selector(self.keyboardWillHide))
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK: - Selectors
    @objc func handleNextButtonTapped() {
        UserDefaults.standard.set(reflectionsTitleTF.text ?? "", forKey: "reflectionTitle")
        navigationController?.pushViewController(EmojiPickerVC(), animated: true)
    }
    
    @objc func handleSettingsButtonTapped() {
        navigationController?.pushViewController(SettingsVC(), animated: true)
    }
    
    //MARK: - Helpers
    func configureUI() {
        
        view.backgroundColor = .backgroundColor
        
        view.addSubview(settingsButton)
        settingsButton.setDimensions(
            height: view.frame.height / 19.2,
            width: view.frame.width / 8.53)
        settingsButton.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            right: view.rightAnchor,
            paddingTop: 26,
            paddingRight: 10
        )
        
        view.addSubview(largeTitleLabel)
        largeTitleLabel.anchor(
            top: view.topAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingTop: UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0 > 20 ? 140 : 100,
            paddingLeft: 20,
            paddingRight: 20
        )
        
        view.addSubview(headingLabel)
        headingLabel.anchor(
            top: largeTitleLabel.bottomAnchor,
            left: view.leftAnchor,
            paddingTop: view.frame.height / 10.68,
            paddingLeft: 20
        )
        
        view.addSubview(bodyLabel)
        bodyLabel.centerX(inView: view)
        bodyLabel.anchor(
            top: headingLabel.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingTop: 25,
            paddingLeft: 20,
            paddingRight: 20
        )
        
        view.addSubview(reflectionsTitleTF)
        reflectionsTitleTF.anchor(
            top: bodyLabel.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingTop: 60,
            paddingLeft: 20,
            paddingRight: 20
        )
        
        view.addSubview(nextButton)
        nextButton.centerX(inView: view)
        nextButton.anchor(
            left: view.leftAnchor,
            bottom: view.safeAreaLayoutGuide.bottomAnchor,
            paddingLeft: 20,
            paddingBottom: 20
        )
    }
}
