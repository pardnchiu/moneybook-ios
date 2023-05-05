/**
 Copyright 2023 Pardn Ltd 帕登國際有限公司.
 Created by Pardn Chiu 邱敬幃.
 Email: chiuchingwei@icloud.com
 */

import Foundation
import UIKit

extension UIButton {

	override public func radius(_ radius: CGFloat) -> UIButton {
		var new = conf;
		new.background.cornerRadius = radius;
		self.layer.cornerRadius = radius;
		self.conf = new;
		return self;
	};

	override public func bg(color: UIColor) -> UIButton { var new = conf; new.background.backgroundColor = color; self.conf = new; return self; };

	override public func shadow() -> UIButton { self.layer.shadowColor = UIColor(rgb: "0/0/0/0.1").cgColor; self.layer.shadowOpacity = 1; return self; };

	override public func border(color: UIColor, width: CGFloat) -> UIButton { var new = conf; new.background.strokeWidth = width; new.background.strokeColor = color; self.conf = new; return self; };
};

extension UIButton {

	public func bg(image: UIImage?, mode: UIView.ContentMode, color: UIColor) -> UIButton {
		var new = conf;
		new.background.image = image?.withTintColor(color, renderingMode: .alwaysOriginal);
		new.background.imageContentMode = mode;
		self.conf = new;
		return self;
	};

	public func bg(image: UIImage?, mode: UIView.ContentMode) -> UIButton {
		var new = conf;
		new.background.image = image;
		new.background.imageContentMode = mode;
		self.conf = new;
		return self;
	};

	var conf: UIButton.Configuration {
		get {
			{ (conf: UIButton.Configuration) in
				return conf;
			}({
				if let conf = self.configuration { return conf; }
				else { return UIButton.Configuration.plain(); }
			}());
		}
		set {
			self.configuration = newValue;
		}
	};

	public enum __txt_align { case left, center, right, auto; };

	public func text(_ text: String) -> UIButton { var new = conf; new.title = text; self.conf = new; return self; };

	public func text(color: UIColor?, align: __txt_align?) -> UIButton {
		var new = conf;
		if let color = color { new.baseForegroundColor = color; };
		if let align = align {
			switch align {
				case .left	: new.titleAlignment = .leading;
				case .center: new.titleAlignment = .center;
				case .right	: new.titleAlignment = .trailing;
				case .auto	: new.titleAlignment = .automatic;
			};
		};
		self.conf = new;
		return self;
	};

	public func text(_ text: String, color: UIColor?, align: __txt_align?) -> UIButton {
		var new = conf;
		new.title = text;
		if let color = color { new.baseForegroundColor = color; };
		if let align = align {
			switch align {
				case .left	: new.titleAlignment = .leading;
				case .center: new.titleAlignment = .center;
				case .right	: new.titleAlignment = .trailing;
				case .auto	: new.titleAlignment = .automatic;
			};
		};
		self.conf = new;
		return self;
	};

	public func text(_ text: String, sub: String, color: UIColor?, align: __txt_align?) -> UIButton {
		var new = conf;
		new.title = text;
		new.subtitle = sub;
		if let color = color { new.baseForegroundColor = color; };
		if let align = align {
			switch align {
				case .left	: new.titleAlignment = .leading;
				case .center: new.titleAlignment = .center;
				case .right	: new.titleAlignment = .trailing;
				case .auto	: new.titleAlignment = .automatic;
			};
		};
		self.conf = new;
		return self;
	};

	public func font(_ font: UIFont?) -> UIButton {
		var new = conf;
		new.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { e in
			var config = e;
			config.font = font;
			return config
		};
		self.conf = new;
		return self;
	};

	public func font(weight: UIFont.Weight?, size: CGFloat?) -> UIButton {
		if let size = size, let weight = weight { _=self.font(UIFont.systemFont(ofSize: size, weight: weight)); }
		else if let size = size { _=self.font(UIFont(name: self.titleLabel?.fontName ?? _fontName, size: size)); }
		else if let weight = weight { _=self.font(UIFont.systemFont(ofSize: self.titleLabel?.fontSize ?? _fontSize, weight: weight)); }
		return self;
	};

	public func subFont(_ font: UIFont?) -> UIButton {
		var new = conf;
		new.subtitleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { e in
			var config = e;
			config.font = font;
			return config
		};
		self.conf = new;
		return self;
	};

	public func subFont(weight: UIFont.Weight?, size: CGFloat?) -> UIButton {
		if let size = size, let weight = weight { _=self.subFont(UIFont.systemFont(ofSize: size, weight: weight)); }
		else if let size = size { _=self.subFont(UIFont(name: self.subtitleLabel?.fontName ?? _fontName, size: size)); }
		else if let weight = weight { _=self.subFont(UIFont.systemFont(ofSize: self.subtitleLabel?.fontSize ?? _fontSize, weight: weight)); }
		return self;
	};

	public enum __img_align { case top, left, bottom, right; };

	public func img(_ img: UIImage?) -> UIButton { var new = conf; new.image = img ?? _image; self.conf = new; return self; };

	public func img(_ img: UIImage?, align: __img_align, gap: CGFloat) -> UIButton {
		var new = conf;
		new.image = img ?? _image;
		switch align {
			case .top		: new.imagePlacement = .top;
			case .left	: new.imagePlacement = .leading;
			case .bottom: new.imagePlacement = .bottom;
			case .right	: new.imagePlacement = .trailing;
		};
		new.imagePadding = gap;
		self.conf = new;
		return self;
	};

	public func padding(L: CGFloat) -> UIButton { var new = conf; new.contentInsets.leading = L; self.conf = new; return self; };

	public func padding(R: CGFloat) -> UIButton { var new = conf; new.contentInsets.trailing = R; self.conf = new; return self; };

	public func `if`(button bool: Bool,_ _self: (UIButton) throws -> Void) rethrows -> UIButton { if (bool) { try _self(self); }; return self; };

	public func touch(down: 		Any,_ action: Selector) -> UIButton { self.addTarget(down, action: action, for: .touchDown); return self; };
};
