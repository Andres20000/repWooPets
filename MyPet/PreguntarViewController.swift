//
//  PreguntarViewController.swift
//  MyPet
//
//  Created by Jose Aguilar on 27/07/17.
//  Copyright © 2017 Jose Aguilar. All rights reserved.
//

import UIKit

class PreguntarViewController: UIViewController, UITextViewDelegate
{
    @IBOutlet var barItemOK: UIBarButtonItem!
    @IBOutlet var textPregunta: UITextView!
    
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
        
        barItemOK.setTitleTextAttributes([
            NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 17.0)!,
            NSForegroundColorAttributeName: UIColor.white],
                                          for: UIControlState.normal)
        
        textPregunta.text = "¿Cuál es tu duda? Escribe aquí."
        self .toolBarTextView(textPregunta)
    }
    
    // #pragma mark - textView
    
    func textViewDidBeginEditing(_ textView: UITextView)
    {
        if textView.text == "¿Cuál es tu duda? Escribe aquí."
        {
            textView.text = ""
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView)
    {
        if (textView.text.characters.count) < 10
        {
            self.mostrarAlerta(titulo: "!Advertencia!", mensaje: "La descripción debe ser mínimo de 10 caracteres")
            
            textView.text = "¿Cuál es tu duda? Escribe aquí."
            
        }else
        {
            print("OK")
            //model.publicacion.descripcion = textView.text
        }
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
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
    
    func mostrarAlerta(titulo:String, mensaje:String)
    {
        let alerta = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            
            return
        }
        
        alerta.addAction(OKAction)
        present(alerta, animated: true, completion: { return })
    }
    
    // Toolbar in textField
    func toolBarTextView(_ textView : UITextView)
    {
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 41/255, green: 184/255, blue: 200/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Ocultar", style: .plain, target: self, action: #selector(RegistroOferenteViewController.cancelClick))
        toolBar.setItems([spaceButton, cancelButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textView.inputAccessoryView = toolBar
    }
    
    // Button Cancelar Keyboard
    func cancelClick()
    {
        view.endEditing(true)
    }
}
