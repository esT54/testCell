//
//  MyCell.swift
//  testCell
//
//  Created by Semen Smirnyagin on 08.03.2022.
//

import UIKit

class MyCell: UITableViewCell {
  let myImageView: UIImageView = {
    let result = UIImageView()
    result.translatesAutoresizingMaskIntoConstraints = false
    result.image = UIImage(systemName: "cloud")
    return result
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    self.addSubview(myImageView)
    NSLayoutConstraint.activate([
      myImageView.topAnchor.constraint(equalTo: self.topAnchor),
      myImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      myImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      myImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
