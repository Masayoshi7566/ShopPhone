//
//  PhoneListViewController.swift
//  ShopPhone
//
//  Created by GABLET04690 on 20/12/2562 BE.
//  Copyright (c) 2562 Orathai Udomluk. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Kingfisher
import JGProgressHUD

protocol PhoneListDisplayLogic: class {
  func getAllPhoneListDataSuccess(viewModel: PhoneList.PhoneData.ViewModel)
  func getAllPhoneListDataFailed()
  func navigateToPhoneDetails()
  func updateFavouritePhoneCell()
  func getFavouritePhoneData(viewModel: PhoneList.PhoneFavourite.ViewModel)
}

enum SortType: String {
    case priceLowToHigh
    case priceHighToLow
    case ratingScore
}

class PhoneListViewController: UIViewController, PhoneListDisplayLogic {

    @IBOutlet weak var phoneListTable: UITableView!
    @IBOutlet weak var menuScreenSegment: UISegmentedControl!
    
    var realmManager = RealmManager()
    weak var reloadFavouriteButton: UIButton?
    var itemIndexPath: IndexPath?
    var allPhoneList: [PhoneDataModel] = [PhoneDataModel]()
    var phoneListData: [PhoneDataModel] = [PhoneDataModel]()
    var favouritePhoneID: [Int] = [Int]()
    var isFromFavoriteTap: Bool = false
    var phoneFavouriteData: PhoneDataModel?
    var interactor: PhoneListBusinessLogic?
    var router: (NSObjectProtocol & PhoneListRoutingLogic & PhoneListDataPassing)?
    let hud = JGProgressHUD(style: .extraLight)

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup() {
    let viewController = self
    let interactor = PhoneListInteractor()
    let presenter = PhoneListPresenter()
    let router = PhoneListRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
 override func viewDidLoad() {
      super.viewDidLoad()
      setupView()
      setupTableView()
 }

  func setupView() {
      navigationItem.hidesBackButton = true
      navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sort", style: .plain, target: self, action: #selector(sortButtonTapped))
    
      menuScreenSegment.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Helvetica-Bold", size: 20.0) as Any], for: .normal)
      getAllPhoneListData(showLoading: true)
  }
  
  func setupTableView() {
      phoneListTable.register(UINib.init(nibName: "PhoneListCell", bundle: nil), forCellReuseIdentifier: "PhoneListViewCell")
      phoneListTable.delegate = self
      phoneListTable.dataSource = self
      phoneListTable.backgroundColor = .clear
      phoneListTable.separatorColor = .clear
      phoneListTable.separatorInset = UIEdgeInsets.init(top: .zero, left: 8, bottom: .zero, right: 8)
  }
  
  func getAllPhoneListData(showLoading: Bool) {
      interactor?.getAllPhoneListData()
      
        if showLoading {
            setupShowLoading()
        } else {
            return
        }
  }
    
  func setupShowLoading() {
     hud.textLabel.text = "Loading"
     hud.show(in: self.view)
  }

  func getPhoneFavoriteData() {
     interactor?.getFavouritePhone()
  }
  
  func getAllPhoneListDataSuccess(viewModel: PhoneList.PhoneData.ViewModel) {
      hud.dismiss()
    
      allPhoneList.append(viewModel.result)
      phoneListData = allPhoneList
      phoneListTable.separatorColor = .placeholderText
      phoneListTable.reloadData()
  }
  
  func getAllPhoneListDataFailed() {
      if allPhoneList.count == 0 {
          let alert = UIAlertController(title: "Fail", message: "No Result", preferredStyle: .alert)
          alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
          self.present(alert, animated: true)
      }
  }
  
  @objc func sortButtonTapped() {
      showAlertSortItem()
  }
  
  func navigateToPhoneDetails() {
      router?.routeToPhoneDetails(segue: nil)
  }
    
    func showAlertSortItem() {
        let priceHightoLowButton = UIAlertAction(title: "Price high to low", style: .default, handler: { [unowned self] _ in
            self.sortItemByType(type: .priceHighToLow)
        })

        let priceLowtoHighButton = UIAlertAction(title: "Price low to high", style: .default, handler: { [unowned self] _ in
            self.sortItemByType(type: .priceLowToHigh)
        })
        
        let ratingScoreButton = UIAlertAction(title: "Rating", style: .default, handler: { [unowned self] _ in
            self.sortItemByType(type: .ratingScore)
        })

        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        let sortItemAction = UIAlertController(title: "Sort", message: nil, preferredStyle: .alert)
            sortItemAction.addAction(priceLowtoHighButton)
            sortItemAction.addAction(priceHightoLowButton)
            sortItemAction.addAction(ratingScoreButton)
            sortItemAction.addAction(cancelButton)
            self.present(sortItemAction, animated: true, completion: nil)
    }
    
    func sortItemByType(type: SortType) {
           switch (type) {
           case .priceHighToLow:
                phoneListData.sort(by: { $0.price > $1.price })
                phoneListTable.reloadData()
           case .priceLowToHigh:
                phoneListData.sort(by: { $0.price < $1.price })
                phoneListTable.reloadData()
           case .ratingScore:
                phoneListData.sort(by: { $0.rating > $1.rating })
                phoneListTable.reloadData()
        }
    }
    
    func updateFavouritePhoneCell() {
        if let button = reloadFavouriteButton, let index = itemIndexPath {
            let obj = phoneListData[index.row]
            let isFavouriteCell = realmManager.isFavouritePhone(id: obj.id)
            
            if isFavouriteCell {
                button.setImage(UIImage(systemName: "star.fill"), for: .normal)
            } else {
                button.setImage(UIImage(systemName: "star"), for: .normal)
            }
            
            reloadFavouriteButton = nil
        }
    }
    
    func getFavouritePhoneData(viewModel: PhoneList.PhoneFavourite.ViewModel) {
        let allFavouritePhoneId = viewModel.result
        phoneListData = allPhoneList.filter { allFavouritePhoneId.contains($0.id) }
        phoneListTable.reloadData()
    }
    
    @IBAction func menuScreenSegmentTapped(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            isFromFavoriteTap = true
            getPhoneFavoriteData()
        } else {
            isFromFavoriteTap = false
            
            //Delete Favourite Phone List Before Update New All Phone List
            phoneListData.removeAll()
            phoneListData = allPhoneList
            phoneListTable.reloadData()
        }
    }
}

extension PhoneListViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return phoneListData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let phoneData = phoneListData[indexPath.item]
      let cell = tableView.dequeueReusableCell(withIdentifier: "PhoneListViewCell", for: indexPath)
      cell.selectionStyle = .none
      cell.tag = indexPath.row
      let phoneCell = cell as? PhoneListViewCell
      let phoneThumbImageURL = URL(string: phoneData.thumbImageURL)
      
      phoneCell?.favouriteButton.isEnabled = true
      phoneCell?.nameLabel.text = phoneData.name
      phoneCell?.descriptionLabel.text = phoneData.phoneDescription
      phoneCell?.priceLabel.text = "Price: $\(String(phoneData.price))"
      phoneCell?.ratingLabel.text = "Rating: \(String(phoneData.rating))"
    
      //Show loading indicator when downloading the image
      if cell.tag == indexPath.row {
          phoneCell?.phoneImage.kf.indicatorType = .activity
          phoneCell?.phoneImage.kf.setImage(with: phoneThumbImageURL)
      }
    
      //Show State Favourite
      phoneCell?.isFavourite = realmManager.isFavouritePhone(id: phoneData.id)
      if phoneCell?.isFavourite ?? false {
          phoneCell?.favouriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
      } else {
          phoneCell?.favouriteButton.setImage(UIImage(systemName: "star"), for: .normal)
      }

      //When Tapped Favourite Button
      phoneCell?.onTappedFavouriteCell = { button in
        self.reloadFavouriteButton = button
          if phoneCell?.isFavourite ?? false {
              self.itemIndexPath = indexPath
              phoneCell?.isFavourite = false
              self.interactor?.unFavouritePhone(id: phoneData.id)
            
              //Update Favorite Phone Data when stay on tap Favourite
              if self.isFromFavoriteTap {
                 self.getPhoneFavoriteData()
              }
          } else {
              self.itemIndexPath = indexPath
              phoneCell?.isFavourite = true
              self.interactor?.addFavoritePhone(data: phoneData)
          }
      }
    
      return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let phoneData = phoneListData[indexPath.item]
      let request = PhoneList.PhoneDetails.Request(phoneId: phoneData.id, name: phoneData.name, phoneDescription: phoneData.phoneDescription, price: phoneData.price, rating: phoneData.rating)
      interactor?.passDataToPhoneDetails(request: request)
  }
}

