#[
autogenerated by docgen
loc: /home/runner/work/Nim/Nim/lib/js/jsre.nim(74, 1)
rdoccmd: 
]#
import "/home/runner/work/Nim/Nim/lib/js/jsre.nim"
{.line: ("/home/runner/work/Nim/Nim/lib/js/jsre.nim", 74, 1).}:
  let jsregex: RegExp = newRegExp(r"\s+", r"i")
  jsregex.compile(r"\w+", r"i")
  assert "nim javascript".contains jsregex
  assert jsregex.exec(r"nim javascript") == @["nim".cstring]
  assert jsregex.toCstring() == r"/\w+/i"
  jsregex.compile(r"[0-9]", r"i")
  assert "0123456789abcd".contains jsregex
  assert $jsregex == "/[0-9]/i"
  jsregex.compile(r"abc", r"i")
  assert "abcd".startsWith jsregex
  assert "dabc".endsWith jsregex
  jsregex.compile(r"\d", r"i")
  assert "do1ne".split(jsregex) == @["do".cstring, "ne".cstring]
  jsregex.compile(r"[lw]", r"i")
  assert "hello world".replace(jsregex,"X") == "heXlo world"
  let digitsRegex: RegExp = newRegExp(r"\d")
  assert "foo".match(digitsRegex) == @[]

