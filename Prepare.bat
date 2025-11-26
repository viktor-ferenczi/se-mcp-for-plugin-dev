@echo off

if exist Bin64 goto skip1
call LinkBin64.bat
if %ERRORLEVEL% NEQ 0 goto failed
echo ==========
:skip1

if exist Decompiled\VRage.XmlSerializers goto skip2
call Decompile.bat
if %ERRORLEVEL% NEQ 0 goto failed
echo ==========
:skip2

rmdir /s /q Bin64

if exist Decompiled\Content goto skip3
echo Copying indexable content
python -u copy_content.py
if %ERRORLEVEL% NEQ 0 goto failed
:skip3

if exist code-index-mcp\fastmcp.json goto skip4
git submodule update --init --recursive
if %ERRORLEVEL% NEQ 0 goto failed
cd code-index-mcp
if %ERRORLEVEL% NEQ 0 goto failed
uv sync
if %ERRORLEVEL% NEQ 0 goto failed
cd ..
if %ERRORLEVEL% NEQ 0 goto failed
:skip4

echo Writing MCP configuration file: mcp.json
python -u mcp_config.py
if %ERRORLEVEL% NEQ 0 goto failed

echo Copy the MCP server entry into your IDE's MCP server list:
echo.
type mcp.json
echo.
echo.

echo DONE
pause
exit /b 0

:failed
echo FAILED
pause
exit /b 1
