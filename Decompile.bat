@echo off
echo Decompiling the game

call DecompileDll.bat Sandbox.Common Bin64\Sandbox.Common.dll
if %ERRORLEVEL% NEQ 0 goto failed

call DecompileDll.bat Sandbox.Game Bin64\Sandbox.Game.dll
if %ERRORLEVEL% NEQ 0 goto failed

call DecompileDll.bat Sandbox.Game.XmlSerializers Bin64\Sandbox.Game.XmlSerializers.dll
if %ERRORLEVEL% NEQ 0 goto failed

call DecompileDll.bat Sandbox.Graphics Bin64\Sandbox.Graphics.dll
if %ERRORLEVEL% NEQ 0 goto failed

call DecompileDll.bat Sandbox.RenderDirect Bin64\Sandbox.RenderDirect.dll
if %ERRORLEVEL% NEQ 0 goto failed

call DecompileDll.bat SpaceEngineers Bin64\SpaceEngineers.exe
if %ERRORLEVEL% NEQ 0 goto failed

call DecompileDll.bat SpaceEngineers.Game Bin64\SpaceEngineers.Game.dll
if %ERRORLEVEL% NEQ 0 goto failed

call DecompileDll.bat SpaceEngineers.ObjectBuilders Bin64\SpaceEngineers.ObjectBuilders.dll
if %ERRORLEVEL% NEQ 0 goto failed

call DecompileDll.bat SpaceEngineers.ObjectBuilders.XmlSerializers Bin64\SpaceEngineers.ObjectBuilders.XmlSerializers.dll
if %ERRORLEVEL% NEQ 0 goto failed

call DecompileDll.bat VRage.Ansel Bin64\VRage.Ansel.dll
if %ERRORLEVEL% NEQ 0 goto failed

call DecompileDll.bat VRage.Audio Bin64\VRage.Audio.dll
if %ERRORLEVEL% NEQ 0 goto failed

call DecompileDll.bat VRage Bin64\VRage.dll
if %ERRORLEVEL% NEQ 0 goto failed

call DecompileDll.bat VRage.EOS Bin64\VRage.EOS.dll
if %ERRORLEVEL% NEQ 0 goto failed

call DecompileDll.bat VRage.EOS.XmlSerializers Bin64\VRage.EOS.XmlSerializers.dll
if %ERRORLEVEL% NEQ 0 goto failed

call DecompileDll.bat VRage.Game Bin64\VRage.Game.dll
if %ERRORLEVEL% NEQ 0 goto failed

call DecompileDll.bat VRage.Game.XmlSerializers Bin64\VRage.Game.XmlSerializers.dll
if %ERRORLEVEL% NEQ 0 goto failed

call DecompileDll.bat VRage.Input Bin64\VRage.Input.dll
if %ERRORLEVEL% NEQ 0 goto failed

call DecompileDll.bat VRage.Library Bin64\VRage.Library.dll
if %ERRORLEVEL% NEQ 0 goto failed

call DecompileDll.bat VRage.Math Bin64\VRage.Math.dll
if %ERRORLEVEL% NEQ 0 goto failed

call DecompileDll.bat VRage.Math.XmlSerializers Bin64\VRage.Math.XmlSerializers.dll
if %ERRORLEVEL% NEQ 0 goto failed

call DecompileDll.bat VRage.Mod.Io Bin64\VRage.Mod.Io.dll
if %ERRORLEVEL% NEQ 0 goto failed

call DecompileDll.bat VRage.NativeAftermath Bin64\VRage.NativeAftermath.dll
if %ERRORLEVEL% NEQ 0 goto failed

call DecompileDll.bat VRage.NativeWrapper Bin64\VRage.NativeWrapper.dll
if %ERRORLEVEL% NEQ 0 goto failed

call DecompileDll.bat VRage.Network Bin64\VRage.Network.dll
if %ERRORLEVEL% NEQ 0 goto failed

call DecompileDll.bat VRage.Platform.Windows Bin64\VRage.Platform.Windows.dll
if %ERRORLEVEL% NEQ 0 goto failed

call DecompileDll.bat VRage.Render Bin64\VRage.Render.dll
if %ERRORLEVEL% NEQ 0 goto failed

call DecompileDll.bat VRage.Render11 Bin64\VRage.Render11.dll
if %ERRORLEVEL% NEQ 0 goto failed

call DecompileDll.bat VRage.Scripting Bin64\VRage.Scripting.dll
if %ERRORLEVEL% NEQ 0 goto failed

call DecompileDll.bat VRage.Steam Bin64\VRage.Steam.dll
if %ERRORLEVEL% NEQ 0 goto failed

call DecompileDll.bat VRage.UserInterface Bin64\VRage.UserInterface.dll
if %ERRORLEVEL% NEQ 0 goto failed

call DecompileDll.bat VRage.XmlSerializers Bin64\VRage.XmlSerializers.dll
if %ERRORLEVEL% NEQ 0 goto failed

:done
echo Successfully decompiled the game
exit /b 0

:failed
echo Failed to decompile the game
exit /b 1
