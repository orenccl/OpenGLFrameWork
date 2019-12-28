workspace "OpenGLFrameWork"
	architecture "x86"
	startproject "OpenGLFrameWork"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder (solution directory)
IncludeDir = {}
-- IncludeDir["spdlog"] = "Mint/vendor/spdlog/include"
IncludeDir["GLFW"] = "OpenGLFrameWork/Dependencies/GLFW/include"
IncludeDir["GLEW"] = "OpenGLFrameWork/Dependencies/GLEW/include"
-- IncludeDir["imgui"] = "Mint/vendor/imgui"
-- IncludeDir["glm"] = "Mint/vendor/glm"

--  Include Mint/vendor/GLFW/premake5.lua"
-- include "Mint/vendor/GLFW"
-- include "Mint/vendor/Glad"
-- include "Mint/vendor/imgui"

LibDir = {}
LibDir["GLFW"] = "OpenGLFrameWork/Dependencies/GLFW/lib-vc2019"
LibDir["GLEW"] = "OpenGLFrameWork/Dependencies/GLEW/lib/Release/Win32"

project "OpenGLFrameWork"
	location "OpenGLFrameWork"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

--	pchheader "mtpch.h"
--	pchsource "Mint/src/mtpch.cpp"

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
--		"%{prj.name}/src/**.hpp",
--		"%{prj.name}/vendor/glm/glm/**.hpp",
--		"%{prj.name}/vendor/glm/glm/**.inl"
	}

	defines
	{
		"_CRT_SECURE_NO_WARNINGS"
	}
	includedirs
	{
		"%{prj.name}/src",
--		"%{IncludeDir.spdlog}",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.GLEW}",
--		"%{IncludeDir.imgui}",
--		"%{IncludeDir.glm}"
	}

	libdirs 
	{ 
		"%{LibDir.GLFW}",
		"%{LibDir.GLEW}",
	}

	links
	{
--		"GLFW",
--		"Glad",
--		"ImGui",
		"glfw3.lib",
		"glew32s.lib",
		"opengl32.lib",
	}

	filter "system:windows"
		systemversion "latest"

		defines
		{
			"MT_PLATFORM_WINDOWS",
			"GLEW_STATIC",
		}

	filter "configurations:Debug"
		defines "MT_DEBUG"
		runtime "Debug"
		symbols	"on"

		links
		{
			"msvcrtd.lib",
		}

	
	filter "configurations:Release"
		defines "MT_RELEASE"
		runtime "Release"
		optimize "on"

		links
		{
			"msvcrt.lib",
		}

	filter "configurations:Dist"
		defines "MT_DIST"
		runtime "Release"
		optimize "on"

		links
		{
			"msvcrt.lib",
		}