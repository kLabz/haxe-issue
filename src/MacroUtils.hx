package;

import haxe.macro.Context;
import pack.DummyModule;

class MacroUtils {
	public static function build() {
		var fields = Context.getBuildFields();

		for (f in fields) if (f.name == "foo") return fields;

		// var test = new DummyModule();
		// trace(test);

		fields.push((macro class {
			public function foo():pack.DummyModule.Foo {
				return {foo: "bar"};
			}
		}).fields[0]);

		return fields;
	}

	public static macro function test() {
		var test = new DummyModule();
		trace(test);
		// trace(SomeUtils.test(test));
		return macro trace("test");
	}
}
