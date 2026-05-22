wiswa-mcp
=========

.. include:: badges.rst

FastMCP server exposing `Wiswa <https://github.com/Tatsh/wiswa>`_ settings discovery to AI
assistants such as Claude Code, Cursor, and GitHub Copilot.

Installation
------------

.. code-block:: shell

   pipx install wiswa-mcp

Usage
-----

.. code-block:: shell

   wiswa-mcp

The server publishes the following MCP tools:

- ``get_defaults`` — return resolved default settings, optionally narrowed to a dot-separated key
  path.
- ``lookup_setting`` — return a single setting's default value plus a ready-to-paste
  ``.wiswa.jsonnet`` override snippet.
- ``list_settings`` — enumerate the keys available at a given path and depth.
- ``search_settings`` — substring search across fully-qualified setting key paths.

Claude Code
~~~~~~~~~~~

.. code-block:: shell

   claude mcp add wiswa-mcp -- wiswa-mcp

Cursor
~~~~~~

Add to ``.cursor/mcp.json``:

.. code-block:: json

   {
     "mcpServers": {
       "wiswa-mcp": {
         "command": "wiswa-mcp"
       }
     }
   }

GitHub Copilot CLI
~~~~~~~~~~~~~~~~~~

Add to ``.github/copilot/mcp.json``:

.. code-block:: json

   {
     "mcpServers": {
       "wiswa-mcp": {
         "command": "wiswa-mcp"
       }
     }
   }

.. only:: html

   .. automodule:: wiswa.mcp.server
      :members:

   Indices and tables
   ==================
   * :ref:`genindex`
   * :ref:`modindex`
