discard """
  matrix: "--gc:refc; --gc:orc"
"""

import "$lib/.." / compiler/strutils2
import std/assertions

block: # setLen
  var a = "abc"
  a.setLen 0
  a.setLen 3, isInit = false
  when defined(gcRefc): # bug #19763
    doAssert a[1] == 'b'
  a.setLen 0
  a.setLen 3, isInit = true
  doAssert a[1] == '\0'

block: # forceCopy
  var a: string
  a = "foo"
  when defined(gcRefc):
    shallow(a)
  var b: string
  b = a
  doAssert b[0].addr == a[0].addr
  var c: string
  c.forceCopy a
  doAssert c == a
  doAssert c[0].addr != a[0].addr

block: # toLowerAscii
  var a = "fooBAr"
  a.toLowerAscii
  doAssert a == "foobar"

block: # dataPointer
  var a: string
  discard a.dataPointer
  # doAssert a.dataPointer == nil # not guaranteed
