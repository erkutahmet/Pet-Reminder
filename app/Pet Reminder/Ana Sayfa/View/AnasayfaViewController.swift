//
//  AnasayfaViewController.swift
//  Pet Reminder
//
//  Created by Ahmet Erkut on 29.03.2023.
//

import UIKit

class AnasayfaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    private var haberlerViewModel = HaberlerViewModel()
    let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()

        overrideUserInterfaceStyle = .dark  

        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension

        observer()

        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }

    private func observer(){
        haberlerViewModel.fetchData{ [weak self] success in
            if success{
                self?.tableView.reloadData()
            } else{
                self?.showErrorAlert()
            }
        }
    }

    @objc private func refresh(refreshControl: UIRefreshControl) {
        haberlerViewModel.fetchData { [weak self] success in
            if success{
                self?.tableView.reloadData()
                self?.refreshControl.endRefreshing()
            } else{
                self?.refreshControl.endRefreshing()
                self?.showErrorAlert()
            }
        }
    }

    private func showErrorAlert() {
        let alert = UIAlertController(title: "Hata", message: "Veriler yüklenirken bir hata oluştu. Lütfen tekrar deneyin.", preferredStyle: .alert)
        present(alert, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                alert.dismiss(animated: true, completion: nil)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return haberlerViewModel.haberlerData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HaberCell
        let haberlerData = haberlerViewModel.haberlerData
        cell.baslikLabel.text = haberlerData[indexPath.row].baslik
        cell.icerikLabel.text = haberlerData[indexPath.row].icerik
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //sohbet mesajlarını göster
        let vc = HaberIcerikViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}
