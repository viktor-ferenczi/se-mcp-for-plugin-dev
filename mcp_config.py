"""Formats the MCP config file for IDEs"""
import json
import os

CWD = os.path.abspath(os.getcwd())
CODE_DIR = os.path.join(CWD, 'Decompiled')

config = {
    "mcpServers": {
        "space-engineers-code-index": {
            "timeout": 60,
            "type": "stdio",
            "command": "uvx",
            "args": [
                "code-index-mcp",
                "--project-path",
                CODE_DIR
            ],
            "cwd": CWD,
            "autoApprove": [
                "set_project_path",
                "search_code_advanced",
                "find_files",
                "get_file_summary",
                "refresh_index",
                "build_deep_index",
                "get_settings_info",
                "create_temp_directory",
                "check_temp_directory",
                "clear_settings",
                "refresh_search_tools",
                "get_file_watcher_status",
                "configure_file_watcher"
            ]
        }
    }
}

with open('mcp.json', 'wt') as f:
    json.dump(config, f, indent=4)

fastmcp_config_path = os.path.join(CWD, 'code-index-mcp', 'fastmcp.json')
with open(fastmcp_config_path, 'rt') as f:
    fastmcp_config = json.load(f)

fastmcp_config['name'] = 'Space Engineers Code Index'
fastmcp_config['description'] = (
        "Use this tool to search and read the source code of the Space Engineers game. " +
        "This tool provides access to the decompiled CSharp code (*.cs) and the corresponding ILCode (*.il), " +
        "in addition to some structured data files in the game's Content folder " +
        "(*.gsc, *.hlsi, *.json, *.mwl, *.resx, *.sbc, *.sbl, *.scf, *.vs, *.vsc, *.xml). " +
        "The ILCode is useful only if you work on a prepatch or transpiler patch."
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
