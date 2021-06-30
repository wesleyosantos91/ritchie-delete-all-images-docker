@echo off
SETLOCAL

call:%~1
goto exit

:runFormula
  FOR /f "tokens=*" %%i IN ('docker ps -aq') DO docker rm -f %%i
  FOR /f "tokens=*" %%i IN ('docker images -a -q') DO docker rmi -f %%i
  FOR /f "tokens=*" %%i IN ('docker volume ls -q') DO docker volume rm -f %%i

  goto exit

:exit
  ENDLOCAL
  exit /b 0
