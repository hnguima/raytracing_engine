:: Create the build directory
mkdir build
cd build

:: Run CMake and make
cmake .. -G "MinGW Makefiles"
cmake --build .
