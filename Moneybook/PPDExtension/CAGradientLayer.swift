/**
 Copyright 2023 Pardn Ltd 帕登國際有限公司.
 Created by Pardn Chiu 邱敬幃.
 Email: chiuchingwei@icloud.com
 */

import Foundation
import UIKit

extension CAGradientLayer {

	public func frame(_ x: CGFloat,_ y: CGFloat,_ w: CGFloat,_ h: CGFloat) -> CAGradientLayer { self.frame = CGRect(x: x, y: y, width: w, height: h); return self; };

	public func bg(clr: UIColor) -> CAGradientLayer { self.backgroundColor = clr.cgColor; return self; };

	public func point(start x: CGFloat,_ y: CGFloat) -> CAGradientLayer { self.startPoint = CGPoint(x: x, y: y); return self; };

	public func point(end 	 x: CGFloat,_ y: CGFloat) -> CAGradientLayer { self.endPoint = CGPoint(x: x, y: y); return self; };
};
