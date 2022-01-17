//
//  ScheduleViewController.swift
//  PhilipTour
//
//  Created by NHN on 2021/02/06.
//

import UIKit

class ScheduleViewController: UIViewController, UITableViewDataSource {
    
    var placeLabelList = ["영월역", "고씨동굴", "김삿갓", "법흥사", "젊은달 테마파크"]
    var dateLabelList = ["7/9 - AM 09:00", "7/9 - AM 11:00", "7/9 - PM 14:00", "7/9 - PM 16:00", "7/9 - PM 18:00"]
    var placeImageList = ["ScheduleImage01.jpg", "ScheduleImage02.jpg", "ScheduleImage03.jpg", "ScheduleImage04.jpg", "ScheduleImage05.jpg"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "상세 투어내역"
        
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        let nibName = UINib(nibName: "ScheduleTableViewCell", bundle: nil)
        self.tableView.register(nibName, forCellReuseIdentifier: "ScheduleTableCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.placeLabelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ScheduleTableCell") as! ScheduleTableViewCell
        
        cell.placeLabel.text = self.placeLabelList[indexPath.row]
        cell.dateLabel.text = self.dateLabelList[indexPath.row]
        cell.placeImageView.image = UIImage(named: self.placeImageList[indexPath.row])
        
        return cell
    }
    
}
