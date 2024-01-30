diff --git bindings/c/generate_asm.py bindings/c/generate_asm.py
index 3acd14abe..ff09cdeb0 100755
--- bindings/c/generate_asm.py
+++ bindings/c/generate_asm.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 #
 # generate_asm.py
 #
@@ -28,7 +28,7 @@ import sys
 functions = {}
 
 func_re = re.compile(
-    "^\s*FDB_API_(?:CHANGED|REMOVED)\s*\(\s*([^,]*),\s*([^)]*)\).*")
+    r"^\s*FDB_API_(?:CHANGED|REMOVED)\s*\(\s*([^,]*),\s*([^)]*)\).*")
 
 with open(source, 'r') as srcfile:
     for l in srcfile:
