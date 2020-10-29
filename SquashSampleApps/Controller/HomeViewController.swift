//
//  HomeViewController.swift
//  SquashSampleApps
//
//  Created by Jack on 28/10/20.
//  Copyright © 2020 SquashApps. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    var countData = [String]()
    var menuData = [String]()
    
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var menuTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countData = ["15K","1000","500","15K","1000","500","15K","1000","500"]
        menuData = ["Share", "Report"]
        
        self.homeCollectionView.register(UINib (nibName: "ImageViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCell")
        self.homeCollectionView.register(UINib (nibName: "ProfileViewCell", bundle: nil), forCellWithReuseIdentifier: "ProfileCell")
        
        self.menuTable.register(UINib (nibName: "MenuViewCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
        self.menuView.layer.cornerRadius = 10
        
        self.homeCollectionView.reloadData()
        self.menuTable.reloadData()
        
        self.menuTable.rowHeight = UITableView.automaticDimension;
        self.menuTable.estimatedRowHeight = 44.0;
        
        
        homeCollectionView!.dataSource = self
        homeCollectionView!.delegate = self
        
        menuTable!.delegate = self
        menuTable!.dataSource = self
        
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: screenWidth/3, height: screenWidth/3)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        homeCollectionView!.collectionViewLayout = layout
        self.menuView.isHidden = true
        
    }
    
    @IBAction func menuBtnAction(_ sender: Any) {
        
        self.menuView.isHidden = false
        
    }
}

//MARK:- Collection View Data Source

extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 9
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCell", for: indexPath) as! ProfileViewCell
            cell.userProfileImageView.layer.cornerRadius =  cell.userProfileImageView.frame.height/2
            cell.tickImageView.layer.cornerRadius =  cell.tickImageView.frame.height/2
            cell.followBtnRef.layer.cornerRadius =  cell.followBtnRef.frame.height/2
            cell.messageSendView.layer.cornerRadius =  cell.messageSendView.frame.height/2
            cell.tickView.layer.cornerRadius =  cell.tickView.frame.height/2
            return cell
        case 1:
            let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageViewCell
            cell.frame.size.width = screenWidth / 3
            cell.viewCountLabel.text = countData[indexPath.row]
            return cell
        default:
            return UICollectionViewCell()
        }
        
        
        
    }
}

//MARK:- CollectionView Delegate and FlowLayout

extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        switch indexPath.section {
        case 0:
            return CGSize(width: self.homeCollectionView.frame.width, height: 450);
        default:
            return CGSize(width: screenWidth/3, height: 200);
        }
        
    }
    
}

//MARK:- TableView DataSource and Delegate

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuViewCell
        cell.textLabel?.text = menuData[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.textAlignment = .center
        cell.selectionStyle = .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.menuView.isHidden = true
    }
    
    
}
