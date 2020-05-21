import UIKit

class GlobalViewController: UIViewController {
    @IBOutlet weak var NewConfirmed: UILabel!
    @IBOutlet weak var NewDeaths: UILabel!
    @IBOutlet weak var NewRecovered: UILabel!
    @IBOutlet weak var TotalConfirmed: UILabel!
    @IBOutlet weak var TotalDeaths: UILabel!
    @IBOutlet weak var TotalRecovered: UILabel!
    @IBOutlet weak var LastUpdated: UILabel!
    
    @IBAction func RefreshButton(_ sender: Any) {
        UpdateGlobalLabels()
    }
    
    
    public func UpdateGlobalLabels(){
        CovidAPI().FetchSummary(completion: { jsonObject in
            if let jsonObject = jsonObject {
                let global = jsonObject.Global
                
                let nc = String(global!.NewConfirmed)
                let nd = String(global!.NewDeaths)
                let nr = String(global!.NewRecovered)
                let tc = String(global!.TotalConfirmed)
                let td = String(global!.TotalDeaths)
                let tr = String(global!.TotalRecovered)
                let date = jsonObject.Date
                
                self.NewConfirmed.text = nc
                self.NewDeaths.text = nd
                self.NewRecovered.text = nr
                self.TotalConfirmed.text = tc
                self.TotalDeaths.text = td
                self.TotalRecovered.text = tr
                self.LastUpdated.text = date
            }
        })
    }
    
    override func viewDidLoad() {
        CovidAPI().FetchSummary(completion: { jsonObject in
            if let jsonObject = jsonObject {
                let global = jsonObject.Global
            
                let nc = String(global!.NewConfirmed)
                let nd = String(global!.NewDeaths)
                let nr = String(global!.NewRecovered)
                let tc = String(global!.TotalConfirmed)
                let td = String(global!.TotalDeaths)
                let tr = String(global!.TotalRecovered)
                let date = jsonObject.Date
                
                self.NewConfirmed.text = nc
                self.NewDeaths.text = nd
                self.NewRecovered.text = nr
                self.TotalConfirmed.text = tc
                self.TotalDeaths.text = td
                self.TotalRecovered.text = tr
                self.LastUpdated.text = date
            }
        })
    }


}

