/**
 Copyright 2023 Pardn Ltd 帕登國際有限公司.
 Created by Pardn Chiu 邱敬幃.
 Email: chiuchingwei@icloud.com
 */

import Foundation
import UIKit

extension UIView {

	@objc convenience public init(_ x: CGFloat,_ y: CGFloat,_ w: CGFloat,_ h: CGFloat) { self.init(frame: CGRect(x, y, w, h)); };

	public var width	: CGFloat { get { return self.frame.size.width; } set { self.frame.size.width = newValue; } };
	
	public var height	: CGFloat { get { return self.frame.size.height; } set { self.frame.size.height = newValue; } };

	public var pointX	: CGFloat { get { return self.frame.origin.x; } set { self.frame.origin.x = newValue; } };

	public var pointY	: CGFloat { get { return self.frame.origin.y; } set { self.frame.origin.y = newValue; } };

	public var radius	: CGFloat { get { return self.layer.cornerRadius; } set { self.layer.cornerRadius = newValue; } };

	public var bgColor: UIColor { get { return self.backgroundColor ?? .clear; } set { self.backgroundColor = newValue; } };

	public var sColor	: UIColor { get { return UIColor(cg: self.layer.shadowColor); } set { self.layer.shadowColor = newValue.cgColor; } };

	public var sAlpha	: Float 	{ get { return self.layer.shadowOpacity; } set { self.layer.shadowOpacity = newValue; } };

	public var bColor	: UIColor { get { return UIColor(cg: self.layer.borderColor); } set { self.layer.borderColor = newValue.cgColor; } };

	public var bWidth	: CGFloat { get { return self.layer.borderWidth } set { self.layer.borderWidth = newValue; } };

	@objc public func frame(_ x: CGFloat,_ y: CGFloat,_ width: CGFloat,_ height: CGFloat) -> UIView { self.frame = CGRect(x, y, width, height); return self; };

	@objc public func x(_ x: CGFloat) -> UIView { self.pointX = x; return self; };

	@objc public func y(_ y: CGFloat) -> UIView { self.pointY = y; return self; };

	@objc public func alpha(_ alpha: CGFloat)  -> UIView { self.alpha = alpha; return self; };

	@objc public func radius(_ radius: CGFloat) -> UIView { self.radius = radius; return self; };

	@objc public func clip(view bool: Bool) -> UIView { self.clipsToBounds = bool; return self; };

	@objc public func bg(color:  UIColor)  -> UIView { self.bgColor = color; return self; };

	@objc public func bg(image:  UIImage?) -> UIView { self.bgColor = UIColor(patternImage: image ?? _image); return self; };

	@objc public func shadow() -> UIView { self.sColor = UIColor(rgb: "0/0/0/0.1"); self.sAlpha = 1; return self; };

	@objc public func border(color: UIColor, width: CGFloat) -> UIView { self.bColor = color; self.bWidth = width; return self; };

	public func border(vert color: UIColor, width: CGFloat) -> UIView { self.border(T: color, width: width).border(B: color, width: width); };

	public func border(T color: UIColor, width: CGFloat) -> UIView { return self.layer([ CALayer()._ { $0.frame = CGRect(0, 0, self.width, width); $0.backgroundColor = color.cgColor; } ]); };

	public func border(B color: UIColor, width: CGFloat) -> UIView { return self.layer([ CALayer()._ { $0.frame = CGRect(0, self.height - width, self.width, width); $0.backgroundColor = color.cgColor; } ]); };

	@objc public func child(_ views: [UIView]) -> UIView { views.forEach { self.addSubview($0); }; return self; };

	public enum __corner_radius { case topRight, topLeft, bottomRight, bottomLeft; };

	public func radius(_ val: CGFloat, corner: [__corner_radius]) -> UIView {
		var mask: CACornerMask = [];
		corner.forEach { e in
			switch e {
				case .topRight		: mask.insert(.layerMaxXMinYCorner);
				case .topLeft			: mask.insert(.layerMinXMinYCorner);
				case .bottomRight	: mask.insert(.layerMaxXMaxYCorner);
				case .bottomLeft	: mask.insert(.layerMinXMaxYCorner);
			};
		};
		self.radius = val;
		self.layer.maskedCorners = mask;
		return self;
	};

	@objc public func layer(_ layers: Any) -> UIView {
		guard let layers = layers as? [Any] else {
			guard let layers = layers as? CALayer else { return self; };
			self.layer.addSublayer(layers);
			return self;
		}
		layers.forEach { layer in
			guard let layer = layer as? CALayer else { return; };
			self.layer.addSublayer(layer);
		};
		return self;
	};

	public func rotate(angle: CGFloat) -> UIView {
		let angle = angle / 180.0 * CGFloat.pi
		let rotation = self.transform.rotated(by: angle)
		self.transform = rotation
		return self;
	};
};
