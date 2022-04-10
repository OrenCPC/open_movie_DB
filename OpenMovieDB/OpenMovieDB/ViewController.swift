//
//  ViewController.swift
//  OpenMovieDB
//
//  Created by Oren Dinur on 03/04/2022.
//

import UIKit
import SnapKit


class ViewController: UIViewController {
    
    private lazy var searchModel = Search()
    var selectedMovieImdbID: String?

    
    // MARK: Views
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CustomMovieTableViewCell.self, forCellReuseIdentifier: CustomMovieTableViewCell.identifier)
        return tableView
    }()
    
    
    private let textBox : UITextView = {
        let textBox = UITextView()
        textBox.font = UIFont.preferredFont(forTextStyle: .body)
        textBox.layer.cornerRadius = 20
        textBox.text = "Search for movies"
        textBox.textColor = UIColor.lightGray
        return textBox
    }()

    
    
    // MARK: Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.0)
                
        delegates()
        subviews()
        constraints()
        startSearch(text: getRandomMovie())
    }
    
    
    func startSearch(text: String) {
        searchModel.searchFilms(text: text) {films in
            self.tableView.reloadData()
        }
    }
}
    


extension ViewController {
    func subviews() {
        view.addSubview(tableView)
        view.addSubview(textBox)
    }
    
    func delegates() {
        tableView.delegate = self
        tableView.dataSource = self
        textBox.delegate = self
    }
    
    func constraints() {
        textBox.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(100)
            make.height.equalTo(view.frame.size.height / 20)
        }
        
        tableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(textBox.snp.bottom).offset(30)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchModel.films.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomMovieTableViewCell.identifier, for: indexPath)
        if let inputCell = cell as? CustomMovieTableViewCell {
            if searchModel.films.count > 0 {
                let filmData = searchModel.films[indexPath.row]
                let imageStringPoster = filmData["Poster"] as! String
                let year = filmData["Year"] as! String
                let filmTitle = filmData["Title"] as! String
                let imdbID = filmData["imdbID"] as! String
                inputCell.configure(text: filmTitle, imageStringPoster: imageStringPoster, year: year, imdbID: imdbID)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? CustomMovieTableViewCell {
            guard let selectedMovieImdbID = cell.imdbID, !selectedMovieImdbID.isEmpty else {
                return
            }
            let newViewController = DeatilViewController()
            newViewController.imdbID = selectedMovieImdbID
            self.navigationController?.pushViewController(newViewController, animated: true)
         }
    }
}

extension ViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.count > 2 {
            startSearch(text: textView.text)
        } else {
            searchModel.clearFilms()
            tableView.reloadData()
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textBox.textColor == UIColor.lightGray {
            textBox.text = ""
            textBox.textColor = UIColor.black
        }
    }
}
