/**
 Copyright 2023 Pardn Ltd 帕登國際有限公司.
 Created by Pardn Chiu 邱敬幃.
 Email: chiuchingwei@icloud.com
 */

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
			.border(color: .black, width: 2);
	};

	required init?(coder aDecoder: NSCoder) { super.init(coder:aDecoder) };
};
