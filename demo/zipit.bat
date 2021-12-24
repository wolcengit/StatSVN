"C:\Program Files\7-Zip\7z" a -tzip %STATSVN_HOME%/repocache.zip "%HOMEPATH%/.statsvn/*"
xcopy /Y repocache.zip "%STATSVN_HOME%/target/docs/repocache.zip"
