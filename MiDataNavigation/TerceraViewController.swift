//
//  TerceraViewController.swift
//  MiDataNavigation
//
//  Created by Alberto Yagüe on 20/1/22.
//

import UIKit

class TerceraViewController: UIViewController {
    //Mark: - Variables
    var datosUsuario = DatosUsuarioModel()
    let dataSourceCP = ["28002", "50015", "37007", "67803"]
    let dataSourceCiudad = ["Madrid", "Sevilla", "Valencia", "Barcelona"]
    let dataSourceGPS = ["40.0, -3.4", "45.5, -7.34", "134.8, 43.6"]
    
    @IBOutlet weak var miNomnbreLBL: UILabel!
    
    @IBOutlet weak var miApellidoLBL: UILabel!
    
    @IBOutlet weak var miTelefonoLBL: UILabel!
    
    @IBOutlet weak var miCPTF: UITextField!
    @IBOutlet weak var miCiudadTF: UITextField!
    @IBOutlet weak var miPosicionTF: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configurationUI()
        self.configurationPickerView()
    }
    
    
    private func configurationPickerView(){
        Utils.shared.configuracionPickerView(tag: 1, delegate: self, dataSource: self, textField: self.miCPTF)
        Utils.shared.configuracionPickerView(tag: 2, delegate: self, dataSource: self, textField: self.miCiudadTF)
        Utils.shared.configuracionPickerView(tag: 3, delegate: self, dataSource: self, textField: self.miPosicionTF)
    }
    

    private func configurationUI(){
        self.miNomnbreLBL.text = "Mi nombre es: \(self.datosUsuario.nombreData ?? "")"
        self.miApellidoLBL.text  = "Mi apellido es: \(self.datosUsuario.apellidoData ?? "")"
        self.miTelefonoLBL.text  = "Mi telefono es: \(self.datosUsuario.telefonoData ?? "")"
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueV4"{
            
            if Utils.shared.dataIntextFieldIsEmpty(params: [self.miCPTF.text ?? "", self.miCiudadTF.text ?? "", self.miPosicionTF.text ?? ""]){
                let ventana4 = segue.destination as? CuartaViewController
                ventana4?.datosUsuario.nombreData = self.datosUsuario.nombreData
                ventana4?.datosUsuario.apellidoData = self.datosUsuario.apellidoData
                ventana4?.datosUsuario.telefonoData = self.datosUsuario.telefonoData
                ventana4?.datosUsuario.direccionData = self.datosUsuario.direccionData
                ventana4?.datosUsuario.edadPerroData = self.datosUsuario.edadPerroData
                ventana4?.datosUsuario.codigoPostalData = self.miCPTF.text
                ventana4?.datosUsuario.posicionGPSData = self.miPosicionTF.text
            }else{
                self.present(Utils.shared.showAlertVC(title: "Ojo 3", message: "Rellena los campos"), animated: true, completion: nil)
            }
        }
    }
}


//Mark: - TerceraViewController: UIPickerViewDataSource
extension TerceraViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag{
        case 1:
            return self.dataSourceCP.count
        case 2:
            return self.dataSourceCiudad.count
        default:
            return self.dataSourceGPS.count
        }
    }
}

//Mark: - TerceraViewController: UIPickerViewDelegate
extension TerceraViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag{
        case 1:
            return self.dataSourceCP[row]
        case 2:
            return self.dataSourceCiudad[row]
        default:
            return self.dataSourceGPS[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag{
        case 1:
            self.miCPTF.text = self.dataSourceCP[row]
        case 2:
            self.miCiudadTF.text =  self.dataSourceCiudad[row]
        default:
            self.miPosicionTF.text =  self.dataSourceGPS[row]
        }
    }
}
