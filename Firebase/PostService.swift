//
//  PostServiceUsers.swift
//  BMI Calculator
//
//  Created by Aurela Bala on 2022-12-13.
/* Created and Developed by
Aurela Bala - 301279255
Date Created: 05/12/2022
BMI Calculator App. This version includes methods such as adding user personal information, adding new data for a new weight, BMI tracking, editing and deleting data.
 
 Through PostService we can fetch all the BMI values and user info that are stored in the Firebase and display them on the TableView cell and Personal Information screen.
Version 1.0.0.
*/


import Foundation
import Firebase

//user struct
struct Jackpot
{
    var amount: Double
    //init method
    init(keyID: String, dictionary: [String: Any])
    {
        self.amount = dictionary["amount"] as? Double ?? 0
        
    }
}



struct PostService
{
    //create a shared property
    static let shared = PostService()
    let DB_REFERENCE = Database.database().reference()
    
    //fetch all users
    func fetchAllJackpots(completion: @escaping([Jackpot]) -> Void)
    {
        var allJackpots = [Jackpot]()
        DB_REFERENCE.child("jackpot").observe(.childAdded)
        {
            (snapshot) in
            fetchOneJackpot(id: snapshot.key) { jackpot in
                allJackpots.append(jackpot)
                completion(allJackpots)

            }
        }
    }
    
   

    
    //create the user object for each user in firebase
    func fetchOneJackpot(id: String, completion: @escaping(Jackpot) -> Void )
    {
        DB_REFERENCE.child("jackpot").child(id).observeSingleEvent(of: .value)
        {
            (snapshot) in
            guard let dictionary = snapshot.value as? [String: Any] else
            { return }
            let jackpot = Jackpot(keyID: id, dictionary: dictionary)
            completion(jackpot)
        }
    }
    

    
    //insert user data into the firebase database
    func insertJackpotData(amount: Double,  completion: @escaping(Error?, DatabaseReference) -> Void)
    {
        //create the array
        let data =
        [
            "amount": amount
        ] as [String: Any]
        let jackpotID = DB_REFERENCE.child("jackpot").childByAutoId()
        jackpotID.updateChildValues(data, withCompletionBlock: completion)
        jackpotID.updateChildValues(data) {(error, reference)
            in
            let id = ["jackpotID": jackpotID.key!]
            //upload the new task
            DB_REFERENCE.child("jackpot").child(jackpotID.key!).updateChildValues(id, withCompletionBlock: completion)
            
        }
    }
    
    
    //update task details method
     func updateAllDetails(jackpotID: String, amount: Double, completion: @escaping(Error?, DatabaseReference) -> Void)
     {
         let data = [
          "amount": amount
         ] as [String : Any]
         DB_REFERENCE.child("jackpot").child(jackpotID).updateChildValues(data, withCompletionBlock: completion)
     }
    
    //delete a bmi method
//    func deleteBmi(bmiID: String, completion: @escaping(Error?, DatabaseReference) -> Void)
//     {
//         DB_REFERENCE.child("bmi").child(bmiID).removeValue()
//
//     }
}

