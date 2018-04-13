//
//  ViewController.swift
//  mecab-ios-sample
//
//  Created by Landon Epps on 2018/04/04.
//  Copyright © 2018 Landon Epps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let tokenizer = Tokenizer()
    
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var outputTextArea: UITextView!
    
    @IBAction func parse() {
        var outputText = ""
        if let text = inputField.text {
            // parse the text from inputField
            let tokens = tokenizer.parse(text: text)
            
            // append information from each token
            for token: Token in tokens {
                outputText = outputText + "\(token.surface)\n" +
                    "読み: \(token.reading ?? "<none>")\n" + // some tokens do not have a reading, so reading is an optional
                    "原形: \(token.originalForm ?? "<none>")\n" + // as is originalForm
                    "品詞: \(token.partsOfSpeech.joined(separator: "、"))\n\n"
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
