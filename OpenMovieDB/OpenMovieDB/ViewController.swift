//
//  ViewController.swift
//  OpenMovieDB
//
//  Created by Oren Dinur on 03/04/2022.
//

import UIKit
import Alamofire
import SnapKit


class ViewController: UIViewController, UITextViewDelegate {

    var text : String?
    var url = "https://www.omdbapi.com/?s=Breaking&apikey=757bb97b"
    var film = [[String:Any]]()


    
    
    // MARK: Views
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CustomMovieTableViewCell.self, forCellReuseIdentifier: CustomMovieTableViewCell.identifier)
        return tableView
    }()
    
    
    private let textBox : UITextView = {
        let textBox = UITextView()
        textBox.translatesAutoresizingMaskIntoConstraints = false
        textBox.backgroundColor = .secondarySystemBackground
        textBox.textColor = .secondaryLabel
        textBox.font = UIFont.preferredFont(forTextStyle: .body)
        textBox.layer.cornerRadius = 20
        textBox.layer.shadowColor = UIColor.gray.cgColor;
        
        return textBox


    }()

    
    
    // MARK: Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        textBox.delegate = self
        
        subviews()
        constraints()
        fetchFilms()
    }
    
    
    func fetchFilms() {
        Alamofire.request(url).responseJSON{ (response) in
            if let json = response.result.value as! [String:Any]?{
                if let responseValue = json["Search"] as! [[String:Any]]?{
                    self.film = responseValue
                    self.tableView.reloadData()
                }
            }
        }
    }
}
    


extension ViewController {
    func subviews() {
        view.addSubview(tableView)
        view.addSubview(textBox)
    }
    
    func constraints() {
        
        textBox.snp.makeConstraints{ make in
            make.width.height.centerX.equalTo(80)
            
        }
        
        tableView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return film.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomMovieTableViewCell.identifier, for: indexPath)
        if let inputCell = cell as? CustomMovieTableViewCell {
            if film.count > 0 {
                let filmData = film[indexPath.row]
                let imageStringPoster = filmData["Poster"] as! String
                let year = filmData["Year"] as! String
                inputCell.configure(text: filmData["Title"] as! String, imageStringPoster: imageStringPoster, year: year)
                
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

//struct Film: Decodable {
//    let title: String
//    let year: String
//    let poster: String
//
//
//    enum CodingKeys: String, CodingKey {
//        case title = "Title"
//        case year = "Year"
//        case poster = "Poster"
//    }
//}
//
//
//struct Films: Decodable {
//  let count: Int
//  let all: [Film]
//
//  enum CodingKeys: String, CodingKey {
//    case count = "totalResults"
//    case all = "Search"
//  }
//}
//
