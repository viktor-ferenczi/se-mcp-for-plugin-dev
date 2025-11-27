"""Formats the MCP config file for IDEs"""
import json
import os

CWD = os.path.abspath(os.getcwd())
CODE_DIR = os.path.join(CWD, 'Decompiled')

config = {
    "mcpServers": {
        "space-engineers-code-index": {
            "command": "uvx",
            "args": ["code-index-mcp", "--project-path", CODE_DIR],
        },
    }
}

with open('mcp.json', 'wt') as f:
    json.dump(config, f, indent=4)

fastmcp_config_path = os.path.join(CWD, 'code-index-mcp', 'fastmcp.json')
with open(fastmcp_config_path, 'rt') as f:
    fastmcp_config = json.load(f)

fastmcp_config['name'] = 'Space Engineers Code Index'
fastmcp_config['description'] = (
    "Index of the decompiled Space Engineers code. " +
    "It includes CSharp code (*.cs), the corresponding ILCode (*.il) and " +
    "any textual content in the game's Content folder (*.gsc, *.hlsi, *.json, *.mwl, *.resx, *.sbc, *.sbl, *.scf, *.vs, *.vsc, *.xml). " +
    "Use the ILCode only for transpiler patches and pre-patches."
)

with open(fastmcp_config_path, 'wt') as f:
    json.dump(fastmcp_config, f, indent=4)

with open('HttpServer.bat', 'wt') as f:
    f.write(f'''\
@echo off
cd code-index-mcp
call .venv\\Scripts\\activate.bat
python -u -OO run.py --transport sse --project-path "{CODE_DIR}"     
''')
