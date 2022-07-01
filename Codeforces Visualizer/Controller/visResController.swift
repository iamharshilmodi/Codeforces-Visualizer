//
//  visResController.swift
//  Codeforces Visualizer
//
//  Created by Harshil Modi on 27/06/22.
//

import UIKit
import Charts

class visResController: UIViewController {
    
    var check = 0
    
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
//    var verdicts = [String : Int]()
    var verdicts : [String : Int] = ["AC":0, "WA":0, "MLE":0, "CE":0, "TLE":0,
                "PARTIAL":0, "CHALLENGED":0, "PE":0, "SKIPPED":0, "RE":0, "ILE":0]
    
    var vercol = ["AC":UIColor (named: "AC"), "WA":UIColor (named: "WA"), "MLE":UIColor (named: "MLE")
                  , "CE":UIColor (named: "CE"), "TLE":UIColor (named: "TLE"), "PARTIAL":UIColor (named: "partial")
                  , "CHALLENGED":UIColor (named: "challenged"), "PE":UIColor (named: "PE")
                  , "SKIPPED":UIColor (named: "skipped")
                  , "RE":UIColor (named: "RE"), "ILE":UIColor (named: "ILE")]
    var verdictColor = [UIColor]()
    var verdictEntry = [PieChartDataEntry]()
    
    @IBOutlet weak var languages: PieChartView!
    var langs = [String : Int]()
    var langEntry = [PieChartDataEntry]()
    
    
    @IBOutlet weak var problemLevels: BarChartView!
    var levels = [String : Int]()
    var prblev = [String]()
    var levcnt = [Int]()
    var levEntry = [BarChartDataEntry]()
    

    @IBOutlet weak var problemRatings: BarChartView!
    var ratings = [Int : Int]()
    var prbrating = [Int]()
    var xrating = [String]()
    var ratingEntry = [BarChartDataEntry]()
    
    @IBOutlet weak var tags: UITableView!
    var probTags = [String : Int]()
    var tag = [String]()
    var tagcnt = [Int]()
    
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
        abtproblem.delegate = self
        
        abtuser.fetchData(username)
        abtcontest.fetchData(username)
        abtproblem.fetchData(username)
        
        dp.layer.cornerRadius = dp.frame.height / 2
        dp.clipsToBounds = true
        
        ratingGraph.backgroundColor = UIColor(named: "Custom_White")
        ratingGraph.animate(xAxisDuration: 3)
        
        tags.delegate = self
        tags.dataSource = self
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
            self.check += 1
            

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
            
            let temp = contestdata.result[contestdata.result.count - 1].newRating
            if(temp < 1200)
            {
                self.curr_rank = "newbie"
            }
            else if(temp < 1400)
            {
                self.curr_rank = "pupil"
            }
            else if(temp < 1600)
            {
                self.curr_rank = "specialist"
            }
            else if(temp < 1900)
            {
                self.curr_rank = "expert"
            }
            else if(temp < 2100)
            {
                self.curr_rank = "candidate master"
            }
            else if(temp < 2300)
            {
                self.curr_rank = "master"
            }
            else if(temp < 2400)
            {
                self.curr_rank = "international master"
            }
            else if(temp < 2600)
            {
                self.curr_rank = "grandmaster"
            }
            else if(temp < 3000)
            {
                self.curr_rank = "international grandmaster"
            }
            else
            {
                self.curr_rank = "legendary grandmaster"
            }
            
            let set = LineChartDataSet(entries: self.lineChartEntry, label: self.username)
            
            set.drawCirclesEnabled = true
            set.lineWidth = 2
            set.mode = .cubicBezier
            set.setColor(UIColor(named: self.curr_rank)!)
            set.setCircleColor(UIColor(named: self.curr_rank)!) // our circle will be dark red
            set.drawHorizontalHighlightIndicatorEnabled = false
            set.drawVerticalHighlightIndicatorEnabled = false
            set.circleRadius = 4.0
            set.drawCircleHoleEnabled = true
            
            let data = LineChartData(dataSet: set)
            
            data.setDrawValues(false)
            
            
            self.ratingGraph.legend.enabled = false
            self.ratingGraph.rightAxis.enabled = false
            self.ratingGraph.xAxis.drawGridLinesEnabled = false
            self.ratingGraph.xAxis.labelPosition = .bottom
            self.ratingGraph.xAxis.valueFormatter = IndexAxisValueFormatter(values: self.months)
            self.ratingGraph.data = data
            self.check += 1
        }
    }
}

extension visResController: problemDataDelegate {
    
    func didUpdateData(_ aboutproblem: aboutProblem, problemdata: problemData) {
       
        
        DispatchQueue.main.async {
            
            for i in 0..<problemdata.result.count {
                
                var ver = ""
                let ind = problemdata.result[i].problem.index!
                
                if(problemdata.result[i].verdict! == "OK"){
                    ver = "AC"
                    if(self.langs[problemdata.result[i].programmingLanguage!] != nil){
                        self.langs[problemdata.result[i].programmingLanguage!]! += 1
                    }else{
                        self.langs[problemdata.result[i].programmingLanguage!] = 1
                    }
                    
                    if(self.levels[String(ind.first!)] != nil){
                        self.levels[String(ind.first!)]! += 1
                    }else{
                        self.levels[String(ind.first!)] = 1
                    }
                    
                    if(problemdata.result[i].problem.rating != nil ){
                        if(self.ratings[problemdata.result[i].problem.rating!] != nil){
                            self.ratings[problemdata.result[i].problem.rating!]! += 1
                        }else{
                            self.ratings[problemdata.result[i].problem.rating!] = 1
                        }
                    }
                      
                    for tag in problemdata.result[i].problem.tags {
                        
                        if(self.probTags[tag!] != nil){
                            self.probTags[tag!]! += 1
                        }else{
                            self.probTags[tag!] = 1
                        }
                    }
                }
                else if(problemdata.result[i].verdict! == "RUNTIME_ERROR"){
                    ver = "RE"
                }
                else if(problemdata.result[i].verdict! == "WRONG_ANSWER"){
                    ver = "WA"
                }
                else if(problemdata.result[i].verdict! == "TIME_LIMIT_EXCEEDED"){
                    ver = "TLE"
                }
                else if(problemdata.result[i].verdict! == "MEMORY_LIMIT_EXCEEDED"){
                    ver = "MLE"
                }
                else if(problemdata.result[i].verdict! == "IDLENESS_LIMIT_EXCEEDED"){
                    ver = "ILE"
                }
                else if(problemdata.result[i].verdict! == "COMPILATION_ERROR"){
                    ver = "CE"
                }
                else if(problemdata.result[i].verdict! == "PRESENTATION_ERROR"){
                    ver = "PE"
                }
                
                if(self.verdicts[ver] != nil){
                    self.verdicts[ver]! += 1
                }
                
                
            }
//            print(self.verdicts)
//            print(self.langs)
//            print(self.levels)
//            print(self.ratings)
//            print(self.probTags)
            
            //MARK: verdict graph
            self.verdictsGraph.chartDescription.enabled = false
            self.verdictsGraph.drawHoleEnabled = false
            self.verdictsGraph.rotationEnabled = false
            self.verdictsGraph.isUserInteractionEnabled = false
            self.verdictsGraph.drawEntryLabelsEnabled = true
            self.verdictsGraph.entryLabelFont = UIFont (name: "Arial", size: 15)
            
            self.verdictsGraph.entryLabelColor = UIColor (named: "fontColor")
            
            for (verd, cnt) in self.verdicts {
                if(cnt>0)
                {
                    self.verdictEntry.append(PieChartDataEntry(value: Double(cnt), label: verd))
                    self.verdictColor.append(self.vercol[verd]!!)
                }
            }
            
            let verset = PieChartDataSet(entries: self.verdictEntry, label: "")
            verset.drawValuesEnabled = false
            verset.colors = self.verdictColor
            verset.xValuePosition = .outsideSlice
            verset.useValueColorForLine = false
            verset.valueLineColor = UIColor (named: "fontColor")!
            verset.valueTextColor = UIColor (named: "fontColor")!
            verset.yValuePosition = .outsideSlice
            self.verdictsGraph.data = PieChartData(dataSet: verset)
            
            
            //MARK: Language graph
            self.languages.chartDescription.enabled = false
            self.languages.drawHoleEnabled = false
            self.languages.rotationEnabled = false
            self.verdictsGraph.isUserInteractionEnabled = false
            self.languages.drawEntryLabelsEnabled = true
            self.languages.entryLabelFont = UIFont (name: "Arial", size: 15)
            
            self.languages.entryLabelColor = UIColor (named: "fontColor")
            
            for (lang, cnt) in self.langs {
                    self.langEntry.append(PieChartDataEntry(value: Double(cnt), label: lang))
            }
            
            let langset = PieChartDataSet(entries: self.langEntry, label: "")
            langset.drawValuesEnabled = false
            langset.colors = ChartColorTemplates.colorful()
            langset.xValuePosition = .outsideSlice
            langset.useValueColorForLine = false
            langset.valueLineColor = UIColor (named: "fontColor")!
            langset.valueTextColor = UIColor (named: "fontColor")!
            langset.yValuePosition = .outsideSlice
            self.languages.data = PieChartData(dataSet: langset)
            
            //MARK: Levels graph
            
            self.prblev = Array(self.levels.keys).sorted(by: <)
            
            self.problemLevels.xAxis.labelPosition = .bottom
            self.problemLevels.xAxis.drawAxisLineEnabled = true
            self.problemLevels.xAxis.drawGridLinesEnabled = false
            self.problemLevels.xAxis.drawLabelsEnabled = true
//            self.problemLevels.xAxis.labelRotationAngle = -90
            self.problemLevels.highlightPerTapEnabled = false
            self.problemLevels.highlightFullBarEnabled = false
            self.problemLevels.highlightPerDragEnabled = false
            self.problemLevels.legend.enabled = false
            self.problemLevels.pinchZoomEnabled = false
            self.problemLevels.doubleTapToZoomEnabled = false
            
            self.problemLevels.xAxis.setLabelCount(self.prblev.count, force: false)
            
            self.problemLevels.leftAxis.drawAxisLineEnabled = true
            self.problemLevels.leftAxis.drawGridLinesEnabled = true
            self.problemLevels.leftAxis.drawLabelsEnabled = true
            self.problemLevels.leftAxis.granularityEnabled = true
            self.problemLevels.leftAxis.granularity = 1.0
            self.problemLevels.rightAxis.enabled = false
            
            
            
            for i in 0..<self.prblev.count {
                self.levEntry.append(BarChartDataEntry(x: Double(i), y: Double(self.levels[self.prblev[i]]!)))
            }
            
            self.problemLevels.xAxis.valueFormatter = IndexAxisValueFormatter(values: self.prblev)
            
            let levset = BarChartDataSet(entries: self.levEntry)
            levset.setColor(UIColor (named: self.curr_rank)!)
            
            self.problemLevels.data = BarChartData(dataSet: levset)
            
            
            
            //MARK: Problem Rating graph
            
            self.prbrating = Array(self.ratings.keys).sorted(by: <)
            
            self.problemRatings.xAxis.labelPosition = .bottom
            self.problemRatings.xAxis.drawAxisLineEnabled = true
            self.problemRatings.xAxis.drawGridLinesEnabled = false
            self.problemRatings.xAxis.drawLabelsEnabled = true
            self.problemRatings.xAxis.labelRotationAngle = -90
            self.problemRatings.highlightPerTapEnabled = false
            self.problemRatings.highlightFullBarEnabled = false
            self.problemRatings.highlightPerDragEnabled = false
            self.problemRatings.legend.enabled = false
            self.problemRatings.pinchZoomEnabled = false
            self.problemRatings.doubleTapToZoomEnabled = false
            
            self.problemRatings.xAxis.setLabelCount(self.prbrating.count, force: false)
            
            self.problemRatings.leftAxis.drawAxisLineEnabled = true
            self.problemRatings.leftAxis.drawGridLinesEnabled = true
            self.problemRatings.leftAxis.drawLabelsEnabled = true
            self.problemRatings.leftAxis.granularityEnabled = true
            self.problemRatings.leftAxis.granularity = 1.0
            
            self.problemRatings.rightAxis.enabled = false
            
            
            
            for i in 0..<self.prbrating.count {
                self.ratingEntry.append(BarChartDataEntry(x: Double(i), y: Double(self.ratings[self.prbrating[i]]!)))
                self.xrating.append(String(self.prbrating[i]))
            }
            
            self.problemRatings.xAxis.valueFormatter = IndexAxisValueFormatter(values: self.xrating)
            
            let ratset = BarChartDataSet(entries: self.ratingEntry)
            ratset.setColor(UIColor (named: self.curr_rank)!)
            ratset.valueFormatter = DefaultValueFormatter(decimals: 0)
            
            self.problemRatings.data = BarChartData(dataSet: ratset)
            
        }
    }
}

extension visResController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return probTags.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
