//
//  CategoriesController.swift
//  AlwayGo
//
//  Created by Mac on 09.03.25.
//

import UIKit

class CategoriesController: BaseController {
    private lazy var searchController: UISearchController = {
        let search = UISearchController()
        search.searchBar.delegate = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchResultsUpdater = self
        search.searchBar.isHidden = true
        return search
    }()
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 4
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    private lazy var loadingView: UIActivityIndicatorView = {
        let loadingView = UIActivityIndicatorView(style: .medium)
        loadingView.tintColor = .blue
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        return loadingView
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Tap Me", for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let viewModel = CategoriesViewModel()
    private var collectionTopAnchor: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "CATEGORIES"
    }

    override func configureUI() {
        loadingView.startAnimating()
        view.backgroundColor = .white
        collection.backgroundColor = .white
        navigationController?.navigationBar.titleTextAttributes = [.font: UIFont.customFont(.sfProSemibold, size: 16),
                                                                   .foregroundColor: UIColor.black]
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "LeftMagnifier"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(magnifierButtonTapped))
        view.addSubViews(collection, loadingView)
        collection.delegate = self
        collection.dataSource = self
        collection.register(CategoryControllerCell.self, forCellWithReuseIdentifier: "\(CategoryControllerCell.self)")
        collectionTopAnchor = collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        collectionTopAnchor?.isActive = false
    }
    
    override func configureConstraints() {
        NSLayoutConstraint.activate([
            collection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        collectionTopAnchor = collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        collectionTopAnchor?.isActive = true
    }
    
    override func configureviewModel() {
        viewModel.getCategoriesData()
        viewModel.sendState = { [weak self] state in
            guard let self else { return }
            switch state {
            case .error(let message):
                print(message)
            case .success:
                collection.reloadData()
            case .loading:
                loadingView.startAnimating()
            case .loaded:
                loadingView.stopAnimating()
            case .idle:
                break
            }
        }
    }
    
    @objc func magnifierButtonTapped(_ sender: UIButton) {
        collectionTopAnchor?.isActive = false
        collectionTopAnchor = collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60)
        if !sender.isSelected {
            navigationItem.rightBarButtonItem?.tintColor = .clear
            UIView.animate(withDuration: 0.5) { [weak self] in
                guard let self else { return }
                view.addSubview(button)
                collectionTopAnchor?.isActive = true
                button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
                button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
                button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
                view.layoutIfNeeded()
            }
        } else {
            collectionTopAnchor = collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
            UIView.animate(withDuration: 0.5) { [weak self] in
                guard let self else { return }
                button.removeFromSuperview()
                collectionTopAnchor?.isActive = true
                view.layoutIfNeeded()
            }
        }
        sender.isSelected = !sender.isSelected
    }
}

extension CategoriesController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.categoryModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CategoryControllerCell.self)", for: indexPath) as! CategoryControllerCell
        cell.configureCell(with: viewModel.categoryModel[indexPath.row],
                           and: viewModel.cellImages[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let model = viewModel.categoryModel[indexPath.row].children else { return }
        let coordinator = CategoryFlowCoordinator(navigationController: navigationController ?? UINavigationController(),
                                                  title: viewModel.categoryModel[indexPath.row].name)
        coordinator.categoryModel = model
        coordinator.start()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 120)
    }
}

extension CategoriesController: UISearchBarDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}
