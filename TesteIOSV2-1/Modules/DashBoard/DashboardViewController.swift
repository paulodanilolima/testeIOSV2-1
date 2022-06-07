//
//  DashboardViewController.swift
//  TesteIOSV2-1
//
//  Created by Paulo Danilo Conceição Lima on 12/05/22.
//

import UIKit

class DashboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tvBankCell: UITableView!
    
    var viewModel = DashboardViewModel()
    var service = DashboardService()
    var data: [Bills?] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tvBankCell.register(UINib(nibName: "BankCellTableViewCell", bundle: nil), forCellReuseIdentifier: "BankCell")
        
        tvBankCell.reloadData()
    
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DashboardService().loadData { result in
            self.data = result
            
            self.tvBankCell.reloadData()
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        
    }
    
    //----------------------------------
    // MARK: - TableView Delegate
    //----------------------------------
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BankCell", for: indexPath) as! BankCellTableViewCell
        
        cell.loadUI(debitName: "Eletricity Bill", debitValue: "\(data[indexPath.row]?.electricityBill ?? "")")
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
    
    //----------------------------------
    // MARK: - LogOut
    //----------------------------------
    
    @IBAction func logOutPressed(_ sender: UIButton){
        dismiss(animated: true)
    }


}
