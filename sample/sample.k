Import("MiniKonoha.Map");
Import("Syntax.CStyleWhile");
Import("Syntax.Null");
Import("Type.File");
Import("JavaScript.Array");
Load("LTSV_glue.k");

void main() {
	Array[Map[String]] ltsv = [];
	File f = new File("sample.ltsv","r");
	String line = "";
	while((line = f.readLine()) != null) {
		ltsv.add(LTSV.encodeToMap(line));
	}
	System.p(LTSV.decodeToString(ltsv));
}


main();
