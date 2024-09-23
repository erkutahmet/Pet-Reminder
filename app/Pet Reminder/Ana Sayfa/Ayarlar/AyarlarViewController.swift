//
//  AyarlarViewController.swift
//  Pet Reminder
//
//  Created by Ahmet Erkut on 29.03.2023.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class AyarlarViewController: UIViewController {

    @IBOutlet weak var isimLabel: UILabel!
    @IBOutlet weak var soyisimLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var sifreLabel: UILabel!
    @IBOutlet weak var passShowImage: UIImageView!
    @IBOutlet weak var parolaButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!

    let db = Firestore.firestore()
    var kullaniciSifre = ""
    var kullaniciEmail = ""
    let showPass = UIImage.init(named: "showPass")
    let hidePass = UIImage.init(named: "hidePass")
    var passStatus = true

    override func viewDidLoad() {
        super.viewDidLoad()

        overrideUserInterfaceStyle = .dark
        emailButton.layer.cornerRadius = 10.0
        parolaButton.layer.cornerRadius = 10.0

        guard let userID = Auth.auth().currentUser?.uid as? String else { return }
        let docRef = db.collection("Kullanici").document(userID)
        print("\nUser id = \(userID)\n")
        sifreLabel.text = "********"
        passShowImage.image = hidePass

        docRef.addSnapshotListener { snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            guard let isim = data["isim"] as? String else {
                return
            }
            guard let soyisim = data["soyisim"] as? String else {
                return
            }
            guard let email = data["e-mail"] as? String else {
                return
            }
            guard let sifre = data["sifre"] as? String else {
                return
            }
            DispatchQueue.main.async {
                self.isimLabel.text = isim
                self.soyisimLabel.text = soyisim
                self.emailLabel.text = email
                self.kullaniciSifre = sifre
                self.kullaniciEmail = email
            }
        }
    }

    private func logutAlert() {
        let alert = UIAlertController(title: "Dikkat", message: "Çıkış yapmak istiyor musunuz?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Evet", style: .destructive, handler: { [weak self] _ in
            self?.logutUser()
        }))
        alert.addAction(UIAlertAction(title: "Hayır", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    private func logoutLog(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        present(alert, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            alert.dismiss(animated: true, completion: nil)
        }
    }

    private func logutUser(){
        do{
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "girisSayfasina", sender: "exit")
        } catch {
            logoutLog(title: "Bilgi", message: "Çıkış yapılırken bir hata oluştu!\nTekrar deneyiniz..")
        }
    }

    @IBAction func cikisYapTiklandi(_ sender: Any) {
        logutAlert()
    }

    @IBAction func passShowButtonTiklandi(_ sender: Any) {
        if passStatus == true{
            passShowImage.image = showPass
            sifreLabel.text = kullaniciSifre
            passStatus = false
        } else{
            passShowImage.image = hidePass
            sifreLabel.text = "********"
            passStatus = true
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "emailDegis"{
            if let vc = segue.destination as? E_mailDegisViewController{
                vc.email = kullaniciEmail
            }
        }

        if segue.identifier == "parolaDegis"{
            if let vc = segue.destination as? ParolaDegisViewController{
                vc.sifre = kullaniciSifre
            }
        }

        if segue.identifier == "girisSayfasina"{
            if let destinationVC = segue.destination as? ViewController{
                if let exitValue = sender as? String {
                    destinationVC.receivedData = exitValue
                }
            }
        }
    }
}
