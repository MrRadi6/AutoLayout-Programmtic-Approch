//
//  SwipingController.swift
//  AutoLayout
//
//  Created by Ahmed Samir on 2/28/19.
//  Copyright © 2019 MrRadix. All rights reserved.
//

import UIKit



class SwipingController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    
    fileprivate let previousButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(prevHandle), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    fileprivate let nextButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(nextHandle), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    fileprivate lazy var pageController: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        pc.pageIndicatorTintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return pc
    }()
    
    let pages = [PageModel(image: "chatLogo", description: "Lets Chat with the best chatting App Ever made!", additionalText: "Are you Willing to Chat with your friend, then do not hesitate and go for it and use our app to chat with your friends all over the globe for free!"),
                 PageModel(image: "chatFIgure", description: "distinguishes chatting from other text-based online communication forms such as Internet forums ", additionalText: "Online chat in a less stringent definition may be primarily any direct text-based or video-based (webcams), one-on-one chat or one-to-many group chat "),
                 PageModel(image: "moblieChat", description: "Chats are conducted on online services (especially America Online), by bulletin board services", additionalText: "Several Web sites, notably Talk City, exist solely for the purpose of conducting chats. Some chat sites such as Worlds Chat allow participants to assume the role or appearance"),
                 PageModel(image: "testiPeople", description: "One click Guest Chat Rooms without registration", additionalText: "esIChat is a cool place to meet people at random and anonymity without having to register, chat as guest with one click. YesIchat has a number of chatrooms to meet cool new people from around the globe.")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .white
        setupButtomControls()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        cell.page = pages[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (_) in
            
            self.collectionViewLayout.invalidateLayout() // fix the view to show only one Item after rotation
            let indexPath = IndexPath(item: self.pageController.currentPage, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
        }, completion: nil)
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let distanceFromCollection = targetContentOffset.pointee.x // calculate the distance from CollectioView Starting point to the leading for the current Item in the collection "like you spreading a sheet paper"
        pageController.currentPage = Int(distanceFromCollection / view.frame.width)
    }
    
    @objc private func nextHandle(){
        let nextItem = min(pageController.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextItem, section: 0)
        pageController.currentPage = nextItem
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc private func prevHandle(){
        let prevItem = max(pageController.currentPage - 1, 0)
        let indexPath = IndexPath(item: prevItem, section: 0)
        pageController.currentPage = prevItem
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
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
