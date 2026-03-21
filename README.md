# mprisex

Example app for libwatchfish music controler

Compilation with Qt5
```
mkdir -p build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Debug -DQT_VERSION_MAJOR=5
cmake --build . --verbose
```

Compilation with Qt6
```
mkdir -p build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Debug
cmake --build . --verbose
```