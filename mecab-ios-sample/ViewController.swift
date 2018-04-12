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
            // parse the text from inputField
            let nodes = mecab.parseToNode(with: input) as! [Node]
            
            // extract information from each node (token)
            for node in nodes {
                outputText = outputText + "\(node.surface ?? "*")\n" +
                    "読み: \(node.reading() ?? "*")\n" +
                    "原形: \(node.originalForm() ?? "*")\n" +
                    "PoS: \(node.partOfSpeech() ?? "*") " +
                    "\(node.partOfSpeechSubtype1() ?? "*") " +
                    "\(node.partOfSpeechSubtype2() ?? "*") " +
                    "\(node.partOfSpeechSubtype3() ?? "*")\n\n"
            }
        }
        outputTextArea.text = outputText
        // hide the keyboard
        inputField.resignFirstResponder()
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
