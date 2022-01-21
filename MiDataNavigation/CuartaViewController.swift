//
//  CuartaViewController.swift
//  MiDataNavigation
//
//  Created by Alberto Yagüe on 20/1/22.
//

import UIKit
import MessageUI

class CuartaViewController: UIViewController {

    var datosUsuario = DatosUsuarioModel()
    
    // MARK: - IBOutlets
        @IBOutlet weak var miNombreLBL: UILabel!
        @IBOutlet weak var miApellidoLBL: UILabel!
        @IBOutlet weak var miTelefonoLBL: UILabel!
        @IBOutlet weak var miDireccionLBL: UILabel!
        @IBOutlet weak var edadPerroLBL: UILabel!
        @IBOutlet weak var codigoPOstalLBL: UILabel!
        @IBOutlet weak var ciudadLBL: UILabel!
        @IBOutlet weak var posicionGeoLBL: UILabel!
    
    @IBAction func enviarInfoAction(_ sender: UIButton) {
        if MFMailComposeViewController.canSendMail(){
            self.present(self.configuracionMailCompose(), animated: true, completion: nil)
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func configuracionUI(){
        self.miNombreLBL.text = datosUsuario.nombreData
        self.miApellidoLBL.text = datosUsuario.apellidoData
        self.miTelefonoLBL.text = datosUsuario.telefonoData
        self.miDireccionLBL.text = datosUsuario.direccionData
        self.edadPerroLBL.text = datosUsuario.edadPerroData
        self.codigoPOstalLBL.text = datosUsuario.codigoPostalData
        self.ciudadLBL.text = datosUsuario.ciudadData
        self.posicionGeoLBL.text = datosUsuario.posicionGPSData
    }
    
    private func configuracionMailCompose() -> MFMailComposeViewController{
        let mailCompose = MFMailComposeViewController()
        mailCompose.mailComposeDelegate = self
        mailCompose.setToRecipients(["ayaguedev@icloud.com"])
        mailCompose.setSubject("Test envio de correo")
        let emailBody = "Los datos de formulario de registro son \(self.miNombreLBL.text ?? "")\n \(self.miApellidoLBL.text ?? "")"
        mailCompose.setMessageBody(emailBody, isHTML: false)
        return mailCompose
    }
}


extension CuartaViewController: MFMailComposeViewControllerDelegate{
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
