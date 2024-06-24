//
//  HomeViewController.swift
//  NETFLIX
//
//  Created by NERO on 6/4/24.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    let homeView = UIView()
    let userNameLabel = {
        let label = UILabel()
        label.text = "시네필 님"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        return label
    }()
    
    let homeMovieImageView = {
        let imageView = UIImageView()
        imageView.image = .init(named: "겨울왕국")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        return imageView
    }()
    let movieBackgroundImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    let movieKeywordLabel = {
        let label = UILabel()
        label.text = "애니메이션 · 모험 · 뮤지컬 · 가족 · 판타지"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    let playMovieButton = PointButton(title: "재생", image: UIImage(systemName: "play.fill")!, foreColor: .black, backColor: .white)
    let wishMovieListButton = PointButton(title: "내가 찜한 리스트", image: UIImage(systemName: "plus")!, foreColor: .white, backColor: .deepDarkGray)
    let buttonStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let todayContentsLabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    let firstTrendMovieImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 4
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    let secondTrendMovieImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 4
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    let thirdTrendMovieImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 4
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        configureHierarchy()
        configureLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        settingNavigation()
    }
}

//MARK: - Configure
extension HomeViewController {
    func configureHierarchy() {
        [playMovieButton, wishMovieListButton].forEach {
            buttonStackView.addArrangedSubview($0)
        }
        
        [homeView, userNameLabel, homeMovieImageView, movieBackgroundImageView, movieKeywordLabel, buttonStackView, todayContentsLabel, firstTrendMovieImageView, secondTrendMovieImageView, thirdTrendMovieImageView].forEach {
            view.addSubview($0)
        }
    }
    
    func configureLayout() {
        buttonStackView.snp.makeConstraints {
            $0.center.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.height.equalTo(40)
        }
    }
}

//MARK: - Switching View
extension HomeViewController {
    func settingNavigation() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = .white
        
        let signUpButton = UIBarButtonItem(title: "로그인", style: .plain, target: self, action: #selector(signUpButtonClicked))
        navigationItem.rightBarButtonItem = signUpButton
    }
    
    @objc func signUpButtonClicked() {
        navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
}
