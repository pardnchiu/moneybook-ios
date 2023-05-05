/**
 Copyright 2023 Pardn Ltd 帕登國際有限公司.
 Created by Pardn Chiu 邱敬幃.
 Email: chiuchingwei@icloud.com
 */

import Foundation
import UIKit

public let vw = UIScreen.main.bounds.size.width;

public let vh = UIScreen.main.bounds.size.height;

public var _font		: UIFont 	{ get { return UILabel().font } };

public var _fontSize	: CGFloat 	{ get { return UILabel().font.pointSize } };

public var _fontName	: String 	{ get { return UILabel().font.fontName == ".SFUI-Regular" ? "Helvetica" : UILabel().font.fontName } };

public var _image		: UIImage 	{ get { return UIImage(systemName: "folder.badge.questionmark") ?? UIImage(); } };

public func safeTop() -> CGFloat {
	let window = UIApplication.shared.connectedScenes
		.filter({
			$0.activationState == .foregroundActive
		})
		.map({
			$0 as? UIWindowScene
		})
		.compactMap({$0})
		.first?.windows
		.filter({$0.isKeyWindow}).first
	return window?.safeAreaInsets.top ?? 0
};

public func safeBottom() -> CGFloat {
	let window = UIApplication.shared.connectedScenes
		.filter({
			$0.activationState == .foregroundActive
		})
		.map({
			$0 as? UIWindowScene
		})
		.compactMap({$0})
		.first?.windows
		.filter({$0.isKeyWindow}).first
	return window?.safeAreaInsets.bottom ?? 0
};

public protocol PDExtension {}
public extension PDExtension where Self: AnyObject {

		func `_`(_ _self: (Self) throws -> Void) rethrows -> Self {
				try _self(self);
				return self;
		};
};
extension NSObject: PDExtension {};
