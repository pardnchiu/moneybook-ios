/**
 Copyright 2023 Pardn Ltd 帕登國際有限公司.
 Created by Pardn Chiu 邱敬幃.
 Email: chiuchingwei@icloud.com
 */

import Foundation
import UIKit

extension UILabel {
	public func text(_ text: String) -> UILabel { self.text = text; return self; };

	public func text(_ text: String, color: UIColor, align: NSTextAlignment, row: Int, wrap: NSLineBreakMode) -> UILabel {
		self.text = text;
		self.textColor = color;
		self.textAlignment = align;
		self.numberOfLines = row;
		self.lineBreakMode = wrap;
		return self;
	};

	public var fontName	: String 	{ get { return self.font.fontName == ".SFUI-Regular" ? "Helvetica" : self.font.fontName } };

	public var fontSize	: CGFloat { get { return self.font.pointSize } };

	public var fontWeight: UIFont.Weight {
		get {
			let descriptor 	= self.font.fontDescriptor;
			let attributes 	= descriptor.fontAttributes;
			let fontWeight 	= attributes[.traits] as? [UIFontDescriptor.TraitKey: Any];
			let weight 			= fontWeight?[.weight] as? CGFloat ?? UIFont.Weight.regular.rawValue;
			return UIFont.Weight(rawValue: weight);
		}
	};

	public func font(weight: UIFont.Weight?, size: CGFloat?) -> UILabel {
		if let size = size, let weight = weight { self.font = UIFont.systemFont(ofSize: size, weight: weight); }
		else if let size = size { self.font = UIFont(name: self.fontName, size: size); }
		else if let weight = weight { self.font = UIFont.systemFont(ofSize: self.fontSize, weight: weight); }
		return self;
	};
};
