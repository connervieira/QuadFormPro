//
//  ViewController.swift
//  QuadFormPro
//
//  Created by Conner Vieira on 5/21/19.
//  Copyright © 2019 V0LT. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var A: NSTextField!
    @IBOutlet weak var B: NSTextField!
    @IBOutlet weak var C: NSTextField!
    
    @IBOutlet weak var X1: NSTextField!
    @IBOutlet weak var X2: NSTextField!
    
    
    @IBOutlet weak var DiscriminantDisplay: NSTextField!
    
    var discriminant = 0.0; // Set default discriminant value
    var X1Value = 0.0; // Set default X1 value
    var X2Value = 0.0; // Set default X2 value
    
    var X1DisplayValue = ""; // Set default X1 display value
    var X2DisplayValue = ""; // Set default X2 display value
    
    var FullOutput = ""; // Set full output place holder to be used later
    
    override func viewDidLoad() {
        let timer = Timer.scheduledTimer(withTimeInterval: 0.0166666666, repeats: true, block: { timer in // Run calculations on a cycle 60 times per second
            self.discriminant = (self.B.doubleValue * self.B.doubleValue) - (4.0 * self.A.doubleValue * self.C.doubleValue); // Find the descriminant based on the A B and C values via the quadratic formula
            self.X1Value = ((-self.B.doubleValue + (sqrt(self.discriminant)))/(2.0 * self.A.doubleValue)); // Find the first X value using the quadratic formula
            self.X2Value = ((-self.B.doubleValue - (sqrt(self.discriminant)))/(2.0 * self.A.doubleValue)); // Find the second X value using the quadratic formula
            
            // Add "x = " to the beginning of each value to make it clear to the user what the output is
            self.X1DisplayValue = "x = " + String(self.X1Value);
            self.X2DisplayValue = "x = " + String(self.X2Value);
            
            // If X1 is unsolvable, then change "nan" to "Unsolvable" for readability
            if (self.X1DisplayValue == "x = nan") {
                self.X1DisplayValue = "Unsolvable";
            }
            
            // If X2 is unsolvable, then change "nan" to "Unsolvable" for readability
            if (self.X2DisplayValue == "x = nan") {
                self.X2DisplayValue = "Unsolvable";
            }
            
            
            self.FullOutput = self.X1DisplayValue + " or " + self.X2DisplayValue; // Combine the X1 and X2 Display Values to create a full output value
            
            
            self.DiscriminantDisplay.stringValue = "Discriminant = " + String(self.discriminant); // Desplay the descriminant
            
            self.X1.stringValue = self.X1DisplayValue; // Display X1
            self.X2.stringValue = self.X2DisplayValue; // Display X2
            
        });
    }
    
    @IBAction func SaveToClipboardAll(_ sender: Any) { // Save both X values to the clipboard
        let pasteBoard = NSPasteboard.general
        pasteBoard.clearContents()
        pasteBoard.writeObjects([((self.X1DisplayValue as NSString) as String) + " or " + self.X2DisplayValue as NSString])
    }
    
    @IBAction func SaveToClipboard1(_ sender: Any) { // Save the first X value to the clipboard
        let pasteBoard = NSPasteboard.general
        pasteBoard.clearContents()
        pasteBoard.writeObjects([self.X1DisplayValue as NSString])
    }
    @IBAction func SaveToClipboard2(_ sender: Any) { // Save the second X value to the clipboard
        let pasteBoard = NSPasteboard.general
        pasteBoard.clearContents()
        pasteBoard.writeObjects([self.X2DisplayValue as NSString])
    }
    @IBAction func SaveToClipboardDescriminant(_ sender: Any) { // Save the descriminant to the clipboard
        let pasteBoard = NSPasteboard.general
        pasteBoard.clearContents()
        pasteBoard.writeObjects([self.DiscriminantDisplay.stringValue as NSString])
    }
}

