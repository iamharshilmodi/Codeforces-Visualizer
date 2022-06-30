//
//  visResController.swift
//  Codeforces Visualizer
//
//  Created by Harshil Modi on 27/06/22.
//

import UIKit
import Charts

class visResController: UIViewController {
    
    @IBOutlet weak var dp: UIImageView!
    @IBOutlet weak var rankName: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var currentRating: UILabel!
    @IBOutlet weak var maxRating: UILabel!
    @IBOutlet weak var contribution: UILabel!
    
    @IBOutlet weak var ratingGraph: LineChartView!
    var lineChartEntry = [ChartDataEntry]()
    var months = [String]()
    
    @IBOutlet weak var verdictsGraph: PieChartView!
    
    @IBOutlet weak var languages: PieChartView!
    
    @IBOutlet weak var problemLevels: HorizontalBarChartView!
    
    @IBOutlet weak var problemRatings: HorizontalBarChartView!
    
    @IBOutlet weak var tags: UITableView!
    
    
    var abtuser = aboutUser()
    var abtcontest = aboutContest()
    var abtproblem = aboutProblem()
    var username = "username"
    var curr_rank = "specialist"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        activityView.startAnimating()
//        activityView.hidesWhenStopped = true
        abtuser.delegate = self
        abtcontest.delegate = self
//        abtproblem.delegate = self
        
        abtuser.fetchData(username)
        abtcontest.fetchData(username)
        abtproblem.fetchData(username)
        
        dp.layer.cornerRadius = dp.frame.height / 2
        dp.clipsToBounds = true
        ratingGraph.backgroundColor = UIColor(named: "Custom_White")
        ratingGraph.animate(xAxisDuration: 3)
    }

}

// MARK: User Data
extension visResController: aboutUserDelegate {
    
    func didUpdateData(_ aboutuser: aboutUser, userdata: userData) {
        
        DispatchQueue.main.async {
        
//            print(userdata)
            self.curr_rank = userdata.result[0].rank
            self.userName.text = userdata.result[0].handle
            self.rankName.text = userdata.result[0].rank
            self.currentRating.text = String(userdata.result[0].rating)
            self.maxRating.text = String(userdata.result[0].maxRating)
            self.contribution.text = String(userdata.result[0].contribution)
            
            self.userName.textColor = UIColor(named: userdata.result[0].rank)
            self.rankName.textColor = UIColor(named: userdata.result[0].rank)
            self.currentRating.textColor = UIColor(named: userdata.result[0].rank)
            self.maxRating.textColor = UIColor(named: userdata.result[0].maxRank)
            
            let url = URL(string: userdata.result[0].titlePhoto)
            let data = try? Data(contentsOf: url!)

            if let imageData = data {
                let image = UIImage(data: imageData)
                self.dp.image = image
            }
            

        }
    }
    
    func didFailWithError(error: Error) {
        DispatchQueue.main.async {
//            self.errorLabel.text = "User Not Found"
//            self.activityView.stopAnimating()
//            self.tableView.isHidden = true
        }
    }
}

extension visResController: contestDataDelegate {
    
    func didUpdateData(_ aboutcontest: aboutContest, contestdata: contestData) {
       
        DispatchQueue.main.async {
            
            for i in 0..<contestdata.result.count {
            
            let epochTime = TimeInterval(contestdata.result[i].ratingUpdateTimeSeconds)
            let date = Date(timeIntervalSince1970: epochTime)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "LLLL"
            let monthString = dateFormatter.string(from: date)
            self.months.append(monthString)
            
            let val = ChartDataEntry(x: Double(i), y: Double(contestdata.result[i].newRating))
            
            self.lineChartEntry.append(val)
            
            
            }
            
            let set = LineChartDataSet(entries: self.lineChartEntry, label: "Rating")
            
            set.drawCirclesEnabled = true
            set.lineWidth = 2
            set.mode = .cubicBezier
            set.setColor(UIColor(named: self.curr_rank)!)
            set.setCircleColor(UIColor(named: self.curr_rank)!) // our circle will be dark red
            set.drawHorizontalHighlightIndicatorEnabled = false
            set.drawVerticalHighlightIndicatorEnabled = false
            set.circleRadius = 3.0
            set.drawCircleHoleEnabled = true
            
            let data = LineChartData(dataSet: set)
            
            data.setDrawValues(false)
            
            self.ratingGraph.data = data
            self.ratingGraph.rightAxis.enabled = false
            self.ratingGraph.xAxis.drawGridLinesEnabled = false
            self.ratingGraph.xAxis.labelPosition = .bottom
            self.ratingGraph.xAxis.valueFormatter = IndexAxisValueFormatter(values: self.months)
            
        }
        
//        for date in cntdate {
//            print(date)
//        }
//        for rating in cntrating {
//            print(rating)
//        }
        
    }
    
}
