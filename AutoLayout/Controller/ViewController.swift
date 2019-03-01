//
//  ViewController.swift
//  AutoLayout
//
//  Created by Ahmed Samir on 2/28/19.
//  Copyright © 2019 MrRadix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let topImageViewContainer = UIView()
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "chatLogo"))
        // enable auto layout for our ImageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let descriptionTextView: UITextView = {
       let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Lets Chat with the best chatting App Ever made!",
                                                       attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)])
        attributedText.append(NSAttributedString(string: "\n\n\nAre you Willing to Chat with your friend, then do not hesitate and go for it and use our app to chat with your friends all over the globe for free!",
                                                 attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 14),
                                                              NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let previousButton: UIButton = {
       let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return button
    }()
    
    private let nextButton: UIButton = {
       let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return button
    }()
    
    private let pageController: UIPageControl = {
       let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        pc.pageIndicatorTintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupImageLayout()
        setupTextLayout()
        setupButtomControls()
    }

    private func setupImageLayout(){
        // ImageViewContainer Configuration
        view.addSubview(topImageViewContainer)
        
        topImageViewContainer.translatesAutoresizingMaskIntoConstraints = false
        topImageViewContainer.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageViewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageViewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topImageViewContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        topImageViewContainer.addSubview(logoImageView)
        //ImageView Configuration
        //        imageView.frame = CGRect(x: 200, y: 200, width: 200, height: 200)
        logoImageView.centerXAnchor.constraint(equalTo: topImageViewContainer.centerXAnchor).isActive = true
        logoImageView.centerYAnchor.constraint(equalTo: topImageViewContainer.centerYAnchor).isActive = true
        logoImageView.heightAnchor.constraint(equalTo: topImageViewContainer.heightAnchor, multiplier: 0.5)
        
        
    }
    
    private func setupTextLayout(){
        view.addSubview(descriptionTextView)
        descriptionTextView.topAnchor.constraint(equalTo: topImageViewContainer.bottomAnchor, constant: 60).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    private func setupButtomControls(){
        let bottomPanelView = UIStackView(arrangedSubviews: [previousButton,pageController,nextButton])
        view.addSubview(bottomPanelView)
        bottomPanelView.translatesAutoresizingMaskIntoConstraints = false
        bottomPanelView.distribution = .fillEqually
        
        NSLayoutConstraint.activate([
            bottomPanelView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomPanelView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomPanelView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomPanelView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
}

