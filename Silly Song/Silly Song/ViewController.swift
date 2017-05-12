//
//  ViewController.swift
//  Silly Song
//
//  Created by Tomas Sidenfaden on 5/11/17.
//  Copyright © 2017 Tomas Sidenfaden. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!

    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        if nameField.text != nil {
            lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
        } else {
            lyricsView.text = ""
        }
    }
}

func shortNameFromName(name: String) -> String {
    let lowercaseName = name.lowercased()
    let vowelSet = CharacterSet(charactersIn: "aeiou")
    let lowerBound = lowercaseName.startIndex
    let upperBound = lowercaseName.endIndex
    let rangeOfFirstChar = lowercaseName.rangeOfCharacter(from: vowelSet, options: [], range: lowerBound..<upperBound)
    let shortName = lowercaseName.substring(from: (rangeOfFirstChar?.lowerBound)!)
    
    return shortName
}

var bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    let shortName = shortNameFromName(name: fullName)
    let lowerBound = lyricsTemplate.startIndex
    let upperBound = lyricsTemplate.endIndex
    let songLyricsWithFullName = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName, options: [], range: lowerBound..<upperBound)
    let lowerBound1 = songLyricsWithFullName.startIndex
    let upperBound1 = songLyricsWithFullName.endIndex
    let completeSongLyrics = songLyricsWithFullName.replacingOccurrences(of: "<SHORT_NAME>", with: shortName, options: [], range: lowerBound1..<upperBound1)
    return completeSongLyrics
}
