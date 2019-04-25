package;

import haxe.macro.Context;

class MacroUtils {
	public static function build() {
		var fields = Context.getBuildFields();
		for (f in fields) if (f.name == "foo") return fields;

		fields.push((macro class {
			public function foo():pack.DummyModule.Foo {
				return {foo: "bar"};
			}
		}).fields[0]);

		return fields;
	}
}
