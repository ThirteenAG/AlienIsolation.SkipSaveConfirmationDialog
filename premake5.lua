workspace "AlienIsolation.SkipSaveConfirmationDialog"
   configurations { "Release", "Debug" }
   architecture "x86"
   location "build"
   buildoptions {"-std:c++latest"}
   
   defines { "rsc_CompanyName=\"ThirteenAG\"" }
   defines { "rsc_LegalCopyright=\"MIT License\""} 
   defines { "rsc_FileVersion=\"1.0.0.0\"", "rsc_ProductVersion=\"1.0.0.0\"" }
   defines { "rsc_InternalName=\"%{prj.name}\"", "rsc_ProductName=\"%{prj.name}\"", "rsc_OriginalFilename=\"%{prj.name}.dll\"" }
   defines { "rsc_FileDescription=\"Save confirmation dialog skipper for Alien: Isolation\"" }
   defines { "rsc_UpdateUrl=\"https://github.com/ThirteenAG/AlienIsolation.SkipSaveConfirmationDialog\"" }
   
     
project "AlienIsolation.SkipSaveConfirmationDialog"
   kind "SharedLib"
   language "C++"
   targetdir "bin/%{cfg.buildcfg}"
   targetextension ".asi"
   
   includedirs { "source" }
   includedirs { "external" }
   files { "source/dllmain.cpp" }
   files { "source/resources/Versioninfo.rc" }
   files { "external/hooking/Hooking.Patterns.h", "external/hooking/Hooking.Patterns.cpp" }
   includedirs { "external/hooking" }
   includedirs { "external/injector/include" }
   
   characterset ("Unicode")
   
   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"
      flags { "StaticRuntime" }
	  