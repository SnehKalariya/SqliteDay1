//
//  ViewController.swift
//  SqliteDay1
//
//  Created by Sneh kalariya on 31/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var buttonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sqlite.createFile()
    }
    
    @IBAction func saveButtonAction(_ sender: UIButton) {
        if let x = textField1.text, let y = Int(x){
            sqlite.addData(name: textField2.text!, id: y)
        }
    }
    @IBAction func deleteButtonAction(_ sender: UIButton) {
        if let x = textField1.text, let y = Int(x){
            sqlite.deleteData(name: textField2.text!, id: y)
        }
    }
    
    @IBAction func getDataButtonAction(_ sender: UIButton) {
        let navigation = storyboard?.instantiateViewController(identifier: "ViewController2") as! ViewController2
        navigationController?.pushViewController(navigation, animated: true)
    }
    
}
