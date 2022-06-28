//
//  dataCollection.swift
//  Codeforces Visualizer
//
//  Created by Harshil Modi on 26/06/22.
//

import Foundation


protocol aboutUserDelegate {
    func didUpdateData(_ aboutuser: aboutUser, userdata: userData)
    func didFailWithError(error: Error)
}

struct aboutUser {
    
    let aboutURL = "https://codeforces.com/api/user.info?handles"
    
    var delegate: aboutUserDelegate?
    
    func fetchData(_ usrName: String) {
        let urlString = "\(aboutURL)=\(usrName)"
        performRequest(with: urlString)
    }
    
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
//                    print("+++++++++++++++++++++++++++++++++")
//                    print(response!)
//                    print("failed")
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let udata = self.parseJSON(safeData) {
//                        let xyz = String(data: udata, encoding: .utf8)
//                        print("---------------------------------")
//                        print(udata)
//                        DispatchQueue.main.async {
                            self.delegate?.didUpdateData(self, userdata: udata)
//                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ usdt: Data) -> userData? {
        let decoder = JSONDecoder()
        do {
            
            let decodedData = try decoder.decode(userData.self, from: usdt)
            let returnData = decodedData
            return returnData
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
    
}


