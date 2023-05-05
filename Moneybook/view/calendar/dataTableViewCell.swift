/**
 Copyright 2023 Pardn Ltd 帕登國際有限公司.
 Created by Pardn Chiu 邱敬幃.
 Email: chiuchingwei@icloud.com
 */

import Foundation
import UIKit

class dataTableViewCell: UITableViewCell {

	public var dateLabel	: UILabel!
	public var titleLabel	: UILabel!
	public var priceLabel	: UILabel!

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier);

		dateLabel = UILabel()
			.text("17:20", color: .black, align: .left, row: 0, wrap: .byTruncatingTail)
			.font(weight: .regular, size: 13);

		titleLabel = UILabel()
			.text("", color: .black, align: .left, row: 0, wrap: .byTruncatingTail)
			.font(weight: .regular, size: 19);

		priceLabel = UILabel()
			.text("", color: UIColor(hex: "F97473"), align: .right, row: 0, wrap: .byTruncatingTail)
			.font(weight: .bold, size: 19);

		// 背景透明
		_=self.bg(color: .clear);

		// 添加子元件
		_=self.contentView
			.child([
				UIStackView(axis: .horz, align: .left, gap: 15)
					.padding(L: 15)
					.padding(R: 15)
					.frame(0, 0, vw, 50)
					.child([
						dateLabel
							.Heq(50),
						titleLabel
							.Heq(50),
						UIView()/* 填空 */,
						priceLabel
							.Heq(50)
					])
			]);
	};

	required init?(coder aDecoder: NSCoder) { super.init(coder:aDecoder) };
};
