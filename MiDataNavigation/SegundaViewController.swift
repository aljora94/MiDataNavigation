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
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var miNombreLBL: UILabel!
    @IBOutlet weak var miApellidoLBL: UILabel!
    
    @IBOutlet weak var miTelefonoTF: UITextField!
    @IBOutlet weak var miDireccionTF: UITextField!
    @IBOutlet weak var edadPerroTF: UITextField!
    
    @IBAction func calculaEdadPerroAction(_ sender: Any) {
        self.edadPerroTF = Int(self.edadPerroTF.text ?? "0")
        
        if let edadPerroUnw = self.edadPerro{
            self.nuevaEdadPerro = edadPerroUnw * 7
            self.present(Utils.shared.showAlertVC(title: "Edad de mi perro", message: "La edad perruna es: \(self.nuevaEdadPerro)"), animated: true, completion: nil)
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
            if !(self.miTelefonoTF.text?.isEmpty ?? false) && !(self.miDireccionTF.text?.isEmpty ?? false) &&
                !(self.edadPerroTF.text?.isEmpty ?? false){
                let ventanaV3 = segue.destination as? TerceraViewController
            }else{
                self.present(Utils.shared.showAlertVC(title: "Ojo 2", message: "Rellena los campos"), animated: true, completion: nil)
            }
        }
    }
}
