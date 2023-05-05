//
//  addCollectionViiewCell.swift
//  Maoneybook
//
//  Created by Pardn on 2023/5/4.
//

import Foundation
import UIKit

class addCollectionViewCell: UICollectionViewCell {

	var button: UIButton!

	override init(frame: CGRect) {
		super.init(frame: CGRect(0, 0, 0, 0));

		button = UIButton(0, 0, (vw - 50) / 4, (vw - 50) / 4);

		_ = contentView.child([
			button
		]);
	};

//	override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
//		let att = super.preferredLayoutAttributesFitting(layoutAttributes);
////		view.setNeedsLayout();
////		view.layoutIfNeeded();
//		//		print(self.view.size.height)
////		att.frame.size.width = vw - 40;
//		//		att.frame = CGRect(x: 0, y: 0, width: vw, height: self.view.size.height)
//		return att;
//	}


	required init?(coder aDecoder: NSCoder) { super.init(coder:aDecoder) };
};

