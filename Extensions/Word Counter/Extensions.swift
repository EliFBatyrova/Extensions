//
//  Extensions.swift
//  Count words in text
//
//  Created by Евгений on 15.12.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

public extension String {
    func numberOfWords() -> Int {
        let chararacterSet = CharacterSet.whitespacesAndNewlines.union(.punctuationCharacters)
        let components = self.components(separatedBy: chararacterSet)
        let words = components.filter { !$0.isEmpty }
        return words.count
    }
}
