//
//  ViewController.swift
//  Muncher
//
//  Created by Davy Chuon on 7/6/23.
//
// swiftlint:disable all

import UIKit

class ViewController: UIViewController {
//    var restaurants: [Business] = []
    var yelpQuery: YelpResponse?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
//        fetchBusinesses(keyWord: "asian", location: "San+Diego")
        fetchSpecificBusiness()
    }
    
    func fetchSpecificBusiness() {
        print("FORMOOSA1")
        Task {
            do {
                let businessQuery = try await NetworkManager.shared.getBusiness(businessID: "OyB0Kn1JBRBNgWVGS8CwTA")
                print(businessQuery)
            } catch {
                print("ERRORERROR")
            }
        }
        print("FORMOOSA9")
    }
    
    func fetchBusinesses(keyWord: String, location: String) {
        Task {
            do {
                let yelpQuery = try await NetworkManager.shared.getBusinesses(keyWord: keyWord, location: location)
                print(yelpQuery)
                print("2==================")
            } catch {
                print(error)
            }
            print("3==================")
        }
        print("1==================")
    }

}
