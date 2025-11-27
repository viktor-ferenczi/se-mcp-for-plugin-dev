@echo off
cd code-index-mcp
call .venv\Scripts\activate.bat
python -u -OO run.py --transport sse --project-path "C:\Dev\SE1\MCP\se-mcp-for-plugin-dev\Decompiled"     
