//
//  HomeViewController.swift
//  PhilipTour
//
//  Created by NHN on 2021/01/30.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource {
    var placeLabelList = ["홍천", "남이섬", "여수"]
    var dateLabelList = ["7/9 - AM 10:00", "7/10 - PM 02:00", "7/10 - PM 04:00"]
    var placeImageList = ["HomeImage01.jpg", "HomeImage02.jpg", "HomeImage03.jpg"]
    
    let filterView: HomeFilterView = {
        let view = HomeFilterView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.navigationItem.title = "나의 여행지"
        
        let image = UIImage(named: "filter_icon.png")?.withRenderingMode(.alwaysOriginal)
        let filterButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(onClickFilter(_:)))
        self.navigationItem.rightBarButtonItem = filterButton
        
        self.view.addSubview(filterView)
        
        let safeArea = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            filterView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 5),
            filterView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10),
            filterView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.4),
            filterView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        let nibName = UINib(nibName: "HomeTableViewCell", bundle: nil)
        self.tableView.register(nibName, forCellReuseIdentifier: "HomeTableCell")
    }

    @objc func onClickFilter(_ sender: Any) {
        filterView.isHidden = !filterView.isHidden
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.placeLabelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "HomeTableCell") as! HomeTableViewCell
        
        cell.placeLabel.text = self.placeLabelList[indexPath.row]
        cell.dateLabel.text = self.dateLabelList[indexPath.row]
        cell.placeImageView.image = UIImage(named: self.placeImageList[indexPath.row])
    
        return cell
    }
}
