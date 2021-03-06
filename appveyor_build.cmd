if not exist "C:\opencv" mkdir "C:\opencv"
if not exist "C:\opencv\build" mkdir "C:\opencv\build"

powershell "wget 'https://github.com/opencv/opencv/archive/3.3.1.zip' -outfile c:\opencv\opencv-3.3.1.zip"
powershell "unzip c:\opencv\opencv-3.3.1.zip -d c:\opencv"
del c:\opencv\opencv-3.3.1.zip /q
powershell "wget 'https://github.com/opencv/opencv_contrib/archive/3.3.1.zip' -outfile c:\opencv\opencv_contrib-3.3.1.zip"
powershell "unzip c:\opencv\opencv_contrib-3.3.1.zip -d c:\opencv"
del c:\opencv\opencv_contrib-3.3.1.zip /q
cd C:\opencv\build
set PATH=C:\Perl\site\bin;C:\Perl\bin;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Program Files\7-Zip;C:\Program Files\Microsoft\Web Platform Installer\;C:\Tools\PsTools;C:\Program Files (x86)\CMake\bin;C:\go\bin;C:\Tools\NuGet;C:\Program Files\LLVM\bin;C:\Tools\curl\bin;C:\ProgramData\chocolatey\bin;C:\Program Files (x86)\Yarn\bin;C:\Users\appveyor\AppData\Local\Yarn\bin;C:\Program Files\AppVeyor\BuildAgent\
set PATH=%PATH%;C:\mingw-w64\x86_64-6.3.0-posix-seh-rt_v5-rev1\mingw64\bin
cmake C:\opencv\opencv-3.3.1 -G "MinGW Makefiles" -BC:\opencv\build -DENABLE_CXX11=ON -DOPENCV_EXTRA_MODULES_PATH=C:\opencv\opencv_contrib-3.3.1\modules -DBUILD_SHARED_LIBS=ON -DBUILD_EXAMPLES=OFF -DBUILD_TESTS=OFF -DBUILD_PERF_TESTS=OFF -DBUILD_opencv_java=OFF -DBUILD_opencv_python=OFF -DBUILD_opencv_python2=OFF -DBUILD_opencv_python3=OFF -DBUILD_DOCS=OFF -DENABLE_PRECOMPILED_HEADERS=OFF -DBUILD_opencv_saliency=OFF -Wno-dev
mingw32-make
mingw32-make install
rmdir c:\opencv\opencv-3.3.1 /s /q
rmdir c:\opencv\opencv_contrib-3.3.1 /s /q
