//
//  homeDayRow.swift
//  Maoneybook
//
//  Created by Pardn on 2023/5/3.
//

import Foundation
import UIKit

class homeDayRowView: UIStackView {

	let titleLabel = UILabel();
	let priceLabel = UILabel();

	convenience init(title: String, price: String, isFirst: Bool) {
		self.init(axis: .horz, align: .left, fill: .eqSpace);
		_=self
			.padding(R: 15)
			.padding(L: 15)
			.child([
				titleLabel
					.attr(txt: title)
					.attr(minH: 40)
					.attr(offset: 10),
				priceLabel
					.attr(txt: price)
					.attr(minH: 40)
					.attr(offset: 10)
					.attr(size: 17, weight: .bold)
			])
			.layer(
				{
					if (isFirst) { return ""; };
					let border = CALayer();
					border.backgroundColor = UIColor.lightGray.cgColor;
					border.frame = CGRect(x: 15, y: 0, width: vw - 40 - 30, height: 1.5);
					self.layer.addSublayer(border);
					return border;
				}()
			)
			.Weq(vw - 40);
	}

};
