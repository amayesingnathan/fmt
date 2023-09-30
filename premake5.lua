project "fmt"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
    staticruntime "on"

    targetdir 	("%{wks.location}/bin/%{prj.name}/" .. outputDir)
    objdir 		("%{wks.location}/obj/%{prj.name}/" .. outputDir)


    includedirs
    {
		"include"
    }

	files
	{
        "include/fmt/core.h",
        "include/fmt/format.h",
        "include/fmt/format-inl.h",
        "src/format.cc",
	}
	
    filter { "files:**.h" }
        compileas "HeaderUnit"

    filter "system:windows"
        systemversion "latest"
		
	filter "system:linux"
		pic "On"
		systemversion "latest"
        
    filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
