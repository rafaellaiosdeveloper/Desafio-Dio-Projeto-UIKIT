//
//  RegisterViewController.swift
//  ListadeTarefas
//
//  Created by Rafaella Rodrigues Santos on 12/10/23.
//

import UIKit

class RegisterViewController: UIViewController {
    
    let key = "listaTarefas"

    @IBOutlet weak var taskTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func addBottom(_ sender: Any) {
        
        if let text = taskTextField.text {
            
            let task = TaskUserDefaults()
            task.save(tarefa: text, key: key)
            taskTextField.text = ""//sempre que o usuario salvar eu vou configurar um valor vazio
            
            let data = task.list(key: key)
            print(data)
            navigationController?.popViewController(animated: true)
        }
        }
    }
    


