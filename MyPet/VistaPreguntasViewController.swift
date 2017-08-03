//
//  VistaPreguntasViewController.swift
//  MyPet
//
//  Created by Jose Aguilar on 27/07/17.
//  Copyright © 2017 Jose Aguilar. All rights reserved.
//

import UIKit

class VistaPreguntasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet var barItemTitulo: UIBarButtonItem!
    @IBOutlet var tablePQs: UITableView!

    var tituloVista = ""
    
    @IBAction func backView(_ sender: Any)
    {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        view.window!.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        barItemTitulo.title = tituloVista
        
        let nib = UINib(nibName: "AlertaTableViewCell", bundle: nil)
        tablePQs.register(nib, forCellReuseIdentifier: "alertaTableViewCell")
    }
    
    // #pragma mark - Table View
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        /*if model.alertasMascotaSeleccionada.count > 0
         {
         Comando.init().EmptyMessage("", tableView: tableResenas)
         
         tableResenas.separatorStyle = .singleLine
         
         return 1
         } else
         {
         Comando.init().EmptyMessage("Actualmente no hay opiniones de otros compradores", tableView: tableResenas)
         
         tableResenas.separatorStyle = .none
         
         return 1
         }*/
        Comando.init().EmptyMessage("Actualmente no hay preguntas, pero puedes ser el(la) primero(a).", tableView: tablePQs)
        
        tablePQs.separatorStyle = .none
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        //return model.alertasMascotaSeleccionada.count
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alertaTableViewCell")  as! AlertaTableViewCell
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("Seleccionada")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 85
    }
    
    @IBAction func preguntar(_ sender: Any)
    {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        view.window!.layer.add(transition, forKey: kCATransition)
        
        self.performSegue(withIdentifier: "preguntarDesdeVistaPreguntas", sender: self)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
