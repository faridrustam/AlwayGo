//
//  OrderCell.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 02.07.25.
//

import UIKit

class OrderCell: UITableViewCell {
    
    private lazy var orderLabel: UILabel = {
        let label = UILabel()
        label.text = "Order date"
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var orderValueLabel: UILabel = {
        let label = UILabel()
        label.text = "12.07.2025"
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.text = "Amount"
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var amountValueLabel: UILabel = {
        let label = UILabel()
        label.text = "1500$"
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .systemBackground
        collection.register(ClothesCell.self, forCellWithReuseIdentifier: "\(ClothesCell.self)")
        collection.delegate = self
        collection.dataSource = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    var orderList: OrderList?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureConsraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConsraints() {
        contentView.addSubViews(orderLabel, orderValueLabel, amountLabel, amountValueLabel, collection)
        NSLayoutConstraint.activate([
            orderLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            orderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            orderValueLabel.centerXAnchor.constraint(equalTo: orderLabel.centerXAnchor),
            orderValueLabel.topAnchor.constraint(equalTo: orderLabel.bottomAnchor, constant: 8),
            
            amountLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            amountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            amountValueLabel.centerXAnchor.constraint(equalTo: amountLabel.centerXAnchor),
            amountValueLabel.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 8),
            
            collection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            collection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            collection.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            collection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collection.heightAnchor.constraint(equalToConstant: 300),
            collection.widthAnchor.constraint(equalToConstant: 393)
            ])
    }
    
    func configureCell(amount: Int, orderDate: String, product: OrderList) {
        orderList = product
        amountValueLabel.text = "\(amount)$"
        orderValueLabel.text = String(orderDate.prefix(10))
    }
}

extension OrderCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        orderList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ClothesCell.self)", for: indexPath) as! ClothesCell
        if let listOrder = orderList?.product, let urlString = orderList?.variant {
            print("producT:\(listOrder)")
            print("URL:\(urlString)")
            cell.configureProductCell2(product: listOrder, url: urlString)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 163, height: 284)
    }
    
}
