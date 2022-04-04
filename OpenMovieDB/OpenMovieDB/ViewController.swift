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
    var films = [[String:Any]]()

    
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
        return textBox
    }()

    
    
    // MARK: Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        textBox.delegate = self
        textBox.text = "Search for movies"
        textBox.textColor = UIColor.lightGray
        
        subviews()
        constraints()
        
        startSearch(text: "Breaking Bad")

        
    }
    
    
    func startSearch(text: String) {
        searchModel.searchFilms(text: text) {films in
            self.films = films
            self.tableView.reloadData()
        }
    }
}
    


extension ViewController {
    func subviews() {
        view.addSubview(tableView)
        view.addSubview(textBox)
    }
    
    func constraints() {
        let sizeThatFits = textBox.sizeThatFits(CGSize(width: view.frame.width, height: CGFloat(MAXFLOAT)))

        textBox.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(50)
            make.height.equalTo(sizeThatFits)
        }
        
        tableView.snp.makeConstraints{ make in
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
        return films.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomMovieTableViewCell.identifier, for: indexPath)
        if let inputCell = cell as? CustomMovieTableViewCell {
            if films.count > 0 {
                let filmData = films[indexPath.row]
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

extension ViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        startSearch(text: textView.text)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textBox.textColor == UIColor.lightGray {
            textBox.text = ""
            textBox.textColor = UIColor.black
        }
    }
}
