import UIKit
var countriesList = [Country]()
var indexKey = ""

class CountriesViewController: UIViewController,   UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var countryTable: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (countriesList.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = countriesList[indexPath.row].Country
        
        // defaults.set(inProgressList, forKey: "inProgressList")
        return(cell)
    }
    
    // Edits task on click of table cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        indexKey = countriesList[indexPath.row].Country
        // print(String(CovidAPI().FetchSummary(completion: user)))
        self.performSegue(withIdentifier: "SegueCountryView", sender: nil)
    }
    
    override func viewDidLoad() {
        CovidAPI().FetchSummary(completion: { jsonObject in
            if let jsonObject = jsonObject {
                let countries = jsonObject.Countries
                for country in countries{
                    countriesList.append(country!)
                }
                self.countryTable.reloadData()
            }
        })
        // Do any additional setup after loading the view, typically from a nib.
    }


}

