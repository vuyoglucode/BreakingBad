//
//  ViewController.swift
//  BadBreakingv3
//
//  Created by IACD-Air-8 on 2021/07/10.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var charTableView: UITableView!
    var characterDeats = [Character]()
    var characterQuote = [Quote]()
    var filteredQuotes = [Quote]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
      
        return characterDeats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = charTableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomTableViewCell
        cell.charName.text = characterDeats[indexPath.row].name
        cell.charNickname.text = characterDeats[indexPath.row].nickname
        cell.charDob.text = characterDeats[indexPath.row].dob.uppercased()
        cell.charImage.downloaded(from: (characterDeats[indexPath.row].img))
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: self)
    }
  
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
        {
            if let destination = segue.destination as? CharacterDetailsViewController
            {
                destination.character = characterDeats[(charTableView.indexPathForSelectedRow?.row)!]
                destination.characterQuotes = returnCharacterQuote(characterDeats[(charTableView.indexPathForSelectedRow?.row)!].name)
               
            }
        }
 /*   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let vc = storyboard?.instantiateViewController(withIdentifier: "showDetail") as? CharacterDetailViewController
        vc?.image = UIImage(named: characterDeats[indexPath.row].img )!
        vc?.name = characterDeats[indexPath.row].name
           navigationController?.pushViewController(vc!, animated: true)
    }
*/
  /*  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         performSegue(withIdentifier: "showDetail", sender: self)
     }
     
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if let destination = segue.destination as? CharacterDetailViewController{
             destination.characterDeats = characterDeats[(tableView.indexPathForSelectedRow?.row)!]
         }
     }
     */
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        downloadCharacterJSON {
            self.downloadQuoteJSON
            {
                print("Quotes Downloaded")
            }
            print("Its Basically  Working!!!")
            self.charTableView.reloadData()
        }
        charTableView.delegate = self
        charTableView.dataSource = self
    }
    func downloadCharacterJSON(completed: @escaping () -> ())
       {
          
        _ = URLComponents()
      


           let url = URL(string: "https://www.breakingbadapi.com/api/characters?limit=10")!
           let urlSession = URLSession.shared
           let urlRequest = URLRequest(url: url)

        let _: Void = urlSession.dataTask(with: urlRequest)
           {
               data, urlResponse, error in
              
               if let error = error
               {
                  
                   print("Error: \(error.localizedDescription)")
                   return
               }
              
               guard let unwrappedData = data else
               {
                   print("No data")
                   return
               }
              
              
               let jsonDecoder = JSONDecoder()
               do
               {
                   guard let characterList = try? jsonDecoder.decode([Character].self, from: unwrappedData) else
                   {
                       print("Could not decode")
                       return
                   }
                   DispatchQueue.main.async
                   {
                       completed()
                   }
                   print(characterList)
                   self.characterDeats = characterList
               }
           }.resume()
       }

    func downloadQuoteJSON(completed: @escaping () -> ())
       {
          
        _ = URLComponents()
      


           let url = URL(string: "https://www.breakingbadapi.com/api/quotes")!
           let urlSession = URLSession.shared
           let urlRequest = URLRequest(url: url)

        let _: Void = urlSession.dataTask(with: urlRequest)
           {
               data, urlResponse, error in
              
               if let error = error
               {
                  
                   print("Error: \(error.localizedDescription)")
                   return
               }
              
               guard let unwrappedData = data else
               {
                   print("No data")
                   return
               }
              
              
               let jsonDecoder = JSONDecoder()
               do
               {
                   guard let quoteList = try? jsonDecoder.decode([Quote].self, from: unwrappedData) else
                   {
                       print("Could not decode")
                       return
                   }
                   DispatchQueue.main.async
                   {
                       completed()
                   }
                   //print(quoteList)
                   self.characterQuote = quoteList
               }
           }.resume()
       }
    func returnCharacterQuote(_ characterName: String) -> [Quote]
        {
            
            
            filteredQuotes = characterQuote.filter
            {
                $0.author.elementsEqual(characterName)
            }
            
           return filteredQuotes
           
        }
}

extension UIImageView

{

    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit)

    {

        contentMode = mode

        URLSession.shared.dataTask(with: url) { data, response, error in

            guard

                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,

                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),

                let data = data, error == nil,

                let image = UIImage(data: data)

                else { return }

            DispatchQueue.main.async() { [weak self] in

                self?.image = image

            }

        }.resume()

    }

    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {

        guard let url = URL(string: link) else { return }

        downloaded(from: url, contentMode: mode)

    }

}
