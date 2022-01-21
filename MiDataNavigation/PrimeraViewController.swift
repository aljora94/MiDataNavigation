//
//  PrimeraViewController.swift
//  MiDataNavigation
//
//  Created by Alberto Yagüe on 20/1/22.
//

import UIKit

class PrimeraViewController: UIViewController {

    @IBOutlet weak var miNombreTF: UITextField!
    @IBOutlet weak var miApellidoTF: UITextField!
    
    @IBAction func muestraSegundaVentanaAction(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueV2"{
            if !(self.miNombreTF.text?.isEmpty ?? false) && !(self.miApellidoTF.text?.isEmpty ?? false){
                let ventana2VC = segue.destination as? SegundaViewController
                ventana2VC?.datosUsuario.nombreData = self.miNombreTF.text
                ventana2VC?.datosUsuario.apellidoData = self.miApellidoTF.text
                
            }else{
                self.present(Utils.shared.showAlertVC(title: "Ojo", message: "Debes rellenar los campos"), animated: true, completion: nil)
            }
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
