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
    
    @IBAction func parse(_ sender: UIButton) {
        var outputText = ""
        if let input = inputField.text {
            let nodes = mecab.parseToNode(with: input) as! [Node]
            for node in nodes {
                outputText += "\(node.surface!) [\(node.partOfSpeech()!)] "
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
