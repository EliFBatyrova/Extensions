//
//  ViewController.swift
//  Extensions
//
//  Created by Евгений on 15.12.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import UIKit
import Word_Counter

class ViewController: UIViewController {

    @IBOutlet weak var numberOfWordsLabel: UILabel!
    @IBOutlet weak var textView: UITextView!

    @IBAction func count(_ sender: Any) {
        let numberOfWords = textView.text.numberOfWords()
        numberOfWordsLabel.text = "\(numberOfWords)"
    }
}

