//
//  HaberlerViewModel.swift
//  Pet Reminder
//
//  Created by Ahmet Erkut on 24.05.2023.
//

import Foundation
import Alamofire

class HaberlerViewModel {
    var haberlerData: [Haberler] = []

    func fetchData(completion: @escaping (Bool) -> Void){
        let url = Urls.newsUrl

        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let news = try decoder.decode([Haberler].self, from: data)
                    self.haberlerData = news
                    completion(true)
                } catch {
                    print("Haberler alınamadı.")
                    completion(false)
                }
            case .failure(let error):
                print("Haberler alınırken bir hata oluştu -> \(error)")
                completion(false)
            }
        }
    }
}
