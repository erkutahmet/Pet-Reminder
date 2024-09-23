//
//  SohbetViewController.swift
//  Pet Reminder
//
//  Created by Ahmet Erkut on 29.03.2023.
//

import UIKit

class SohbetViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var sohbetArayuz: UITableView!

    let veterinerList = ["Veteriner Murat", "Karadeniz Veterinerlik", "Yıldız Veteriner", "Veteriner Ahmet", "Veteriner Ali"]
    let veterinerImage = ["vet2", "vet3", "vet1", "vet4", "vet5"]

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        sohbetArayuz.delegate = self
        //veri kaynağı
        sohbetArayuz.dataSource = self
    }

    // satır sayısı
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return veterinerList.count
    }

    // satıra düşen hücre
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SohbetTableViewCell
        cell.vetImage.layer.cornerRadius = 8.0
        cell.nameTextLbl.text = veterinerList[indexPath.row]
        cell.nameTextLbl.font = .systemFont(ofSize: 20.0, weight: .medium)
        cell.vetImage.image = UIImage(named: veterinerImage[indexPath.row])
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //sohbet mesajlarını göster
        let vc = SohbetArayuzViewController()
        vc.title = veterinerList[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
