//
//  DetailsViewController.swift
//  ListadeTarefas
//
//  Created by Rafaella Rodrigues Santos on 12/10/23.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var index: Int?
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let index = index {
            let key = String(index)
           let text = UserDefaults.standard.string(forKey: key)
            textView.text = text
        }
        
    }
    

    @IBAction func saveButtom(_ sender: Any) {
        if let text = textView.text {
            if let index = index{
                let key = String(index)
                UserDefaults.standard.set(text, forKey: key)
                
                navigationController?.popViewController(animated: true)
                
            }
        }
        
    }
    

}
