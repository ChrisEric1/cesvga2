rm -rfv "./keout" && rm -rfv "./build" && python3 -m pip install -r "./requirements.txt" && xcodebuild build -project="./CEsvga2.xcodeproj" -configuration i386 && xcodebuild build -project="./CEsvga2.xcodeproj" -configuration x86_64 && python3 "./fix-macho32.py" "./build/i386/CEsvga2.kext/Contents/MacOS/CEsvga2" && mkdir -pv "./keout/" && cp -rfv "./build/i386" "./keout/universal" && rm -rfv "./keout/universal/CEsvga2.kext/Contents/MacOS/CEsvga2" && lipo -create -output "./keout/universal/CEsvga2.kext/Contents/MacOS/CEsvga2" "./build/i386/CEsvga2.kext/Contents/MacOS/CEsvga2" "./build/x86_64/CEsvga2.kext/Contents/MacOS/CEsvga2" && python3 "./fix-macho32.py" "./keout/universal/CEsvga2.kext/Contents/MacOS/CEsvga2" && rm -rfv "./build/i386/CEsvga2.kext/Contents/_CodeSignature" && rm -rfv "./build/x86_64/CEsvga2.kext/Contents/_CodeSignature" && rm -rfv "./keout/universal/CEsvga2.kext/Contents/_CodeSignature" && cp -rfv "./Info-i386.plist" "./build/i386/CEsvga2.kext/Contents/Info.plist" && cp -rfv "./Info-x86_64.plist" "./build/x86_64/CEsvga2.kext/Contents/Info.plist" && cp -rfv "./Info-universal.plist" "./keout/universal/CEsvga2.kext/Contents/Info.plist" && cp -rfv "./build/i386" "./keout/" && cp -rfv "./build/x86_64" "./keout/"