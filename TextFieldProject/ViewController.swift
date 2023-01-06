//
//  ViewController.swift
//  TextFieldProject
//
//  Created by 노민우 on 2022/12/30.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        setup()
    }
    
    func setup(){
        view.backgroundColor = UIColor.gray
        textFieldSetting()
    }
    
    func textFieldSetting(){
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "이메일 입력"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .next
        
        // 화면에 들어오자마자 첫번째로 응답하는 객체가 돼야해
        textField.becomeFirstResponder()
    }
    
    // 텍스트필드의 입력을 시작할때 호출 (시작할지 말지의 여부 허락하는 것)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 유저가 text를 입력하는 시점
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        print("텍스트 입력을 시작했다.")
    }
    
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // text field의 글자 내용이(한글자 한글자) 입력이 되거나 지워질때 호출이 되고 (허락 여부를 판단(Bool))
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //        print(#function)
        //        print(string)
        
        let maxLength = 10
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)
        
        return newString.count <= maxLength
    }
    
    // 화면의 탭을 감지하는 메소드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 뷰 전체 적용
        self.view.endEditing(true)
        // textField만 적용
        // textField.resignFirstResponder()
    }
    
    // 텍스트필드의 엔터가 눌러지면 다음 동작을 허락할 것인지 말것인지 판단.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        
        if textField.text == "" {
            textField.placeholder = "Type Something!"
            return false
        } else {
            return true
        }
    }
    
    // 텍스트 필드의 입력이 실제 끝났을때 호출 (시점)
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        print("유저가 텍스트 필드의 입력을 끝냈다.")
        textField.text = ""
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        textField.resignFirstResponder()
    }
}

