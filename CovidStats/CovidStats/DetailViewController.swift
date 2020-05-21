//
//  DetailViewController.swift
//  CovidStats
//
//  Created by Russell Azu on 5/20/20.
//  Copyright © 2020 Russell Azu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var NewConfirmed: UILabel!
    @IBOutlet weak var NewDeaths: UILabel!
    @IBOutlet weak var NewRecovered: UILabel!
    @IBOutlet weak var TotalConfirmed: UILabel!
    @IBOutlet weak var TotalDeaths: UILabel!
    @IBOutlet weak var TotalRecovered: UILabel!
    @IBOutlet weak var NavBar: UINavigationItem!
    
    @IBAction func CancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool){
        for country in countriesList{
            if country.Country == indexKey{
                NavBar.title = country.Country
                NewConfirmed.text = String(country.NewConfirmed)
                NewDeaths.text = String(country.NewDeaths)
                NewRecovered.text = String(country.NewRecovered)
                TotalConfirmed.text = String(country.TotalConfirmed)
                TotalDeaths.text = String(country.TotalDeaths)
                TotalRecovered.text = String(country.TotalRecovered)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}
