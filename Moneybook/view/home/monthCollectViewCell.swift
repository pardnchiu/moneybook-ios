//
//  homeCollectViewCell.swift
//  Maoneybook
//
//  Created by Pardn on 2023/5/4.
//

import Foundation
import UIKit

class monthCollectViewCell: UICollectionViewCell {

	public var button = UIButton();

	override init(frame: CGRect) {
		super.init(frame: CGRect(0, 0, 0, 0));

		_=contentView
			.child([
				button
					.font(weight: .bold, size: 17)
					.frame(0, 0, (vw - 30 - 30) / 4, 40)
			])
			.radius(10)
			.clip(view: true)
			.border(color: .black, width: 2)
	};

//	override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
//		let att = super.preferredLayoutAttributesFitting(layoutAttributes);
////		att.frame = CGRect(x: 0, y: 0, width: (vw - 50) / 4, height: 40)
//		return att;
//	}

	required init?(coder aDecoder: NSCoder) { super.init(coder:aDecoder) };
};
