Import("JavaScript.Array");
Import("JavaScript.String");
Import("Syntax.CStyleWhile");
Import("MiniKonoha.Map");
Import("Java.Class");

class LTSV {

	@Public @Static Map[String] encodeToMap(String line) {
		String[] arr = line.split("\t");
		int i = 0;
		Map[String] ret = new Map[String];
		while(i<arr.getSize()) {
			int t = arr[i].indexOf(":");
			String k = arr[i].slice(0,t);
			String v = arr[i].slice(t+1);
			ret.set(k,v);
			i = i + 1;
		}
		return ret;
	}

	@Public @Static Array[Map[String]] encodeToArrayMap(String[] lines) {
		int i = 0;
		Array[Map[String]] ret = [];
		while(i<lines.getSize()) {
			ret.add(LTSV.encodeToMap(lines[i]));
			i = i + 1;
		}
		return ret;
	}

	@Public @Static String decodeToString(Map[String] ltsvLine) {
		String ret = "";
		int i = 0;
		String[] k = ltsvLine.keys();
		while(i < k.getSize()) {
			ret = ret + k[i] + ":" + ltsvLine.get(k[i]) + "\t";
			i = i + 1;
		}
		ret = ret + "\n";
		return ret;
	}

	@Public @Static String decodeToString(Array[Map[String]] ltsv) {
		String ret = "";
		int i = 0;
		while(i < ltsv.getSize()) {
			ret = ret + LTSV.decodeToString(ltsv[i]);
			i = i + 1;
		}
		return ret;
	}
}
