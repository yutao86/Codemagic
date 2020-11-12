//
//  ViewController.swift
//  ALERT
//
//  Created by Tom Yu on 2020/11/12.
//

import UIKit

class ViewController: UITableViewController {

    private let sections = 3
    
    private enum Section: Int, CaseIterable {
        case alertStyles = 0
        case systemAlerts
        case others
        static let names = [ "Alert Styles", "System Examples", "Others"]
        
        enum AlertStyle: Int, CaseIterable {
            case alert = 0
            case actionSheet = 1
            static let names = [ "Alert Style", "Action Sheet Style", ]
        }
        
        enum SystemAlerts: Int, CaseIterable {
            case appleId = 0
            case signInWithAppleId = 1
            case turnOffSafari = 2
            case enableTouchId = 3
            case requestLocationAuthorization = 4
            case touchIdToViewSavedPasswords = 5
            static let names = [ "Apple ID", "Sign In with Apple ID", "Turn Off Safari", "Enable Touch ID", "Request Location Authorization", "Touch ID to View Saved Passwords", ]
        }
        
        enum Others: Int, CaseIterable {
            case textField
            case customView
            static let names = [ "Alert with TextField", "Custom View Alert (Not Recommended)", ]
        }
    }
    
    private let cellId = "CellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    // MARK: UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Section(rawValue: section)! {
        case .alertStyles:
            return Section.AlertStyle.allCases.count
        case .systemAlerts:
            return Section.SystemAlerts.allCases.count
        case .others:
            return Section.Others.allCases.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId)!
        switch Section(rawValue: indexPath.section)! {
        case .alertStyles:
            cell.textLabel?.text = Section.AlertStyle.names[indexPath.row]
        case .systemAlerts:
            cell.textLabel?.text = Section.SystemAlerts.names[indexPath.row]
        case .others:
            cell.textLabel?.text = Section.Others.names[indexPath.row]
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Section.names[section]
    }
    
    // MARK: UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        switch Section(rawValue: indexPath.section)! {
        case .alertStyles:
            switch Section.AlertStyle(rawValue: indexPath.row)! {
            case .alert:
                appleId()
            case .actionSheet:
                turnOffSafari()
            }
        case .systemAlerts:
            switch Section.SystemAlerts(rawValue: indexPath.row)! {
            case .appleId:
                appleId()
            case .signInWithAppleId:
                signInWithAppleId()
            case .turnOffSafari:
                turnOffSafari()
            case .enableTouchId:
                enableTouchId()
            case .requestLocationAuthorization:
                requestLocationAuthorization()
            case .touchIdToViewSavedPasswords:
                touchIdToViewSavedPasswords()
            }
        case .others:
            switch Section.Others(rawValue: indexPath.row)! {
            case .textField:
                signInWithAppleId()
            case .customView:
                actionSheetWithCustomView()
            }
        }
        
        return nil
    }
    
    // MARK: - Initialization
    
    private func initialize() {
        title = "Alerts"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.backgroundColor = .systemBackground
    }
    
    // MARK: - Alerts

    private func appleId() {
        
        let title = "Apple ID"
        let messsage = "yutao86@gmail.com"
        let alert = UIAlertController(title: title, message: messsage, preferredStyle: .alert)
        
        let viewString = "View Apple ID"
        let viewAppleId = UIAlertAction(title: viewString, style: .default) { (action) in
            print(viewString)
        }
        
        let signOutString = "Sign Out"
        let signOut = UIAlertAction(title: signOutString, style: .default) { (action) in
            print(signOutString)
        }
        
        let iForgotString = "iForgot"
        let iForgot = UIAlertAction(title: iForgotString, style: .default) { (action) in
            print(iForgotString)
        }
        
        let cancelString = "Cancel"
        let cancel = UIAlertAction(title: cancelString, style: .cancel) { (action) in
            print(cancelString)
        }
        
        alert.addAction(viewAppleId)
        alert.addAction(signOut)
        alert.addAction(iForgot)
        alert.addAction(cancel)
        
        present(alert, animated: true) {
            print(title)
        }
    }
    
    private func signInWithAppleId() {
        
        let title = "Sign In with Apple ID"
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        let OKString = "OK"
        let OK = UIAlertAction(title: OKString, style: .default) { (action) in
            print(OKString)
        }
        
        let cancelString = "Cancel"
        let cancel = UIAlertAction(title: cancelString, style: .cancel) { (action) in
            print(cancelString)
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Apple ID"
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Password"
            textField.isSecureTextEntry = true
        }
        
        alert.addAction(OK)
        alert.addAction(cancel)
        
        present(alert, animated: true) {
            print(title)
        }
    }
    
    private func enableTouchId() {
        
        let title = "Sign In with Apple ID"
        let messsage = "Your password is required to enable Touch ID. Enter the password for \"yutao86@gmail.com\""
        let alert = UIAlertController(title: title, message: messsage, preferredStyle: .alert)
        
        let OKString = "OK"
        let OK = UIAlertAction(title: OKString, style: .default) { (action) in
            print(OKString)
        }
        
        let cancelString = "Cancel"
        let cancel = UIAlertAction(title: cancelString, style: .cancel) { (action) in
            print(cancelString)
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Password"
            textField.isSecureTextEntry = true
        }
        
        alert.addAction(OK)
        alert.addAction(cancel)
        alert.preferredAction = OK
        
        present(alert, animated: true) {
            print(title)
        }
    }
    
    private func touchIdToViewSavedPasswords() {
        
        let title = "\n\n\nTouch ID to view Saved Passwords"
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        let cancelString = "Cancel"
        let cancel = UIAlertAction(title: cancelString, style: .cancel) { (action) in
            print(cancelString)
        }
        alert.addAction(cancel)
        
        let imageView = UIImageView(image: UIImage(named: "TouchID"))
        alert.view.addSubview(imageView)
        
        let length: CGFloat = 60.0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 10.0).isActive = true
        imageView.centerXAnchor.constraint(equalTo: alert.view.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: length).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: length).isActive = true
        
        present(alert, animated: true) {
            print(title)
        }
    }
    
    private func requestLocationAuthorization() {
        
        let title = "Allow \"App Store\" to use you location?"
        let messsage = "This information will be used to suggest Apps that are more relevant to you."
        let alert = UIAlertController(title: title, message: messsage, preferredStyle: .alert)
        
        let allowWhileUsingAppString = "Allow While Using App"
        let allowWhileUsingApp = UIAlertAction(title: allowWhileUsingAppString, style: .default) { (action) in
            print(allowWhileUsingAppString)
        }
        
        let allowOnceString = "Allow Once"
        let allowOnce = UIAlertAction(title: allowOnceString, style: .default) { (action) in
            print(allowOnceString)
        }
        
        let dontAllowString = "Don't Allow"
        let dontAllow = UIAlertAction(title: dontAllowString, style: .default) { (action) in
            print(dontAllowString)
        }
        
        alert.addAction(allowWhileUsingApp)
        alert.addAction(allowOnce)
        alert.addAction(dontAllow)
        alert.preferredAction = allowWhileUsingApp
        
        present(alert, animated: true) {
            print(title)
        }
    }
    
    // MARK: - Action Sheet
    
    private func turnOffSafari() {
        
        let title = "Turn Off Safari"
        let messsage = "What would you like to do with the previously synced iCloud Safari data on you iPhone?"
        let alert = UIAlertController(title: title, message: messsage, preferredStyle: .actionSheet)
        
        let keepString = "Keep on My iPhone"
        let keep = UIAlertAction(title: keepString, style: .default) { (action) in
            print(keepString)
        }
        
        let deleteString = "Delete from My iPhone"
        let delete = UIAlertAction(title: deleteString, style: .destructive) { (action) in
            print(deleteString)
        }
        
        let cancelString = "Cancel"
        let cancel = UIAlertAction(title: cancelString, style: .cancel) { (action) in
            print(cancelString)
        }
        
        alert.addAction(keep)
        alert.addAction(delete)
        alert.addAction(cancel)
        present(alert, animated: true) {
            print(title)
        }
    }
    
    private func actionSheetWithCustomView() {
        
        let alertController = UIAlertController(title: "\n\n\n\n\n\n", message: nil, preferredStyle: .actionSheet)
        
        let margin:CGFloat = 10.0
        let rect = CGRect(x: margin, y: margin, width: alertController.view.bounds.size.width - margin * 4.0, height: 120)
        let customView = UIView(frame: rect)
        
        customView.translatesAutoresizingMaskIntoConstraints = true
        customView.backgroundColor = .green
        alertController.view.addSubview(customView)
        
        let somethingAction = UIAlertAction(title: "Something", style: .default, handler: {(alert: UIAlertAction!) in print("something")})
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {(alert: UIAlertAction!) in print("cancel")})
        alertController.addAction(somethingAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion:{})
        
    }
}


