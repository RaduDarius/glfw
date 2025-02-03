outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "GLFW"
    kind "StaticLib"
    language "C"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-temp/" .. outputdir .. "/%{prj.name}")

    files {
        "include/GLFW/glfw3.h",
        "include/GLFW/glfw3native.h",
        "src/glfw_config.h",
        "src/context.c",
        "src/init.c",
        "src/input.c",
        "src/monitor.c",
        "src/vulkan.c",
        "src/window.c"
    }

    filter "system:windows"
        systemversion "latest"
        staticruntime "On"

        files { "src/**.c" }

        defines { "_GLFW_WIN32", "_CRT_SECURE_NO_WARNINGS" }

    filter { "configurations:Release" }
        runtime "Release"
        optimize "On"

    filter { "configurations:Debug" }
        runtime "Debug"
        symbols "On"