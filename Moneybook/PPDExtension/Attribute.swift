/**
 Copyright 2023 Pardn Ltd 帕登國際有限公司.
 Created by Pardn Chiu 邱敬幃.
 Email: chiuchingwei@icloud.com
 */

import Foundation
import UIKit

public extension UILabel {

	var attrTxt: NSAttributedString { get { return self.attributedText ?? NSAttributedString(string: self.text ?? "") } set { self.attributedText = newValue } };

	func attr(txt: String) 																-> UILabel { self.attrTxt = setAttrKeyValue(nil, txt); return self; };

	func attr(name: String, size: CGFloat) 								-> UILabel { self.attrTxt = setAttrKeyValue(.font, UIFont(name: name, size: size) ?? _font); return self; };

	func attr(size: CGFloat, weight: UIFont.Weight) 			-> UILabel { self.attrTxt = setAttrKeyValue(.font, UIFont.systemFont(ofSize: size, weight: weight)); return self; };

	func attr(clr: UIColor) 															-> UILabel { self.attrTxt = setAttrKeyValue(.foregroundColor, clr); return self; };

	func attr(charSpacing: Float) 												-> UILabel { self.attrTxt = setAttrKeyValue(.kern, charSpacing); return self; };

	func attr(offset: CGFloat)														-> UILabel { self.attrTxt = setAttrKeyValue(.baselineOffset, offset); return self; }

	func attr(align: NSTextAlignment) 	-> UILabel { self.attrTxt = setAttrParaStyle({ style in style.alignment = align; }); return self; };

	func attr(minH: CGFloat) 						-> UILabel { self.attrTxt = setAttrParaStyle({ style in style.minimumLineHeight = minH; }); return self; };

	private func setAttrKeyValue(_ key: NSAttributedString.Key?,_ value: Any) -> NSAttributedString {
		let oldtxt = self.attrTxt;
		let attr = oldtxt.attributes(at: 0, effectiveRange: nil);
		let newTxt = (key == nil) ? NSAttributedString(string: value as? String ?? "") : oldtxt;
		let new = NSMutableAttributedString(attributedString: newTxt);
		if (attr.count != 0) {
			attr.forEach { (key: NSAttributedString.Key, value: Any) in
				if (key != .paragraphStyle) {
					new.addAttribute(key, value: value, range: NSRange(location: 0, length: new.length));
				};
			};
		};
		if let key = key {
			new.addAttribute(key, value: value, range: NSRange(location: 0, length: new.length));
		};
		return new;
	};

	private func setAttrParaStyle(_ void: (NSMutableParagraphStyle) -> Void) -> NSAttributedString {
		let txt = self.attrTxt;
		let attr = txt.attributes(at: 0, effectiveRange: nil);
		let new = NSMutableAttributedString(attributedString: txt);
		if (attr.count != 0) {
			attr.forEach { (key: NSAttributedString.Key, value: Any) in
				if (key != .paragraphStyle) {
					new.addAttribute(key, value: value, range: NSRange(location: 0, length: new.length));
				};
			};
		};
		if let style = attr[NSAttributedString.Key.paragraphStyle] as? NSMutableParagraphStyle {
			void(style);
			new.addAttribute(.paragraphStyle, value: style, range: NSRange(location: 0, length: new.length))
		}
		else {
			let style = NSMutableParagraphStyle();
			void(style);
			new.addAttribute(.paragraphStyle, value: style, range: NSRange(location: 0, length: new.length));
		};
		return new;
	};
};
