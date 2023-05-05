/**
 Copyright 2023 Pardn Ltd 帕登國際有限公司.
 Created by Pardn Chiu 邱敬幃.
 Email: chiuchingwei@icloud.com
 */

import Foundation
import UIKit

class monthCollectViewHeader: UICollectionReusableView {

	let leftButton 	= UIButton(0, 0, 30, 60);
	let titleLabel 	= UILabel(30, 0, vw - 20 - 60, 60);
	let rightButton = UIButton(vw - 50, 0, 30, 60);

	@objc func tapPreYear() {
		let year = Int(titleLabel.text?.replace("年", "") ?? "0") ?? 0;
		titleLabel.text = "\(year - 1)年";
	};

	@objc func tapNextYear() {
		let year = Int(titleLabel.text?.replace("年", "") ?? "0") ?? 0;
		titleLabel.text = "\(year + 1)年";
	};

	override init(frame: CGRect) {
		super.init(frame: CGRect(0, 0, 0, 0));

		_=self
			.child([
				leftButton
					.text(color: .black, align: .left)
					.img(UIImage(sys: "arrowtriangle.backward.fill"))
					.touch(down: self, #selector(tapPreYear)),
				titleLabel
					.text("2023年", color: .black, align: .center, row: 1, wrap: .byClipping)
					.font(weight: .bold, size: 21),
				rightButton
					.text(color: .black, align: .right)
					.img(UIImage(sys: "arrowtriangle.forward.fill"))
					.touch(down: self, #selector(tapNextYear))
			]);
	};
	
	required init?(coder aDecoder: NSCoder) { super.init(coder:aDecoder) };
};
