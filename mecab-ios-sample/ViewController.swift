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
    
    @IBAction func tokenize() {
        var outputText = ""
        if let text = inputField.text {
            // parse the text from inputField
            let tokens = tokenizer.parse(text)
            
            // append information from each token
            for token: Token in tokens {
                // all tokens have a surface property (the exact substring)
                outputText += "\(token.surface)\n"
                
                // but the other properties aren't required, so they're optional
                if let reading = token.reading {
                    outputText += "読み: \(reading)\n"
                }
                
                if let originalForm = token.originalForm {
                    outputText += "原形: \(originalForm)\n"
                }
                
                if let inflection = token.inflection {
                    outputText += "活用形: \(inflection)\n"
                }
                outputText += "品詞: \(token.partsOfSpeech.joined(separator: "、"))\n\n" // if there are no parts of speech, it's an empty array, not nil
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
