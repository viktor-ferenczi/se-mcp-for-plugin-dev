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
fastmcp_config['description'] = 'Index of the decompiled Space Engineers code. It includes both the CSharp code and ILCode. Use the ILCode only for transpiler patches and pre-patches.'

with open(fastmcp_config_path, 'wt') as f:
    json.dump(fastmcp_config, f, indent=4)
