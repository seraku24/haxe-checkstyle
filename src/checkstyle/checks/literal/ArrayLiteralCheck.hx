package checkstyle.checks.literal;

import checkstyle.utils.ExprUtils;
import haxe.macro.Expr;

@name("ArrayLiteral", "ArrayInstantiation")
@desc("Checks if the array is instantiated using [] which is shorter and cleaner, not with new.")
class ArrayLiteralCheck extends Check {

	public function new() {
		super(AST);
		categories = [Category.STYLE, Category.CLARITY];
	}

	override function actualRun() {
		ExprUtils.walkFile(checker.ast, function(e:Expr) {
			switch (e.expr){
				case ENew({pack:[], name:"Array"}, _):
					logPos('Bad array instantiation, use the array literal notation "[]" which is shorter and cleaner', e.pos);
				default:
			}
		});
	}
}