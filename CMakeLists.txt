cmake_minimum_required(VERSION 3.10)
set( CMAKE_CXX_COMPILER "C:/mingw64/bin/g++.exe" )
set( CMAKE_C_COMPILER "C:/mingw64/bin/gcc.exe" )

# Set the project name
project(RayTracingEngine)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

link_directories("C:/VulkanSDK/1.4.304.1/Lib")

add_executable(RayTracingEngine src/main.cpp)

list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/modules")

set(OpenGL_GL_PREFERENCE GLVND)
find_package(OpenGL REQUIRED)
target_link_directories(${PROJECT_NAME} PRIVATE ${OPENGL_opengl_LIBRARY})

# Adding VULKAN lib
set(Vulkan_LIBRARY "C:/VulkanSDK/1.4.304.1/Lib/vulkan-1.lib")
set(Vulkan_INCLUDE_DIR "C:/VulkanSDK/1.4.304.1/Include")

find_package(Vulkan REQUIRED)
message("Vulkan found? " ${VULKAN_FOUND})
message("Alright, where is it? " ${Vulkan_LIBRARIES})
message("And I can include it? " ${Vulkan_INCLUDE_DIRS})
target_include_directories(${PROJECT_NAME} PRIVATE ${Vulkan_INCLUDE_DIRS})

# Adding GLM lib
target_include_directories(${PROJECT_NAME} PRIVATE "C:/Users/hngui/OneDrive/Documentos/Programing/lib/glm-1.0.1/")

# Adding GLFW lib
add_subdirectory("glfw")
target_include_directories(${PROJECT_NAME} PRIVATE "glfw/include")

# Add the executable
target_link_libraries(${PROJECT_NAME} ${Vulkan_LIBRARIES} glfw)
