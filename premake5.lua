-- ImGuizmo
project "ImGuizmo"
  kind "StaticLib"
  language "C++"
  cppdialect "C++17"
  staticruntime "on"
  systemversion "latest"


  targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
  objdir ("%{wks.location}/build/" .. outputdir .. "/%{prj.name}")

  IncludeDir["imguizmo"] = "%{wks.location}/libs/imguizmo"

  includedirs {
    "%{IncludeDir.imgui}",
    "%{IncludeDir.imguizmo}",
  }

  files {
    "premake5.lua",

    "ImZoomSlider.h",
    "ImGuizmo.h",    "ImGuizmo.cpp",
    "ImGradient.h",  "ImGradient.cpp",
    "GraphEditor.h", "GraphEditor.cpp",
    "ImCurveEdit.h", "ImCurveEdit.cpp",
    "ImSequencer.h", "ImSequencer.cpp",
  }

  filter "system:windows"
    defines {
      "_CRT_SECURE_NO_WARNINGS"
    }

  filter "system:linux"
    pic "On"

  filter "system:macosx"
    pic "On"

  filter "configurations:Debug"
    runtime "Debug"
    symbols "On"

  filter "configurations:Release"
    runtime "Release"
    optimize "On"
