//
//  ViewController.swift
//  tarea1Correcta
//
//  Created by Luis Alfonso Rojo Sánchez on 12/08/17.
//  Copyright © 2017 Luis Alfonso Rojo Sánchez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfLado1: UITextField!
    
    @IBOutlet weak var tfLado2: UITextField!
    
    @IBOutlet weak var tfLado3: UITextField!
    
    @IBOutlet weak var botonOperacion: UIButton!
    
    @IBOutlet weak var informacionTriangulo: UILabel!
    
    @IBOutlet weak var imagen: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        botonOperacion.setTitle("Tipo de Triángulo", for: .normal)
        
        imagen.image = #imageLiteral(resourceName: "default")
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(quitaTeclado))
        view.addGestureRecognizer(tap)
    }
    
    func quitaTeclado(){
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func botonSwitch(_ sender: UISwitch) {
        if(sender.isOn){
            botonOperacion.setTitle("Tipo de Triángulo", for: .normal)
            imagen.isHidden = false
            informacionTriangulo.text! = ""
            imagen.image = #imageLiteral(resourceName: "default")
        }else{
            botonOperacion.setTitle("Calcular Área", for: .normal)
            imagen.isHidden = true
            informacionTriangulo.text! = ""
        }
    }
    
    @IBAction func botonOperacion(_ sender: Any) {
        
        let lado1 = Int(tfLado1.text!)
        let lado2 = Int(tfLado2.text!)
        let lado3 = Int(tfLado3.text!)
        
        if(lado1 != nil && lado2 != nil && lado3 != nil){
            if(botonOperacion.currentTitle == "Tipo de Triángulo"){
                
                if((lado1 == lado2) && (lado2 == lado3) && (lado3 == lado1)){
                    informacionTriangulo.text = "Equilátero"
                    imagen.image = #imageLiteral(resourceName: "equilatero")
                }else if((lado1 != lado2) && (lado2 != lado3) && (lado3 != lado1)){
                    informacionTriangulo.text = "Escaleno"
                    imagen.image = #imageLiteral(resourceName: "escaleno")
                }else if(
                    (lado1 == lado2 && ((lado1 != lado3) && (lado2 != lado3))) ||
                        (lado2 == lado3 && ((lado2 != lado1) && (lado3 != lado1))) ||
                        (lado3 == lado1 && ((lado3 != lado2) && (lado1 != lado2)))
                    ){
                    informacionTriangulo.text = "Isóceles"
                    imagen.image = #imageLiteral(resourceName: "isoceles")
                }
            }else if(botonOperacion.currentTitle == "Calcular Área"){
                
                let s = ((lado1! + lado2! + lado3!) / 2)
                
                let A = sqrt(Double(s*(s - lado1!)*(s - lado2!)*(s - lado3!)))
                
                let numeroCortado = String(format: "%.2f", A)
                
                informacionTriangulo.text = "El área del triángulo es = " + numeroCortado
            }
        }else{
            let alerta = UIAlertController(title: "Operación no realizada", message: "Debe haber datos numéricos", preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "Aceptar", style: .cancel, handler: nil))
            present(alerta, animated: true, completion: nil)
        }

    }
    
}

