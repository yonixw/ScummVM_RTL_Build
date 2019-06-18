
aws s3 rm "s3://scummvm-rtl/builds/releases/%ZIP_FILE%"
aws s3 cp %ZIP_FILE% "s3://scummvm-rtl/builds/releases/"