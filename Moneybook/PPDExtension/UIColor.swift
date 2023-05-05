/**
 Copyright 2023 Pardn Ltd 帕登國際有限公司.
 Created by Pardn Chiu 邱敬幃.
 Email: chiuchingwei@icloud.com
 */

import Foundation
import UIKit

extension UIColor {

	@objc public convenience init(rgb red: CGFloat,_ green: CGFloat,_ blue: CGFloat,_ alpha: CGFloat) 	{ self.init(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha); };

	@objc public convenience init(rgb red: CGFloat,_ green: CGFloat,_ blue: CGFloat) 									{ self.init(rgb: red, green, blue, 1); };

	@objc public convenience init(rgb value: String) {
		let ary = value.split(separator: "/");
		if let red = Double(ary[0]), let green = Double(ary[1]), let blue = Double(ary[2]) {
			if let alpha = Double(ary[3]) {
				self.init(rgb: red, green, blue, alpha);
			} else {
				self.init(rgb: red, green, blue, 1);
			};
		} else {
			self.init(rgb: 255, 255, 255, 0);
		};
	};

	@objc public convenience init(hex value: String) 	{
		let str: String = value.trimmingCharacters(in: .whitespaces).replace("#", "");
		var rgb: UInt64 = 0;

		if (str.count == 8) {
			Scanner(string: str).scanHexInt64(&rgb);
			let red		: CGFloat = CGFloat((rgb & 0xFF000000) >> 24);
			let green	: CGFloat = CGFloat((rgb & 0x00FF0000) >> 16);
			let blue	: CGFloat = CGFloat((rgb & 0x0000FF00) >> 8);
			let alpha	: CGFloat = CGFloat(rgb & 0x0000FF);
			self.init(rgb: red, green, blue, alpha);
		}
		else if (str.count == 6) {
			Scanner(string: str).scanHexInt64(&rgb);
			let red		: CGFloat = CGFloat((rgb & 0xFF0000) >> 16);
			let green	: CGFloat = CGFloat((rgb & 0x00FF00) >> 8);
			let blue	: CGFloat = CGFloat(rgb & 0x0000FF);
			self.init(rgb: red, green, blue);
		}
		else if (str.count == 3) {
			Scanner(string: str).scanHexInt64(&rgb);
			let red		: CGFloat = CGFloat(Double((rgb & 0xF00) >> 4) * 1.0625);
			let green	: CGFloat = CGFloat(Double((rgb & 0x0F0)) * 1.0625);
			let blue	: CGFloat = CGFloat(Double((rgb & 0x00F)) * 17);
			self.init(rgb: red, green, blue);
		}
		else {
			self.init(rgb: 255, 255, 255, 0);
		};
	};

	@objc public convenience init(cg value: CGColor?) { self.init(cgColor: value ?? UIColor.clear.cgColor); };
};

