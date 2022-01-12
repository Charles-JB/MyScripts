@echo off

echo "Kill SPSS application"

powershell -Command "Stop-Process -Name spssengine -Force"
powershell -Command "Stop-Process -Name stats -Force"

echo "Checking if unpatched Log4J Files Exist (2.13 and 2.15 versions)..."

IF EXIST "C:\Program Files\IBM\SPSS\Statistics\27\log4j-core-2.13.3.jar" DEL /F /S "C:\Program Files\IBM\SPSS\Statistics\27\log4j-core-2.13.3.jar"
IF EXIST "C:\Program Files\IBM\SPSS\Statistics\27\log4j-core-2.15.0.jar" DEL /F /S "C:\Program Files\IBM\SPSS\Statistics\27\log4j-core-2.15.0.jar"
IF EXIST "C:\Program Files\IBM\SPSS\Statistics\27\log4j-api-2.13.3.jar" DEL /F /S "C:\Program Files\IBM\SPSS\Statistics\27\log4j-api-2.13.3.jar"
IF EXIST "C:\Program Files\IBM\SPSS\Statistics\27\log4j-1.2-api-2.13.3.jar" DEL /F /S "C:\Program Files\IBM\SPSS\Statistics\27\log4j-1.2-api-2.13.3.jar"
IF EXIST "C:\Program Files\IBM\SPSS\Statistics\27\as-3.2.3.0\lib\log4j-core-2.13.3.jar" DEL /F /S "C:\Program Files\IBM\SPSS\Statistics\27\as-3.2.3.0\lib\log4j-core-2.13.3.jar"
IF EXIST "C:\Program Files\IBM\SPSS\Statistics\27\as-3.2.3.0\lib\log4j-core-2.15.0.jar" DEL /F /S "C:\Program Files\IBM\SPSS\Statistics\27\as-3.2.3.0\lib\log4j-core-2.15.0.jar"
IF EXIST "C:\Program Files\IBM\SPSS\Statistics\27\as-3.2.3.0\lib\log4j-api-2.13.3.jar" DEL /F /S "C:\Program Files\IBM\SPSS\Statistics\27\as-3.2.3.0\lib\log4j-api-2.13.3.jar"
IF EXIST "C:\Program Files\IBM\SPSS\Statistics\27\as-3.2.3.0\lib\log4j-1.2-api-2.13.3.jar" DEL /F /S "C:\Program Files\IBM\SPSS\Statistics\27\as-3.2.3.0\lib\log4j-1.2-api-2.13.3.jar"
IF EXIST "C:\Program Files\IBM\SPSS\Statistics\27\common\ext\bin\spss.cognos.9\log4j-1.2.17.jar" DEL /F /S "C:\Program Files\IBM\SPSS\Statistics\27\common\ext\bin\spss.cognos.9\log4j-1.2.17.jar"

echo "Downloading ZIP File with patched files."
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://networkadminhotspex-my.sharepoint.com/:f:/g/personal/jose_jimenez_hotspex_com/EkBNxt4iWENKmY4GT-qb510BS48FRU0e-yLguyHEHaynxQ?e=Woqh8d/27.0.1-IM-S27STATC-ALL-IF022.zip', 'package.zip')"
echo "Expanding ZIP File."
powershell -Command "Expand-Archive -Force package.zip C:\Users\Public\Downloads"
echo "Cleaning up."
IF EXIST package.zip DEL /F /S package.zip

echo "Copying files (9 Total)."
copy "C:\Users\Public\Downloads\log4j-1.2-api-2.17.0.jar" "C:/Program Files/IBM/SPSS/Statistics/27/"
copy "C:\Users\Public\Downloads\log4j-1.2-api-2.17.0.jar" "C:/Program Files/IBM/SPSS/Statistics/27/common/ext/bin/"
copy "C:\Users\Public\Downloads\log4j-1.2-api-2.17.0.jar" "C:/Program Files/IBM/SPSS/Statistics/27/as-3.2.3.0/lib/"

copy "C:\Users\Public\Downloads\log4j-core-2.17.0.jar" "C:/Program Files/IBM/SPSS/Statistics/27/"
copy "C:\Users\Public\Downloads\log4j-core-2.17.0.jar" "C:/Program Files/IBM/SPSS/Statistics/27/common/ext/bin/"
copy "C:\Users\Public\Downloads\log4j-core-2.17.0.jar" "C:/Program Files/IBM/SPSS/Statistics/27/as-3.2.3.0/lib/"

copy "C:\Users\Public\Downloads\log4j-api-2.17.0.jar" "C:/Program Files/IBM/SPSS/Statistics/27/"
copy "C:\Users\Public\Downloads\log4j-api-2.17.0.jar" "C:/Program Files/IBM/SPSS/Statistics/27/as-3.2.3.0/lib/"
copy "C:\Users\Public\Downloads\log4j-api-2.17.0.jar" "C:/Program Files/IBM/SPSS/Statistics/27/common/ext/bin/"


echo "Cleaning up temp files."

IF EXIST C:\Users\Public\Downloads\log4j-1.2-api-2.15.0.jar DEL /F /S C:\Users\Public\Downloads\log4j-1.2-api-2.15.0.jar
IF EXIST C:\Users\Public\Downloads\27log4j-core-2.15.0.jar DEL /F /S C:\Users\Public\Downloads\log4j-core-2.15.0.jar
IF EXIST C:\Users\Public\Downloads\log4j-api-2.15.0.jar DEL /F /S C:\Users\Public\Downloads\log4j-api-2.15.0.jar
IF EXIST C:\Users\Public\Downloads\log4j-1.2-api-2.17.0.jar DEL /F /S C:\Users\Public\Downloads\log4j-1.2-api-2.15.0.jar
IF EXIST C:\Users\Public\Downloads\27log4j-core-2.17.0.jar DEL /F /S C:\Users\Public\Downloads\log4j-core-2.15.0.jar
IF EXIST C:\Users\Public\Downloads\log4j-api-2.17.0.jar DEL /F /S C:\Users\Public\Downloads\log4j-api-2.15.0.jar

echo "SPSS Patch Completed"