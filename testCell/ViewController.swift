//
//  ViewController.swift
//  testCell
//
//  Created by Semen Smirnyagin on 08.03.2022.
//

import UIKit

class ViewController: UIViewController {
  
  let tableView: UITableView = {
    let result = UITableView()
    result.translatesAutoresizingMaskIntoConstraints = false
    return result
  }()
  
  var currentImage: UIImage?

  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(tableView)
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
    ])
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(MyCell.self, forCellReuseIdentifier: "cell")
    tableView.reloadData()
  }
}

//MARK: UITableViewDelegate

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let cell = tableView.cellForRow(at: indexPath)
    print("Перед изменением данные: \(currentImage.debugDescription)")
    if let cell = cell as? MyCell {
      cell.myImageView.image = UIImage(systemName: "sun.max")
      currentImage = cell.myImageView.image
    }
    print("После изменением данные: \(currentImage.debugDescription)")
  }
  
  func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    let cell = tableView.cellForRow(at: indexPath)
    if let cell = cell as? MyCell {
      cell.myImageView.image = UIImage(systemName: "moon")
    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    100
  }
}

//MARK: UITableViewDataSource

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    3
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
  }
  
  
}

