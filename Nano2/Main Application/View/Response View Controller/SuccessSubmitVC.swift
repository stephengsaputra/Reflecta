//
//  SuccessSubmitVC.swift
//  Nano2
//
//  Created by Stephen Giovanni Saputra on 25/07/22.
//

import UIKit

class SuccessSubmitVC: UIViewController {

    //MARK: - Properties
    private lazy var headingLabel: RLabel = {
        let label = RLabel(style: .heading, textString: "Success!!")
        return label
    }()
    
    private lazy var illustrationImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "successSend")?.withRenderingMode(.alwaysOriginal)
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var bodyLabel1: RLabel = {
        let label = RLabel(style: .body, textString: "Your Reflection has been successfully uploaded to your Notion database!")
        return label
    }()
    
    private lazy var bodyLabel2: UILabel = {
        let label = RLabel(style: .body, textString: "Remember to keep writing your Reflections everyday consistently 🔥")
        return label
    }()
    
    private lazy var backToMainButton: RTButton = {
        let button = RTButton(isEnabled: true, style: .normal, text: "Back to main", #selector(handleButtonTapped), self)
        return button
    }()
    
    let sceneDelegate = UIApplication.shared.connectedScenes.first
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    @objc func handleButtonTapped() {
        
        UserDefaults.standard.set("", forKey: "reflectionTitle")
        UserDefaults.standard.set("", forKey: "reflectionBody")
        
        if let scene: SceneDelegate = (self.sceneDelegate?.delegate as? SceneDelegate) {
            scene.setToMain()
        }
    }
    
    //MARK: - Helpers
    func configureUI() {
        
        RVibration().vibrate(for: .success)
        view.backgroundColor = .backgroundColor
        
        view.addSubview(headingLabel)
        headingLabel.anchor(
            top: view.topAnchor,
            left: view.leftAnchor,
            paddingTop: UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0 > 20 ? 120 : 80,
            paddingLeft: 20
        )
        
        view.addSubview(illustrationImage)
        illustrationImage.centerX(inView: view)
        illustrationImage.anchor(
            top: headingLabel.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingTop: 0,
            paddingLeft: 0,
            paddingRight: 0
        )
        
        view.addSubview(bodyLabel1)
        bodyLabel1.centerX(inView: view)
        bodyLabel1.anchor(
            top: illustrationImage.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingTop: 0,
            paddingLeft: 20,
            paddingRight: 20
        )
        
        view.addSubview(bodyLabel2)
        bodyLabel2.centerX(inView: view)
        bodyLabel2.anchor(
            top: bodyLabel1.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingTop: 25,
            paddingLeft: 20,
            paddingRight: 20
        )
        
        view.addSubview(backToMainButton)
        backToMainButton.centerX(inView: view)
        backToMainButton.anchor(
            left: view.leftAnchor,
            bottom: view.safeAreaLayoutGuide.bottomAnchor,
            paddingLeft: 20,
            paddingBottom: 20
        )
    }
}
