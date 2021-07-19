//
//  CharacterDetailsViewController.swift
//  BadBreakingv3
//
//  Created by IACD-Air-8 on 2021/07/12.
//

import UIKit

class CharacterDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    @IBOutlet weak var charName: UILabel!
    
    @IBOutlet weak var quoteTableView: UITableView!
    @IBOutlet weak var charNickname: UILabel!
    @IBOutlet weak var charDob: UILabel!
    @IBOutlet weak var charImage: UIImageView!
  
    @IBOutlet weak var charStatus: UILabel!
    @IBOutlet weak var charPortrayed: UILabel!
    var characterQuotes = [Quote]()
 
    @IBOutlet weak var charOccupation: UILabel!
    var character: Character?
   override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterQuotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //quoteCustomCell
        let cell = quoteTableView.dequeueReusableCell(withIdentifier: "quoteCustomCell") as! quotesTableViewCell
        cell.quoteLbl.text = characterQuotes[indexPath.row].quote
        
      /*  let selectedIndex = indexPath.row
                
        if selectedIndex % 2 == 0
                {
                    cell.quoteView.tintColor = UIColor.white
                }
                else
                {
                    cell.quoteView.tintColor = UIColor.gray
                }
        */
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        print(characterQuotes)
        
        self.quoteTableView.reloadData()
        quoteTableView.delegate = self
        quoteTableView.dataSource = self
        
         let characterNickname: String = (character?.nickname)!
         charNickname.text = "A.K.A ' \(characterNickname.uppercased())'"
         
        charName.text = character?.name.uppercased()
       // charNickname.text = character?.nickname.uppercased()
      //"Name is "\(character)
       // charAppear.arr = character?.appearance[1]
        let CharacterOccupation: [String] = (character?.occupation)!
        charOccupation.text = "OCCUPATION: \(CharacterOccupation.joined(separator: ","))\n"
        
        let characterPortrayed: String = (character?.portrayed)!
         charPortrayed.text = "PORTRAYED AS: ' \(characterPortrayed)'"
         
       // charPortrayed.text = character?.portrayed
        
         let characterDob: String = (character?.dob)!
         charDob.text = "BORN : \(characterDob)"
         
      
       // charDob.text = character?.dob
        charImage.downloaded(from: (character?.img)!)
        let status = character?.status
        charStatus.text = character?.status
        if status == "Alive"
                {
                    charStatus.textColor = UIColor.green
           
                }
                else
                {
                    charStatus.textColor = UIColor.red
                }

       
    }
}
