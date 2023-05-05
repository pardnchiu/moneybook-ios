/**
 Copyright 2023 Pardn Ltd 帕登國際有限公司.
 Created by Pardn Chiu 邱敬幃.
 Email: chiuchingwei@icloud.com
 */

import Foundation
import UIKit

class addCollectionViewCell: UICollectionViewCell {

	var button: UIButton!

	override init(frame: CGRect) {
		super.init(frame: CGRect(0, 0, 0, 0));

		button = UIButton(0, 0, (vw - 50) / 4, (vw - 50) / 4);

		_=contentView.child([
			button
		]);
	};

	required init?(coder aDecoder: NSCoder) { super.init(coder:aDecoder) };
};

