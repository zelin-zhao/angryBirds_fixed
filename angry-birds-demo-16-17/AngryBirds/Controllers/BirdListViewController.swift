//
//  ViewController.swift
//  AngryBirds
//
//  Created by Chelsea Troy on 4/10/20.
//  Copyright © 2020 Chelsea Troy. All rights reserved.
//

import UIKit

class BirdListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var flock: [Bird] = []
    var birdService: BirdService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.birdService = BirdService()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let confirmedService = self.birdService else { return }
        
       confirmedService.getBirds(completion: { birds, error in
            guard let birds = birds, error == nil else {
                return
            }
            self.flock = birds
            self.tableView.reloadData()
       })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let destination = segue.destination as? DetailViewController,
            let selectedIndexPath = self.tableView.indexPathForSelectedRow,
            let confirmedCell = self.tableView.cellForRow(at: selectedIndexPath) as? BirdCell
            else { return }
        
        let confirmedBird = confirmedCell.bird
        destination.bird = confirmedBird
    }
}

extension BirdListViewController: UITableViewDataSource {
    //MARK: DataSource
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.flock.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "birdCell") as! BirdCell
        
        let currentBird = self.flock[indexPath.row]
        
        cell.bird = currentBird
                        
        return cell
    }
}

extension BirdListViewController: UITableViewDelegate {
    //MARK: Delegate
}

