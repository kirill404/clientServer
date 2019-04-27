//
//  LoginViewController.swift
//  views
//
//  Created by Кирилл Петров on 03.03.2019.
//  Copyright © 2019 Кирилл Пучков. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var weather: UILabel!
    @IBOutlet weak var loginText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var singInBut: UIButton!
    var dot: DotActivity!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView.addGestureRecognizer(hideKeyboardGesture)
        animateTitlesAppearing()
        //transform
//        let scaleTransform = CGAffineTransform(scaleX: 3.0, y: 3.0)  // Scale
//        let rotateTransform = CGAffineTransform(rotationAngle: CGFloat.pi) // Rotation
//        let rotateTransform2 = CGAffineTransform(rotationAngle: CGFloat.pi * 2 ) // Rotation

        
        UIView.animate(withDuration: 2, delay: 0, options: .transitionFlipFromBottom, animations: {
            //self.weather.transform = scaleTransform
        })
//        UIView.animate(withDuration: 1, delay: 0, options: .transitionFlipFromBottom, animations: {
//            //self.weather.transform = rotateTransform
//        })
//        UIView.animate(withDuration: 1, delay: 0.9, animations: {
//            self.weather.transform = rotateTransform2
//        })
    }
    
    @IBAction func singIn(_ sender: UIButton) {
        if let login = loginText.text,
            let password = passwordText.text
        {
            if login == "" && password == "" {
                self.dot = DotActivity()
                self.dot.run(view2: self.animationView)
                UIView.animate(withDuration: 3, delay: 0, animations: {
                    self.animationView.backgroundColor = UIColor.clear
                }) { _ in
                    self.dot.stopAnimations()
                    self.performSegue(withIdentifier: "SignInSegue", sender: self)
                    UIView.transition(with: self.view, duration: 1.5, options: .transitionFlipFromBottom, animations: {
                        //self.view.addSubview(self.imageView)
                    }, completion: nil)
                }
            }
            else {
                let alert = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillBeHidden),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
   
        
//Анимация работает но переход по сигвею на новый вьюв не происходит прошу пояснить почему?
//        self.dot = DotActivity()
//        self.dot.run(view2: self.animationView)
//        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
//
//
//            if let login = self.loginText.text, let password = self.passwordText.text {
//            if login == "a" && password == "" {
//                res = true
////                return true
//            }
//            else {
//                let alert = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя", preferredStyle: .alert)
//                let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//                alert.addAction(action)
//                self.present(alert, animated: true, completion: nil)
//                res = false
//            }
//        }
//            //self.animationView.removeFromSuperview()
//            })

//        return res
//    }
    
    func animateTitlesAppearing() {
        let offset = view.bounds.width
        loginText.transform = CGAffineTransform(translationX: -offset, y: 0)
        passwordText.transform = CGAffineTransform(translationX: offset, y: 0)
        
        UIView.animate(withDuration: 1,
                       delay: 0.5,
                       options: .curveEaseOut,
                       animations: {
                        self.loginText.transform = .identity
                        self.passwordText.transform = .identity
        },
                       completion: nil)
    }
        
        
    
    //функции вызова обджект си
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        guard let keyboardFrameValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        let keyboardHeight = keyboardFrameValue.cgRectValue.height
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardHeight, right: 0.0)
        
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }

    
}








