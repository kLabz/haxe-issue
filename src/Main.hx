package;

import pack.DummyModule;

class Main {
	static function main() {
		trace("hello world");

		var dummy = new DummyModule();
		trace(dummy.foo());

		MacroUtils.test();
	}
}