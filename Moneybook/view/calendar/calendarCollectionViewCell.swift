//
//  addCollectionViiewCell.swift
//  Maoneybook
//
//  Created by Pardn on 2023/5/4.
//

import Foundation
import UIKit

class calendarCollectionViewCell: UICollectionViewCell {

	var button: UIButton!

	override init(frame: CGRect) {
		super.init(frame: CGRect(0, 0, 0, 0));

		let widrh: CGFloat = CGFloat(Int((vw - 20) / 7))

		button = UIButton(0, 0, widrh, 35)
			.text("", color: .black, align: .center)
			.font(weight: .regular, size: 15);

		_ = contentView.child([
			button
		]);
	};

	required init?(coder aDecoder: NSCoder) { super.init(coder:aDecoder) };
};

