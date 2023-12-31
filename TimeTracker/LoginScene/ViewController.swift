//
//  ViewController.swift
//  TimeTracker
//

import UIKit

class ViewController: UIViewController {
  //  MARK: initial children View
  
  let screenScrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.contentSize = CGSize(width: UIScreen.main.bounds.maxX, height: UIScreen.main.bounds.maxY * 2)
    scrollView.alwaysBounceVertical = false
    scrollView.alwaysBounceHorizontal = false
    scrollView.isScrollEnabled = false
    return scrollView
  }()
  
  let activateView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let logoImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: "riskIcon")
    return imageView
  }()
  
  let appNameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "iTracking"
    label.font = .boldSystemFont(ofSize: 40)
    label.textColor = .white
    label.textAlignment = .center
    return label
  }()
  
  let usernameTextField: CustomTextField = {
    let textField = CustomTextField()
    textField.placeholder = "Username"
    return textField
  }()
  
  let usernameImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: "user")
    return imageView
  }()
  
  let passwordTextField: CustomTextField = {
    let textField = CustomTextField()
    textField.placeholder = "Password"
    textField.isSecureTextEntry = true
    return textField
  }()
  
  let passwordImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: "password")
    return imageView
  }()
  
  let submitButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Đăng nhập", for: .normal)
    button.backgroundColor = .clear
    button.setTitleColor(.white, for: .normal)
    button.layer.cornerRadius = 20
    button.layer.borderColor = UIColor.white.cgColor
    button.layer.borderWidth = 1
    return button
  }()
  
  //  MARK: ViewController lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupNavigation()
    setupView()
    setupAction()
  }
  
  override func viewSafeAreaInsetsDidChange() {
    setupLayout()
    screenScrollView.contentOffset = CGPoint(x: 0, y: view.safeAreaInsets.top)
  }
  
  //  MARK: setup view and layout
  
  func setupNavigation() {
    navigationController?.navigationBar.backgroundColor = .clear
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.shadowImage = UIImage()
  }
  
  func setupView() {
    view.addSubview(screenScrollView)
    screenScrollView.addSubview(activateView)
    
    let gradient = CAGradientLayer()
    gradient.colors = [hexStringToUIColor(hex: "66A8FB").cgColor, hexStringToUIColor(hex: "3B84F1").cgColor]
    gradient.locations = [0.0, 1.0]
    gradient.frame = view.bounds
    activateView.layer.addSublayer(gradient)
    
    activateView.addSubview(logoImageView)
    activateView.addSubview(appNameLabel)
    activateView.addSubview(usernameTextField)
    activateView.addSubview(usernameImageView)
    activateView.addSubview(passwordTextField)
    activateView.addSubview(passwordImageView)
    activateView.addSubview(submitButton)
  }
  
  func setupLayout() {
    screenScrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    screenScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    screenScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    screenScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    
    activateView.topAnchor.constraint(equalTo: screenScrollView.topAnchor, constant: 0).isActive = true
    activateView.leadingAnchor.constraint(equalTo: screenScrollView.leadingAnchor, constant: 0).isActive = true
    activateView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.maxX).isActive = true
    activateView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.maxY).isActive = true
    
    logoImageView.centerXAnchor.constraint(equalTo: activateView.centerXAnchor, constant: 0).isActive = true
    logoImageView.widthAnchor.constraint(equalTo: activateView.widthAnchor, multiplier: 0.4).isActive = true
    logoImageView.centerYAnchor.constraint(equalTo: activateView.centerYAnchor,
                                           constant: -UIScreen.main.bounds.maxY / 4).isActive = true
    logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor, multiplier: 1.3).isActive = true
    
    appNameLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 16).isActive = true
    appNameLabel.leadingAnchor.constraint(equalTo: activateView.leadingAnchor, constant: 0).isActive = true
    appNameLabel.trailingAnchor.constraint(equalTo: activateView.trailingAnchor, constant: 0).isActive = true
    appNameLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 32).isActive = true
    
    usernameTextField.topAnchor.constraint(equalTo: appNameLabel.bottomAnchor, constant: UIScreen.main.bounds.height / 8).isActive = true
    usernameTextField.centerXAnchor.constraint(equalTo: appNameLabel.centerXAnchor, constant: 0).isActive = true
    usernameTextField.widthAnchor.constraint(equalTo: appNameLabel.widthAnchor, multiplier: 0.8).isActive = true
    usernameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
    usernameImageView.centerYAnchor.constraint(equalTo: usernameTextField.centerYAnchor, constant: 0).isActive = true
    usernameImageView.heightAnchor.constraint(equalTo: usernameTextField.heightAnchor, multiplier: 0.5).isActive = true
    usernameImageView.widthAnchor.constraint(equalTo: usernameImageView.heightAnchor, multiplier: 1).isActive = true
    usernameImageView.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor, constant: 10).isActive = true
    
    passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 16).isActive = true
    passwordTextField.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor, constant: 0).isActive = true
    passwordTextField.trailingAnchor.constraint(equalTo: usernameTextField.trailingAnchor, constant: 0).isActive = true
    passwordTextField.heightAnchor.constraint(equalTo: usernameTextField.heightAnchor, multiplier: 1).isActive = true
    
    passwordImageView.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor, constant: 0).isActive = true
    passwordImageView.heightAnchor.constraint(equalTo: passwordTextField.heightAnchor, multiplier: 0.5).isActive = true
    passwordImageView.widthAnchor.constraint(equalTo: passwordImageView.heightAnchor, multiplier: 1).isActive = true
    passwordImageView.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor, constant: 10).isActive = true
    
    submitButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: UIScreen.main.bounds.height / 8).isActive = true
    submitButton.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor, constant: 0).isActive = true
    submitButton.trailingAnchor.constraint(equalTo: usernameTextField.trailingAnchor, constant: 0).isActive = true
    submitButton.heightAnchor.constraint(equalTo: usernameTextField.heightAnchor, multiplier: 1).isActive = true
  }
  
  func setupAction() {
    submitButton.addTarget(self, action: #selector(routeToMainScene), for: .touchUpInside)
  }
  
  @objc func routeToMainScene() {
    let main = AppTabBarViewController()
    navigationController?.pushViewController(main, animated: true)
  }
}
