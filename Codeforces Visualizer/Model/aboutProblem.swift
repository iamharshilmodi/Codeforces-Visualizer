//
//  aboutProblem.swift
//  Codeforces Visualizer
//
//  Created by Harshil Modi on 27/06/22.
//


import Foundation


protocol problemDataDelegate {
    func didUpdateData(_ dataStruct: problemData)
    func didFailWithError(error: Error)
}

struct aboutProblem {
    
    let aboutURL = "https://codeforces.com/api/user.status?handle"
    
    var delegate: problemDataDelegate?

    func fetchData(_ usrName: String) {
        let urlString = "\(aboutURL)=\(usrName)"
        print(urlString)
        performRequest(with: urlString)
    }
    
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("error")
                    print(error!)
//                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
//                    let xyz = String(data: safeData, encoding: .utf8)
//                    print(xyz)
                    if let prbdata = self.parseJSON(safeData) {
//                        let xyz = String(data: safeData, encoding: .utf8)
                        print("+++++++++++++++++++++++++++++++++++")
                        print(prbdata)
//                        self.delegate?.didUpdateData(udata)
                    }
                    else{
//                        print(Erreturn nilror)
//                        delegate?.didFailWithError(error: error)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ prbData: Data) -> problemData? {
//        print("worked")
        let decoder = JSONDecoder()
        do {
            
            let decodedData = try decoder.decode(problemData.self, from: prbData)
            let returnData = decodedData
            return returnData
            
        }catch let DecodingError.dataCorrupted(context) {
            print(context)
            return nil
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            return nil
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            return nil
        } catch let DecodingError.typeMismatch(type, context)  {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
            return nil
        } catch {
            print("error: ", error)
            return nil
        }
//        catch {
//            print(Error)
////            delegate?.didFailWithError(error: error)
//            return nil
//        }
    }
    
    
    
}


