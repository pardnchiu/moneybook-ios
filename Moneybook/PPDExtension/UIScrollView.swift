/**
 Copyright 2023 Pardn Ltd 帕登國際有限公司.
 Created by Pardn Chiu 邱敬幃.
 Email: chiuchingwei@icloud.com
 */

import Foundation
import UIKit

extension UIScrollView {
	public func scrollToTop() {
		let offset = CGPoint(x: 0, y: safeTop())
		setContentOffset(offset, animated: false)
	};
};

