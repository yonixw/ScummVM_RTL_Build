echo [%DATE% %TIME%]  Go to dir:
cd C:\Users\Administrator\Desktop\git

echo [%DATE% %TIME%]  Delete build leftovers
rmdir /S /Q scummvm
del output\scummvm.exe  /F

echo [%DATE% %TIME%]  Clone our branch
git clone --single-branch --branch "feature/scumm-rtl" https://github.com/BLooperZ/scummvm

echo [%DATE% %TIME%]  Get values:
SET ZIP_FILE=scummvm_rtl_x86_nightly.zip
SET /p LAST_COMMIT=<last_nightly_commit_build.txt
SET /p LAST_TAG=<last_tag_build.txt

echo [%DATE% %TIME%]  Go to git folder
cd C:\Users\Administrator\Desktop\git\scummvm

echo [%DATE% %TIME%]  Get commit value:
for /f "delims=" %%a in ('git rev-parse HEAD') do @set GIT_COMMIT=%%a
for /f "delims=" %%a in ('git describe --tags') do @set GIT_TAG=%%a

IF "%GIT_COMMIT%" NEQ "%LAST_COMMIT%" goto :build_commit
echo "Skipping commit build because same commit: %GIT_COMMIT%"
goto :skip_build_commit

:build_commit
echo [%DATE% %TIME%]  Start build commit %GIT_COMMIT%

echo [%DATE% %TIME%]  Run configure and make
CALL "C:\MinGW\msys\1.0\bin\sh.exe" --login -i < ..\compile_commands.txt

echo [%DATE% %TIME%]  Move outputs:
move scummvm.exe ../output/

echo [%DATE% %TIME%]  Change dir
cd C:\Users\Administrator\Desktop\git

echo [%DATE% %TIME%] > output\README.txt
echo Visit us on facebook: >> output\README.txt
echo https://www.facebook.com/groups/200491360554968/ >> output\README.txt
echo Git commit: %GIT_COMMIT% >> output\README.txt

echo [%DATE% %TIME%]  Make zip
CALL "C:\Program Files (x86)\7-Zip\7z.exe" a -tzip %ZIP_FILE%  .\output\*

CALL aws s3 rm "s3://scummvm-rtl/builds/nightly-builds/%ZIP_FILE%"
CALL aws s3 cp %ZIP_FILE% "s3://scummvm-rtl/builds/nightly-builds/"

echo [%DATE% %TIME%]  Finishing commit build
echo %GIT_COMMIT%>last_nightly_commit_build.txt
del %ZIP_FILE% /F

:skip_build_commit

echo [%DATE% %TIME%]  Sanatizing tag name
SET script=python -c "print(''.join([x if x.isalnum() else '_' for x in '%GIT_TAG%']))"
for /f "delims=" %%a in ('%script%') do @set SAFE_TAG=%%a

SET ZIP_FILE=scummvm_rtl_x86_version-%SAFE_TAG%.zip

IF "%GIT_TAG%" NEQ "%LAST_TAG%" goto :build_tag
echo "Skipping taggd build because same tag: %GIT_TAG%"
goto :skip_build_tag

:build_tag
echo [%DATE% %TIME%]  Start build tag %GIT_TAG%

echo [%DATE% %TIME%]  Go to master folder
cd C:\Users\Administrator\Desktop\git\

echo [%DATE% %TIME%]  Delete commit build exe
del output\scummvm.exe  /F

echo [%DATE% %TIME%]  Go to git folder
cd C:\Users\Administrator\Desktop\git\scummvm

echo [%DATE% %TIME%]  Checkout tag
CALL git checkout %GIT_TAG%

echo [%DATE% %TIME%]  Run configure and make
CALL "C:\MinGW\msys\1.0\bin\sh.exe" --login -i < ..\compile_commands.txt

echo [%DATE% %TIME%]  Move outputs:
move scummvm.exe ../output/

echo [%DATE% %TIME%]  Go to master folder
cd C:\Users\Administrator\Desktop\git\

echo [%DATE% %TIME%] > output\README.txt
echo Visit us on facebook: >> output\README.txt
echo https://www.facebook.com/groups/200491360554968/ >> output\README.txt
echo Git tag: %GIT_TAG% >> output\README.txt

echo [%DATE% %TIME%]  Make zip
"C:\Program Files (x86)\7-Zip\7z.exe" a -tzip %ZIP_FILE%  .\output\*

CALL aws s3 rm "s3://scummvm-rtl/builds/releases/%ZIP_FILE%"
CALL aws s3 cp %ZIP_FILE% "s3://scummvm-rtl/builds/releases/"

echo [%DATE% %TIME%]  Finishing tagged build
echo %GIT_TAG%>last_tag_build.txt
del %ZIP_FILE% /F

:skip_build_tag

echo [%DATE% %TIME%] End of build script.
