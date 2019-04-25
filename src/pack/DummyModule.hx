package pack;

import MacroUtils;
import haxe.Json;

@:buildMe
class DummyModule {
	public function new() {
		trace("New DummyModule");
		trace(Json.parse('{"foo": "bar"}'));

		// #if !macro
		// MacroUtils.test();
		// #end
	}
}

typedef Foo = {
	var foo:String;
	var bar:Bar;
}

enum Bar {
	FooBar;
}
