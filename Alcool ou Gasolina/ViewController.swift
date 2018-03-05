//
//  ViewController.swift
//  Alcool ou Gasolina
//
//  Created by Felipe Treichel on 01/03/18.
//  Copyright © 2018 Felipe Treichel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputAlcool: UITextField!
    @IBOutlet weak var inputGasolina: UITextField!
    @IBOutlet weak var resultado: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func validarCampos(precoAlcool: String, precoGasolina: String) -> Bool {
        var campoValido = true
        
        if precoAlcool.isEmpty || precoGasolina.isEmpty {
            campoValido = false
        }
        
        return campoValido
    }
    
    func calcularMelhorPreco(precoAlcool: String, precoGasolina: String) {
        if let valorAlcool = Double(precoAlcool) {
            if let valorGasolina = Double(precoGasolina) {
                if (valorAlcool / valorGasolina) >= 0.7 {
                    self.resultado.text = "Melhor utilizar gasolina"
                } else {
                    self.resultado.text = "Melhor utilizar álcool"
                }
            }
        }
    }
    
    @IBAction func calcular(_ sender: Any) {
        
        if let precoAlcool = inputAlcool.text {
            if let precoGasolina = inputGasolina.text {
                let camposValidados = self.validarCampos(precoAlcool: precoAlcool, precoGasolina: precoGasolina)
                
                if camposValidados {
                    self.calcularMelhorPreco(precoAlcool: precoAlcool, precoGasolina: precoGasolina);
                } else {
                    self.resultado.text = "Digite os preços para calcular!"
                }
                
            }
        }
    }
    
}

