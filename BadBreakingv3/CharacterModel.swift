import UIKit


struct Character: Decodable, Identifiable
{
    
    let name: String
    let nickname: String
    let id: Int
    let dob: String
    let img : String
    let appearance :[Int]
    let status : String
    let occupation: [String]
    let portrayed : String
    
    
    enum CodingKeys: String, CodingKey {
        case name, nickname
        case id = "char_id"
        case dob = "birthday"
        case img
        case status
        case occupation
        case appearance
        case portrayed
    
    }
}
struct Quote: Decodable, Identifiable
{
    
    let quote: String
    let author: String
    let id: Int    
    
    enum CodingKeys: String, CodingKey {
        case quote, author
        case id = "quote_id"
        
    
    }
}

