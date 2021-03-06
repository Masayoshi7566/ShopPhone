//
//  PhoneDetailsViewController.swift
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

protocol PhoneDetailsDisplayLogic: class {
   func getPhoneImageListDataSuccess(viewModel: PhoneDetails.PhoneImageList.ViewModel)
   func getPhoneImageListDataFailed()
   func getPhoneImageSuccess(viewModel: PhoneDetails.PhoneImage.ViewModel)
   func showAlertCannotGetPhoneImage()
}

class PhoneDetailsViewController: UIViewController, PhoneDetailsDisplayLogic {
  var interactor: PhoneDetailsBusinessLogic?
  var router: (NSObjectProtocol & PhoneDetailsRoutingLogic & PhoneDetailsDataPassing)?
    
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var phoneDescriptionLabel: UILabel!
    @IBOutlet weak var phoneImageScrollView: UIScrollView!
    @IBOutlet weak var phoneImageView: UIView!
    @IBOutlet weak var phoneImage: UIImageView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    var name: String = ""
    var phoneDescription: String = ""
    var price: Double = 0.0
    var rating: Double = 0.0
    var phoneImageArray: [UIImage] = [UIImage]()
    
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
    let interactor = PhoneDetailsInteractor()
    let presenter = PhoneDetailsPresenter()
    let router = PhoneDetailsRouter()
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
    getPhoneDetailData()
  }
  
  // MARK: Do something
    func getPhoneDetailData() {
        //Show Loading
        activityIndicatorView.startAnimating()
        
        interactor?.getPhoneDetailImageList()
        interactor?.getPhoneDetail(phoneName: &name, description: &phoneDescription, phonePrice: &price, phoneRating: &rating)
        
        setupView()
    }
    
    func getPhoneImageListDataSuccess(viewModel: PhoneDetails.PhoneImageList.ViewModel) {
        guard let phoneImageList = viewModel.result else { return getPhoneImageListDataFailed() }
        interactor?.getPhoneDetailImage(imageURL: phoneImageList.imageURL)
    }
    
    func getPhoneImageListDataFailed() {
        let alert = UIAlertController(title: "Failed!", message: "No Result", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func showAlertCannotGetPhoneImage() {
         hideActivityIndicator() 
         let alert = UIAlertController(title: "Failed!", message: "Can not get Phone Image.", preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
         self.present(alert, animated: true)
    }
    
    func getPhoneImageSuccess(viewModel: PhoneDetails.PhoneImage.ViewModel) {
        //Hide Loading
        hideActivityIndicator()
        
        phoneImageArray.append(viewModel.phoneImage)
        showScrollView()
    }
    
    func hideActivityIndicator() {
        activityIndicatorView.stopAnimating()
        activityIndicatorView.isHidden = true
    }
    
    func setupView() {
        navigationItem.title = name
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
        NSAttributedString.Key.font: UIFont(name: "Helvetica-Bold", size: 20) as Any]
    
        ratingLabel.text = "Rating : \(String(rating))"
        priceLabel.text = "Price : $\(String(price))"
        phoneDescriptionLabel.text = phoneDescription
    }
    
    func showScrollView() {
        phoneImageScrollView.isPagingEnabled = true
        
        for item in 0..<phoneImageArray.count {
            let imageView = UIImageView()
            imageView.image = phoneImageArray[item]
            imageView.contentMode = .scaleAspectFit
            let xPosition = self.view.frame.width * CGFloat(item)
            imageView.frame = CGRect(x: xPosition, y: 0, width: self.phoneImageScrollView.frame.width, height: phoneImageScrollView.frame.height)
            phoneImageScrollView.contentSize.width = phoneImageScrollView.frame.width * CGFloat(item + 1)
            phoneImageScrollView.addSubview(imageView)
        }
    }
}
