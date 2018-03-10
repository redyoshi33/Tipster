//
//  ViewController.swift
//  Tipster
//
//  Created by jojoestar on 3/8/18.
//  Copyright © 2018 jojoestar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var NumLabel: UILabel!
    @IBOutlet weak var lowLabel: UILabel!
    @IBOutlet weak var midLabel: UILabel!
    @IBOutlet weak var highLabel: UILabel!
    @IBOutlet weak var tiplowLabel: UILabel!
    @IBOutlet weak var tipmidLabel: UILabel!
    @IBOutlet weak var tiphighLabel: UILabel!
    @IBOutlet weak var lowtotalLabel: UILabel!
    @IBOutlet weak var midtotalLabel: UILabel!
    @IBOutlet weak var hightotalLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    
    @IBOutlet var buttons: [UIButton]!
    
    
    @IBAction func buttonpress(_ sender: UIButton) {
        if sender.tag >= 0  && sender.tag <= 9{
            if Num.count < 9{
                if Num == "0"{
                    Num = String(sender.tag)
                }
                else{
                    Num += String(sender.tag)
                }
            }
        }
        else if sender.tag == 10{
            Num = "0"
            buttons[11].isEnabled = true
        }
        else if sender.tag == 11{
            Num += "."
            sender.isEnabled = false
        }
        NumLabel.text = Num
        updatetip()
    }
    @IBAction func tipSlider(_ sender: UISlider) {
        lowLabel.text = String(Int(sender.value + 5))+"%"
        midLabel.text = String(Int(sender.value + 10))+"%"
        highLabel.text = String(Int(sender.value + 15))+"%"
        updatetip()
    }
    @IBAction func groupSlider(_ sender: UISlider) {
        sizeLabel.text = "Group Size: "+String(Int(sender.value))
        groupsize = Int(sender.value)
        updatetip()
    }
    
    var Num = "0"
    var tiplow = 0.00
    var tipmid = 0.00
    var tiphigh = 0.00
    var totallow = 0.00
    var totalmid = 0.00
    var totalhigh = 0.00
    var groupsize = 1
    
    func updatetip(){
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        let temp = Double(Num)!/Double(groupsize)
        let low = Double(lowLabel.text!.dropLast())!/100
        let mid = Double(midLabel.text!.dropLast())!/100
        let high = Double(highLabel.text!.dropLast())!/100
        
        tiplow = temp * low
        tipmid = temp * mid
        tiphigh = temp * high
        totallow = temp + tiplow
        totalmid = temp + tipmid
        totalhigh = temp + tiphigh
        
        tiplowLabel.text = formatter.string(from: NSNumber(value: tiplow))
        tipmidLabel.text = formatter.string(from: NSNumber(value: tipmid))
        tiphighLabel.text = formatter.string(from: NSNumber(value: tiphigh))
        lowtotalLabel.text = formatter.string(from: NSNumber(value: totallow))
        midtotalLabel.text = formatter.string(from: NSNumber(value: totalmid))
        hightotalLabel.text = formatter.string(from: NSNumber(value: totalhigh))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

