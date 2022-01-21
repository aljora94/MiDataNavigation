//
//  Utils.swift
//  MiDataNavigation
//
//  Created by Alberto Yagüe on 20/1/22.
//

import Foundation
import UIKit

class Utils{
    static let shared = Utils()
    
    func showAlertVC(title: String, message: String) ->UIAlertController{
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        return alertVC
    }
    
    func configuracionPickerView(tag: Int,
                                 delegate: UIPickerViewDelegate,
                                 dataSource: UIPickerViewDataSource,
                                 textField: UITextField){
        
        let pickerView = UIPickerView()
        pickerView.delegate = delegate
        pickerView.dataSource = dataSource
        pickerView.tag = tag
        textField.inputView = pickerView
    }
    
    func dataIntextFieldIsEmpty(params: [String]) -> Bool {
        for item in params{
        if (item.isEmpty) {
                return false
            }
        }
        return true
    }

}


struct DatosUsuarioModel{
    var nombreData: String?
    var apellidoData: String?
    var telefonoData: String?
    var direccionData: String?
    var edadPerroData: String?
    var codigoPostalData: String?
    var ciudadData: String?
    var posicionGPSData: String?
}
