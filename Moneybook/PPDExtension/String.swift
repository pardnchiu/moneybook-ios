/**
 Copyright 2023 Pardn Ltd 帕登國際有限公司.
 Created by Pardn Chiu 邱敬幃.
 Email: chiuchingwei@icloud.com
 */

import Foundation
import UIKit

extension String {

	public func replace(_ key: String,_ value: String) -> String {
		return self.replacingOccurrences(of: key, with: value, options: .literal, range: nil)
	};
};
