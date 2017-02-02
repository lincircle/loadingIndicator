//
//  ViewController.swift
//  loadingIndicator
//
//  Created by Yuhsuan on 02/02/2017.
//  Copyright © 2017 cgua. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table_view: LoadingTableView!
    
    @IBAction func loadContent(_ sender: UIButton) {
        
        table_view.showLoadingIndicator()
        
        self.table_view.reloadData()
        
    }
    
    @IBAction func stop(_ sender: UIButton) {
        
        table_view.hideLoadingIndicator()
        
        self.table_view.reloadData()
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
        
    }
    
    

}

