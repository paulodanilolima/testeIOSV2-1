//
//  DashboardViewController.swift
//  TesteIOSV2-1
//
//  Created by Paulo Danilo Conceição Lima on 12/05/22.
//

import UIKit

class DashboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tvBankCell: UITableView!
    
    var viewModel: DashboardViewModel
    var service = DashboardService()
    var dataBills: [Bills?] = []
    let coordinator: AppCoordinator
    
    init(viewModel: DashboardViewModel, coordinator: AppCoordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tvBankCell.registerCell(reusable: BankCellTableViewCell.self)
        
        tvBankCell.reloadData()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        service.loadData { [weak self] result in
//            self!.dataBills = result
            
            self!.tvBankCell.reloadData()
        }
        
    }
    
    //-------------------------------------------------------------------------------------------------------------------------------
    // MARK: - TableView Delegate
    //-------------------------------------------------------------------------------------------------------------------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataBills.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: BankCellTableViewCell = tableView.dequeueCell(at: indexPath)
        
        cell.loadUI(debitName: "Eletricity Bill", debitValue: "\(dataBills[indexPath.row]?.electricityBill ?? "")")
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.Dashboard.TableView.heigth
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.Dashboard.TableView.headerHeigth
    }
    
    //----------------------------------
    // MARK: - LogOut
    //----------------------------------
    
    @IBAction func logOutPressed(_ sender: UIButton){
        dismiss(animated: true)
    }


}
