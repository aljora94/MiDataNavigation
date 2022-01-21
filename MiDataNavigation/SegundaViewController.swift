//
//  SegundaViewController.swift
//  MiDataNavigation
//
//  Created by Alberto Yagüe on 20/1/22.
//

import UIKit

class SegundaViewController: UIViewController {
    // MARK: - Variables
    var datosUsuario = DatosUsuarioModel()
    var edadPerro: Int?
    var nuevaEdadPerro: Int?
    //MARK: - IBOutlets
    
    @IBOutlet weak var miNombreLBL: UILabel!
    @IBOutlet weak var miApellidoLBL: UILabel!
    
    @IBOutlet weak var miTelefonoTF: UITextField!
    @IBOutlet weak var miDireccionTF: UITextField!
    @IBOutlet weak var edadPerroTF: UITextField!
    
    @IBAction func calculaEdadPerroAction(_ sender: Any) {
        self.edadPerro = Int(self.edadPerroTF.text ?? "0")
        
        if let edadPerroUnw = self.edadPerro{
            self.nuevaEdadPerro = edadPerroUnw * 7
            self.present(Utils.shared.showAlertVC(title: "Edad de mi perro", message: "La edad perruna es: \(self.nuevaEdadPerro ?? 0)"), animated: true, completion: nil)
            self.edadPerroTF.text = "\(self.nuevaEdadPerro ?? 0)"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracion()
        // Do any additional setup after loading the view.
    }
    private func configuracion(){
        self.miNombreLBL.text = "Mi nombre: \(self.datosUsuario.nombreData ?? "")"
        self.miApellidoLBL.text = "Mi apellido: \(self.datosUsuario.apellidoData ?? "")"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueV3"{
            if let edadPerro = self.edadPerro {
                self.navigationToThirdWindow(segue: segue, edadPerro: edadPerro)
            }else{
                
            }
            
        }
    }
    
    
    private func navigationToThirdWindow(segue: UIStoryboardSegue, edadPerro: Int){
        if !(self.miTelefonoTF.text?.isEmpty ?? false) && !(self.miDireccionTF.text?.isEmpty ?? false) &&
            !(self.edadPerroTF.text?.isEmpty ?? false){
            
            let ventana3 = segue.destination as? TerceraViewController
            
            ventana3?.datosUsuario.nombreData = self.datosUsuario.nombreData
            ventana3?.datosUsuario.apellidoData = self.datosUsuario.apellidoData
            ventana3?.datosUsuario.telefonoData = self.miTelefonoTF.text
            ventana3?.datosUsuario.direccionData = self.miDireccionTF.text
            ventana3?.datosUsuario.edadPerroData = self.edadPerroTF.text
        }else{
            self.present(Utils.shared.showAlertVC(title: "Ojo 2", message: "Rellena los campos"), animated: true, completion: nil)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
