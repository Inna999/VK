//
//  LoginFormController.swift
//  VK
//
//  Created by  Admin on 07.10.2024.
//

import UIKit

class LoginFormController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginInput: UITextField!

    @IBOutlet weak var passwordInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
        //присваиваем его UIScrollView
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        let login = loginInput.text!
        let password = passwordInput.text!
        
        if login == "admin" && password == "123456" {
            print("autorization success")
        } else {
            print("autorization doesn't success")
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        let checkResult = checkUserData()
        
        if !checkResult {
            showLoginError()
        }
        
        return checkResult
    }
    
    //проверка пароля
    func checkUserData() -> Bool {
        let login = loginInput.text!
        let password = passwordInput.text!
        
        if login == "1" && password == "1" {
            return true
        } else {
            return false
        }
    }
    //сообщение о неверном логине/пароле
    func showLoginError() {
        let alert = UIAlertController(title: "Error", message: "Uncorrect login or password", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    //когда клавиатура появлятся
    @objc func keyboardWasShown(notification: Notification) {
        
        //получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets =   UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        //добавляем отступ внизу UIScrollView равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    //когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notifikation: Notification) {
        //устанавливем отступ внизу UIScrollView равный 0
        let contentInserts = UIEdgeInsets.zero
        scrollView?.contentInset = contentInserts
        scrollView?.scrollIndicatorInsets = contentInserts
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //подписываемся на два уведомления, одно пиходит при появлении клавиатуры
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWasShown),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        //второе когда она пропадает
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillBeHidden(notifikation:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
