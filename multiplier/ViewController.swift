//
//  ViewController.swift
//  multiplier
//
//  Created by Vicky Tang on 7/12/16.
//  Copyright © 2016 Vicky Tang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Close keyboard by tapping anywhere or you can just (command + K)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    //Properties
    var multiple = 0
    var currentSum = 0
    var nextSum = 0
    var firstPress = true
    
    //Outlets
    @IBOutlet weak var chalkboardbg: UIImageView!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var multiplesTitle: UIImageView!
    @IBOutlet weak var multipleToAdd: UITextField!
    
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var playInstructions: UILabel!
    @IBOutlet weak var multiplesLbl: UILabel!
    @IBOutlet weak var exitBtn: UIButton!

    
    @IBAction func onPlayBtnPressed(sender: UIButton!) {
        if multipleToAdd.text != nil && multipleToAdd.text != "" {
            playBtn.hidden = true
            multiplesTitle.hidden = true
            multipleToAdd.hidden = true
            
            addBtn.hidden = false
            playInstructions.hidden = false
            exitBtn.hidden = false
            
            multiple = Int(multipleToAdd.text!)!
        }
    }
    
    @IBAction func onAddBtnPressed(sender: UIButton!) {
        if firstPress {
            playInstructions.hidden = true
            multiplesLbl.hidden = false
            firstPress = false
        }
        
        updateLbl()
    }
    
    @IBAction func onExitBtnPressed(sender: UIButton!) {
        restart()
    }
    
    func updateLbl() {
        nextSum = currentSum + multiple
        multiplesLbl.text = "\(currentSum) + \(multiple) = \(nextSum)"
        currentSum = nextSum
    }
    
    func restart() {
        playBtn.hidden = false
        multiplesTitle.hidden = false
        multipleToAdd.hidden = false
        
        addBtn.hidden = true
        playInstructions.hidden = true
        multiplesLbl.hidden = true
        exitBtn.hidden = true
        
        multiple = 0
        currentSum = 0
        nextSum = 0
        firstPress = true
        
        multipleToAdd.text = ""
    }
}

