//
//  ViewController.swift
//  mecab-ios-sample
//
//  Created by Landon Epps on 2018/04/04.
//  Copyright © 2018 Landon Epps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let mecab = Mecab()
    
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var outputTextArea: UITextView!
    
    @IBAction func parse() {
        var outputText = ""
        if let input = inputField.text {
            let nodes = mecab.parseToNode(with: input) as! [Node]
            for node in nodes {
                if let surface = node.surface {
                    outputText += "\(surface)\n"
                }
                if let reading = node.reading() {
                    outputText += "読み: \(reading)\n"
                }
                if let pos = node.partOfSpeech() {
                    outputText += "PoS: \(pos)\n"
                }
                if let pos1 = node.partOfSpeechSubtype1(), pos1 != "*" {
                    outputText += "PoS1: \(pos1)\n"
                }
                if let pos2 = node.partOfSpeechSubtype2(), pos2 != "*" {
                    outputText += "PoS2: \(pos2)\n"
                }
                if let pos3 = node.partOfSpeechSubtype3(), pos3 != "*" {
                    outputText += "PoS3: \(pos3)\n"
                }
                outputText += "\n"
            }
        }
        outputTextArea.text = outputText
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
