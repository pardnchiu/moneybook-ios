/**
 Copyright 2023 Pardn Ltd 帕登國際有限公司.
 Created by Pardn Chiu 邱敬幃.
 Email: chiuchingwei@icloud.com
 */

import Foundation
import UIKit

extension UIImage {
	
	@objc public convenience init?(sys: String) { self.init(systemName: sys);  };

	@objc public convenience init?(name: String) { self.init(named: name); };
};
