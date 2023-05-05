/**
 Copyright 2023 Pardn Ltd 帕登國際有限公司.
 Created by Pardn Chiu 邱敬幃.
 Email: chiuchingwei@icloud.com
 */

import Foundation
import UIKit

extension UIVisualEffectView {

	@objc convenience public init(style: UIBlurEffect.Style) { self.init(effect: UIBlurEffect(style: style)); };

	public override func frame(_ x: CGFloat,_ y: CGFloat,_ width: CGFloat,_ height: CGFloat) -> UIVisualEffectView { self.frame = CGRect(x, y, width, height); return self; };

	public override func child(_ views: [UIView]) -> UIVisualEffectView {
		views.forEach { e in
			self.contentView.addSubview(e);
		};
		return self;
	};
}
