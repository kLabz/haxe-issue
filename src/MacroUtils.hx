package;

import haxe.Json;
import haxe.macro.Context;
import pack.DummyModule;

class MacroUtils {
	public static function build() {
		var cls = Context.getLocalClass();
		if (cls == null) return null;
		if (!cls.get().meta.has(':buildMe')) return null;

		var fields = Context.getBuildFields();
		for (f in fields) if (f.name == "foo") return fields;

		var test = new DummyModule();
		trace(test);

		var bar:Bar = FooBar;
		trace(bar);

		trace(Json.parse('{"foo": "bar"}'));

		fields = fields.concat((macro class {
			public function foo():pack.Foo {
				trace(Json.parse('{"foo": "bar"}'));
				return {
					foo: "bar",
					bar: FooBar
				};
			}

			public var bar:Bar = FooBar;
		}).fields);

		return fields;
	}

	public static macro function test() {
		var test = new DummyModule();
		trace(test);
		// trace(SomeUtils.test(test));
		return macro trace("test");
	}
}
