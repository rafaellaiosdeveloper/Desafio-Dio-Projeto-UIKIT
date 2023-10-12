//
//  TaskUserDefaults.swift
//  ListadeTarefas
//
//  Created by Rafaella Rodrigues Santos on 12/10/23.
//

import Foundation

class TaskUserDefaults {
    
   
    var task: [String] = []
    
    func remove(indice: Int, key: String) {
        
        //Recuperar tarefas ja salvas
        task = list(key: key)
        
        task.remove(at: indice)
        UserDefaults.standard.set(task, forKey: key)
    }
    
    func save(tarefa: String, key: String) {
        
        //Recuperar tarefas ja salvas
        task = list(key: key)
       
        
        //Salvar Tarefa
        task.append(tarefa)
        UserDefaults.standard.setValue(task, forKey: key)
    }
    
   
    func list(key: String) -> Array<String> {
        
        let data = UserDefaults.standard.object(forKey: key)
        
        if data != nil {
            return data as! Array<String>
        }else{
            return []
        }
        
    }
}
