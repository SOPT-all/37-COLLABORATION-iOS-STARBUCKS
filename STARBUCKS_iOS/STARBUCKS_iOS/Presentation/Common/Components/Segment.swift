//
//  Segment.swift
//  STARBUCKS_iOS
//
//  Created by 안치욱 on 11/20/25.
//

import UIKit

import SnapKit
import Then

final class Segment: UIControl {
    
    // MARK: - Properties
    
    private var isHotSelected = false {
        didSet { updateUI(animated: true) }
    }
    
    private var sliderLeadingConstraint: Constraint?
    
    // MARK: - UI Components
    
    private let backgroundView = UIView()
    private let sliderView = UIView()
    private let hotLabel = UILabel()
    private let icedLabel = UILabel()

    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        setUI()
        setHierarchy()
        setLayout()
        setupGesture()
        updateUI(animated: false)
    }

    required init?(coder: NSCoder) { fatalError() }
    
    // MARK: - Setting Method

    private func setUI() {
        backgroundView.do {
            $0.backgroundColor = .starbucksGray100
            $0.layer.cornerRadius = 18
        }
        
        sliderView.do {
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 18
            $0.layer.shadowOpacity = 0.1
            $0.layer.shadowRadius = 2
            $0.layer.shadowOffset = CGSize(width: 0, height: 0)
        }
        
        hotLabel.do {
            $0.text = "HOT"
            $0.font = .pretendard(.head_sb_14)
            $0.textAlignment = .center
            $0.textColor = .starbucksGray500
        }
        
        icedLabel.do {
            $0.text = "ICED"
            $0.font = .pretendard(.head_sb_14)
            $0.textAlignment = .center
            $0.textColor = .starbucksGray500
        }
    }
    
    private func setHierarchy() {
        self.addSubviews(backgroundView)
        
        backgroundView.addSubviews(
            sliderView,
            hotLabel,
            icedLabel
        )
    }
    
    private func setLayout() {
        
        self.snp.makeConstraints {
            $0.height.equalTo(36)
            $0.width.equalTo(341)
        }
        
        backgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        sliderView.snp.makeConstraints {
            $0.width.equalTo(166)
            $0.height.equalTo(36)
            $0.centerY.equalToSuperview()
            
            self.sliderLeadingConstraint = $0.leading.equalToSuperview().constraint
        }
        
        hotLabel.snp.makeConstraints {
            $0.left.top.bottom.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.5)
        }
        
        icedLabel.snp.makeConstraints {
            $0.right.top.bottom.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.5)
        }
    }

    // MARK: - Gesture
    
    private func setupGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        addGestureRecognizer(tap)
    }

    @objc
    private func handleTap(_ gesture: UITapGestureRecognizer) {
        let location = gesture.location(in: self)
        isHotSelected = location.x < bounds.width / 2
        sendActions(for: .valueChanged)
    }

    // MARK: - UI Update
    
    private func updateUI(animated: Bool) {
        let targetX: CGFloat = isHotSelected ? 0 : (341 - 166)
        
        sliderLeadingConstraint?.update(offset: targetX)
        
        let animation = { [self] in
            layoutIfNeeded()
            hotLabel.textColor = isHotSelected ? .red0160 : .starbucksGray500
            icedLabel.textColor = isHotSelected ? .starbucksGray500 : .blue02
        }

        if animated {
            UIView.animate(withDuration: 0.25, animations: animation)
        } else {
            animation()
        }
    }

    func setSelected(isHot: Bool) {
        self.isHotSelected = isHot
    }
}
