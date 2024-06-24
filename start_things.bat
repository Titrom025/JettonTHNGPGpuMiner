
call ".\npm_install.bat"

:_minerstart
node send_universal_things.js --api tonapi --givers 200
goto _minerstart

pause