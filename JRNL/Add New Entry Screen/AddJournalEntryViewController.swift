//
//  AddJournalEntryViewController.swift
//  JRNL
//
//  Created by 어재선 on 5/10/24.
//

import UIKit
import CoreLocation

class AddJournalEntryViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var bodyTextView: UITextView!
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var saveButton:UIBarButtonItem!
    
    @IBOutlet var getLocationSwitch: UISwitch!
    @IBOutlet var getLocationSwitchLabel: UILabel!
    
    var newJournalEntry: JournalEntry?
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.delegate = self
        bodyTextView.delegate = self
        updateSaveButtonState()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let title = titleTextField.text ?? ""
        let body = bodyTextView.text ?? ""
        let photo = photoImageView.image
        let rating = 3
        newJournalEntry = JournalEntry(rating: rating, title: title, body: body, photo: photo)
    }
    
    //MARK: - UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    


    func textFieldDidBeginEditing(_ textField: UITextField) {
        updateSaveButtonState()
    }

    
    
    // MARK: - UITextViewDelegate
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if(text == "\n") {
            textView.resignFirstResponder()
        }
        updateSaveButtonState()
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        updateViewConstraints()
    }
    
    // MARK: - Mathods
    
    private func updateSaveButtonState(){
        let textFieldText = titleTextField.text ?? ""
        let textViewText = bodyTextView.text ?? ""
        saveButton.isEnabled = !textFieldText.isEmpty && !textViewText.isEmpty
    }
}
