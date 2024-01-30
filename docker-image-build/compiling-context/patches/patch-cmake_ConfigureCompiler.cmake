--- cmake/ConfigureCompiler.cmake
+++ cmake/ConfigureCompiler.cmake
@@ -72,6 +72,11 @@ if(WIN32)
   add_definitions(-DWIN32_LEAN_AND_MEAN)
 endif()
 
+if(USE_LIBCXX)
+  # Remove this after boost 1.81 or above is used
+  add_definitions(-D_LIBCPP_ENABLE_CXX17_REMOVED_UNARY_BINARY_FUNCTION)
+endif()
+
 if (USE_CCACHE)
   FIND_PROGRAM(CCACHE_FOUND "ccache")
   if(CCACHE_FOUND)
