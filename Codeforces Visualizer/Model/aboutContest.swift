//
//  aboutContest.swift
//  Codeforces Visualizer
//
//  Created by Harshil Modi on 27/06/22.
//

import Foundation


protocol contestDataDelegate {
    func didUpdateData(_ aboutcontest: aboutContest, contestdata: contestData)
    func didFailWithError(error: Error)
}

struct aboutContest {
    
    let aboutURL = "https://codeforces.com/api/user.rating?handle"
    
    var delegate: contestDataDelegate?

    func fetchData(_ usrName: String) {
        let urlString = "\(aboutURL)=\(usrName)"
//        print(urlString)
        performRequest(with: urlString)
    }
    
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
//                    print("error")
//                    print(error!)
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
//                    let xyz = String(data: safeData, encoding: .utf8)
//                    print(xyz)
                    if let cntdata = self.parseJSON(safeData) {
//                        let xyz = String(data: safeData, encoding: .utf8)
//                        print("+++++++++++++++++++++++++++++++++++")
//                        print(cntdata)
                        self.delegate?.didUpdateData(self, contestdata : cntdata)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ cntData: Data) -> contestData? {
//        print("worked")
        let decoder = JSONDecoder()
        do {
            
            let decodedData = try decoder.decode(contestData.self, from: cntData)
            let returnData = decodedData
            return returnData
            
        } catch {
//            print("err")
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
    
}


