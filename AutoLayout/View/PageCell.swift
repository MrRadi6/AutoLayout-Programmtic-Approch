//
//  PageCell.swift
//  AutoLayout
//
//  Created by Ahmed Samir on 2/28/19.
//  Copyright © 2019 MrRadix. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell{
    
    var page:PageModel?{
        
        didSet{
            guard let unwrappedPage = page else{return}
            logoImageView.image = UIImage(named: unwrappedPage.image)
            let attributedText = NSMutableAttributedString(string: unwrappedPage.description,
                                                           attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)])
            attributedText.append(NSAttributedString(string: "\n\n\n\(unwrappedPage.additionalText)",
                                                     attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 14),
                                                                  NSAttributedString.Key.foregroundColor: UIColor.gray]))
            descriptionTextView.isEditable = false
            descriptionTextView.isScrollEnabled = false
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
            
        }
    }
    
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
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupImageLayout()
        setupTextLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupImageLayout(){
        // ImageViewContainer Configuration
        addSubview(topImageViewContainer)
        
        topImageViewContainer.translatesAutoresizingMaskIntoConstraints = false
        topImageViewContainer.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageViewContainer.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageViewContainer.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topImageViewContainer.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        topImageViewContainer.addSubview(logoImageView)
        //ImageView Configuration
        //        imageView.frame = CGRect(x: 200, y: 200, width: 200, height: 200)
        logoImageView.centerXAnchor.constraint(equalTo: topImageViewContainer.centerXAnchor).isActive = true
        logoImageView.centerYAnchor.constraint(equalTo: topImageViewContainer.centerYAnchor).isActive = true
        logoImageView.heightAnchor.constraint(equalTo: topImageViewContainer.heightAnchor, multiplier: 0.5).isActive = true
        logoImageView.widthAnchor.constraint(equalTo: topImageViewContainer.widthAnchor).isActive = true
        
        
    }
    
    private func setupTextLayout(){
        addSubview(descriptionTextView)
        descriptionTextView.topAnchor.constraint(equalTo: topImageViewContainer.bottomAnchor).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
}
