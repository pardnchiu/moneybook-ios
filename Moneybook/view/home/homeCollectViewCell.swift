//
//  homeCollectViewCell.swift
//  Maoneybook
//
//  Created by Pardn on 2023/5/4.
//

import Foundation
import UIKit

class homeCollectViewCell: UICollectionViewCell {

	let view = UIStackView(axis: .vert, align: .left, fill: .eqSpace);
	let headerView = UIStackView(axis: .horz, align: .fill, fill: .eqSpace);
	let headerLabel = UILabel();
	let totalLabel = UILabel();

	override init(frame: CGRect) {
		super.init(frame: CGRect(0, 0, 0, 0));

		_=contentView
			.child([
				view
					.child([
						headerView
							.padding(R: 15)
							.padding(L: 15)
							.child([
								headerLabel
									.attr(txt: "2023/04/18 星期二")
									.attr(align: .left)
									.attr(charSpacing: 1)
									.attr(minH: 40)
									.attr(offset: 10),
								totalLabel
									.attr(txt: "-1234")
									.attr(align: .right)
									.attr(charSpacing: 1)
									.attr(minH: 40)
									.attr(offset: 10)
									.attr(size: 17, weight: .bold)
									.attr(clr: .red)
							])
							.Weq(vw - 40)
							.radius(10, corner: [.topLeft, .topRight])
							.border(color: .black, width: 2)
					])
					.border(color: .black, width: 2)
					.radius(10)
			])

		_=view
			.Teq(T: contentView)
			.Leq(L: contentView)
			.Beq(B: contentView)
			.Req(R: contentView)
	};

	override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
		let att = super.preferredLayoutAttributesFitting(layoutAttributes);
		view.setNeedsLayout();
		view.layoutIfNeeded();
		//		print(self.view.size.height)
		att.frame.size.width = vw - 40;
		//		att.frame = CGRect(x: 0, y: 0, width: vw, height: self.view.size.height)
		return att;
	}


	required init?(coder aDecoder: NSCoder) { super.init(coder:aDecoder) };
};
