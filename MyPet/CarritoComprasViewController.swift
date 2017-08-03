//
//  CarritoComprasViewController.swift
//  MyPet
//
//  Created by Jose Aguilar on 13/06/17.
//  Copyright © 2017 Jose Aguilar. All rights reserved.
//

import UIKit

class CarritoComprasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet var segCtrlCarrito: UISegmentedControl!
    
    @IBOutlet var viewMensaje: UIView!
    @IBOutlet var imgMensaje: UIImageView!
    @IBOutlet var lblMensaje: UILabel!
    
    @IBOutlet var tableProductosServicios: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Configuración UISegmentedControl
        
        let attributes = [ NSForegroundColorAttributeName : UIColor.white,
                           NSFontAttributeName : UIFont (name: "HelveticaNeue-Light", size: 15.0)];
        let attributesSelected = [ NSForegroundColorAttributeName : UIColor.white,
                                   NSFontAttributeName : UIFont(name: "HelveticaNeue-Medium", size: 15.0)];
        
        UISegmentedControl.appearance().setTitleTextAttributes(attributes as Any as? [AnyHashable : Any], for: .normal)
        UISegmentedControl.appearance().setTitleTextAttributes(attributesSelected as Any as? [AnyHashable : Any], for: .selected)
        
        segCtrlCarrito.clipsToBounds = true
        segCtrlCarrito.layer.cornerRadius = 10.0
        segCtrlCarrito.layer.borderWidth = 1.0
        segCtrlCarrito.layer.borderColor = UIColor.white.cgColor
        
        switch segCtrlCarrito.selectedSegmentIndex
        {
        case 0:
            viewMensaje.isHidden = false
            imgMensaje.image = UIImage(named: "imgCarritoVacio")
            lblMensaje.text = "Actualmente no tienes ningún producto y/o servicio en tu carrito."
        case 1:
            viewMensaje.isHidden = false
            imgMensaje.image = UIImage(named: "imgCarritoVacio")
            lblMensaje.text = "Actualmente no tienes ningún producto y/o servicio en tus compras."
        case 2:
            viewMensaje.isHidden = false
            imgMensaje.image = UIImage(named: "imgFavoritoVacio")
            lblMensaje.text = "Actualmente no tienes productos y/o servicios favoritos."
        default:
            break
        }
        
        let nib = UINib(nibName: "AlertaTableViewCell", bundle: nil)
        tableProductosServicios.register(nib, forCellReuseIdentifier: "alertaTableViewCell")
    }
    
    @IBAction func indexChanged(_ sender: AnyObject)
    {
        switch segCtrlCarrito.selectedSegmentIndex
        {
        case 0:
            viewMensaje.isHidden = false
            imgMensaje.image = UIImage(named: "imgCarritoVacio")
            lblMensaje.text = "Actualmente no tienes ningún producto y/o servicio en tu carrito."
        case 1:
            viewMensaje.isHidden = false
            imgMensaje.image = UIImage(named: "imgCarritoVacio")
            lblMensaje.text = "Actualmente no tienes productos y/o servicios en tus compras."
        case 2:
            viewMensaje.isHidden = false
            imgMensaje.image = UIImage(named: "imgFavoritoVacio")
            lblMensaje.text = "Actualmente no tienes productos y/o servicios favoritos."
        default:
            break
        }
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
        tableProductosServicios.separatorStyle = .none
        return 0
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
