//
//  ViewController.swift
//  GetApiWithMVVM
//
//  Created by Burak Afyonlu on 30.04.2023.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    private var schoolListViewModel : SchoolListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getData()
    }
    
    func getData() {
        
        let url = URL(string: "http://universities.hipolabs.com/search?country=United+States")!
        
        WebService().downloadApi(url: url) { (list) in
            
            if let list = list {
                
                self.schoolListViewModel = SchoolListViewModel(schoolList: list)
             
                DispatchQueue.main.async {
                    
                    self.tableView.reloadData()
                    
                }
                
            }
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.schoolListViewModel == nil ? 0 : self.schoolListViewModel.numberOfRowsInSection()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ApiTableViewCell
        
        let schoolViewModel = self.schoolListViewModel.schoolAtIndex(indexPath.row)
        
        cell.nameLabel.text = schoolViewModel.name
        cell.countryLabel.text = schoolViewModel.country
        cell.webPagesLabel.text = schoolViewModel.alpha_two_code
        
        return cell
        
    }

}

