//
//  ViewController.swift
//  Silly Song
//
//  Created by Tomas Sidenfaden on 5/11/17.
//  Copyright © 2017 Tomas Sidenfaden. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!

    @IBAction func reset(_ sender: Any) {
        print("Reset Button")
        nameField.text = ""
        lyricsView.text = ""
        
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        if nameField.text != "" {
            lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
            print("Display Lyrics")
        }
    }
  
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("")
        textField.resignFirstResponder()
        return false
    }
    
}

func shortNameFromName(name: String) -> String {
    let lowercaseName = name.lowercased()
    let vowelSet = CharacterSet(charactersIn: "aeiou")
    let lowerBound = lowercaseName.startIndex
    let upperBound = lowercaseName.endIndex
    let rangeOfFirstChar = lowercaseName.rangeOfCharacter(from: vowelSet, options: [], range: lowerBound..<upperBound)
    let shortName = lowercaseName.substring(from: (rangeOfFirstChar?.lowerBound)!)
    print(shortName)
    return shortName
}

var bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    let shortName = shortNameFromName(name: fullName)
    let songLyrics = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName).replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    print(songLyrics)
    return songLyrics
}
