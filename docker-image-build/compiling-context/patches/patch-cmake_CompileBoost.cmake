--- cmake/CompileBoost.cmake
+++ cmake/CompileBoost.cmake
@@ -84,8 +84,6 @@ if(USE_SANITIZER)
   return()
 endif()

-# since boost 1.72 boost installs cmake configs. We will enforce config mode
-set(Boost_USE_STATIC_LIBS ON)

 # Clang and Gcc will have different name mangling to std::call_once, etc.
 if (UNIX AND CMAKE_CXX_COMPILER_ID MATCHES "Clang$")
@@ -113,7 +111,7 @@ if(WIN32)
   return()
 endif()

-find_package(Boost 1.78.0 EXACT QUIET COMPONENTS context CONFIG PATHS ${BOOST_HINT_PATHS})
+find_package(Boost 1.78.0 COMPONENTS context CONFIG PATHS ${BOOST_HINT_PATHS})
 set(FORCE_BOOST_BUILD OFF CACHE BOOL "Forces cmake to build boost and ignores any installed boost")

 if(Boost_FOUND AND NOT FORCE_BOOST_BUILD)
