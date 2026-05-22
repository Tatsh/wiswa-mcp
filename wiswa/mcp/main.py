"""FastMCP server exposing Wiswa settings discovery tools."""
from __future__ import annotations

from .server import mcp

__all__ = ('main',)


def main() -> None:
    """Entry point for the Wiswa MCP server."""
    mcp.run()
