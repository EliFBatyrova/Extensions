//
//  ActionViewController.swift
//  Count words in text
//
//  Created by Евгений on 15.12.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import UIKit
import MobileCoreServices
import Word_Counter

class ActionViewController: UIViewController {
    
    @IBOutlet weak var numberOfWordsLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.isEditable = false
        textView.isSelectable = false
        var text = ""
        
        let textItem = self.extensionContext!.inputItems[0] as! NSExtensionItem
        let textItemProvider = textItem.attachments![0]
        if textItemProvider.hasItemConformingToTypeIdentifier(kUTTypeText as String) {
            textItemProvider.loadItem(forTypeIdentifier: kUTTypeText as String, options: nil, completionHandler: { [weak self] (result, error) in
                text = result as? String ?? ""
                DispatchQueue.main.async {
                    self?.textView.text = text
                    let numberOfWords = text.numberOfWords()
                    self?.numberOfWordsLabel.text = "\(numberOfWords)"
                }
            }
        )}
    }
    
    @IBAction func done() {
        self.extensionContext!.completeRequest(returningItems: self.extensionContext!.inputItems, completionHandler: nil)
    }
}
