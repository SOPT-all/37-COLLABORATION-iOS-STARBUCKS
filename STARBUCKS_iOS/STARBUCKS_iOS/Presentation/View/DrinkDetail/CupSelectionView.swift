//
//  CupSelectionView.swift
//  STARBUCKS_iOS
//
//  Created by 진소은 on 11/20/25.
//

import UIKit

import SnapKit
import Then

final class CupSelectionView: BaseView {
    
    // MARK: - Properties
    
    enum CupSize {
        case tall
        case grande
        case venti
    }
    
    private var selectedSize: CupSize? {
        didSet { updateSelectionUI() }
    }
    
    weak var delegate: CupSelectionViewDelegate?
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    private let sizeStackView = UIStackView()
    
    private let tallSizeImage = UIImageView()
    private let grandeSizeImage = UIImageView()
    private let ventiSizeImage = UIImageView()
    
    // MARK: - Set UI
    
    override func setUI() {
        titleLabel.do {
            $0.text = "컵 선택"
            $0.font = .pretendard(.body_b_16)
            $0.textColor = .black
        }
        
        sizeStackView.do {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.distribution = .fillEqually
        }
        
        tallSizeImage.do {
            $0.image = UIImage(resource: .imageTall)
            $0.contentMode = .scaleAspectFit
            $0.isUserInteractionEnabled = true
            $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tallTapped)))
        }
        
        grandeSizeImage.do {
            $0.image = UIImage(resource: .imageGrande)
            $0.contentMode = .scaleAspectFit
            $0.isUserInteractionEnabled = true
            $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(grandeTapped)))
        }
        
        ventiSizeImage.do {
            $0.image = UIImage(resource: .imageVenti)
            $0.contentMode = .scaleAspectFit
            $0.isUserInteractionEnabled = true
            $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ventiTapped)))
        }
    }
    
    // MARK: - Set Layout
    
    override func setLayout() {
        addSubviews(titleLabel, sizeStackView)
        sizeStackView.addArrangedSubviews(tallSizeImage, grandeSizeImage, ventiSizeImage)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(16)
        }
        
        sizeStackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview().inset(23)
            $0.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Actions
    
    @objc private func tallTapped() {
        selectedSize = .tall
        delegate?.cupSelectionView(self, didSelect: .tall)
    }
    
    @objc private func grandeTapped() {
        selectedSize = .grande
        delegate?.cupSelectionView(self, didSelect: .grande)
    }
    
    @objc private func ventiTapped() {
        selectedSize = .venti
        delegate?.cupSelectionView(self, didSelect: .venti)
    }
    
    // MARK: - UI Update
    
    private func updateSelectionUI() {
        switch selectedSize {
        case .tall:
            tallSizeImage.image = UIImage(resource: .imageTallSelect)
            grandeSizeImage.image = UIImage(resource: .imageGrande)
            ventiSizeImage.image = UIImage(resource: .imageVenti)
            
        case .grande:
            tallSizeImage.image = UIImage(resource: .imageTall)
            grandeSizeImage.image = UIImage(resource: .imageGrandeSelect)
            ventiSizeImage.image = UIImage(resource: .imageVenti)
            
        case .venti:
            tallSizeImage.image = UIImage(resource: .imageTall)
            grandeSizeImage.image = UIImage(resource: .imageGrande)
            ventiSizeImage.image = UIImage(resource: .imageVentiSelect)
            
        case .none:
            tallSizeImage.image = UIImage(resource: .imageTall)
            grandeSizeImage.image = UIImage(resource: .imageGrande)
            ventiSizeImage.image = UIImage(resource: .imageVenti)
        }
    }
    
    func setInitialSize(_ size: CupSize) { selectedSize = size }
}

// MARK: - Delegate

protocol CupSelectionViewDelegate: AnyObject {
    func cupSelectionView(_ view: CupSelectionView, didSelect size: CupSelectionView.CupSize)
}

