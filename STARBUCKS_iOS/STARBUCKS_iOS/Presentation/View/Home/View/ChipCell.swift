//
//  ChipCell.swift
//  STARBUCKS_iOS
//
//  Created by JIN on 11/21/25.
//

import UIKit

import SnapKit
import Then

final class ChipCell: UICollectionViewCell {

    // MARK: - UI Components

    private var chipView: Chip?

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Configure

    func configure(with chipType: ChipType) {
        chipView?.removeFromSuperview()

        let chip = Chip(type: chipType)
        contentView.addSubview(chip)

        chip.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        chipView = chip
    }
}
