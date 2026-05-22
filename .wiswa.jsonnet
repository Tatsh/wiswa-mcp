local utils = import 'utils.libsonnet';

{
  uses_user_defaults: true,
  project_name: 'wiswa-mcp',
  version: '0.0.0',
  description: 'FastMCP server exposing Wiswa settings discovery for AI assistants.',
  keywords: ['command line', 'fastmcp', 'mcp', 'settings', 'wiswa'],
  primary_module: 'wiswa',
  primary_module_qualified: 'wiswa.mcp',
  want_main: true,
  want_flatpak: true,
  publishing+: { flathub: 'sh.tat.wiswa-mcp' },
  python_deps+: {
    main+: {
      click:: null,
      fastmcp: utils.latestPypiPackageVersionCaret('fastmcp'),
      niquests: utils.latestPypiPackageVersionCaret('niquests'),
      wiswa: utils.latestPypiPackageVersionCaret('wiswa'),
    },
    tests+: {
      'pytest-asyncio': utils.latestPypiPackageVersionCaret('pytest-asyncio'),
    },
  },
  pyproject+: {
    project+: {
      scripts: {
        'wiswa-mcp': 'wiswa.mcp.main:main',
      },
    },
    tool+: {
      coverage+: {
        report+: {
          omit+: ['wiswa/mcp/main.py'],
        },
        run+: {
          omit+: ['wiswa/mcp/main.py'],
        },
      },
      pytest+: {
        ini_options+: {
          asyncio_mode: 'auto',
        },
      },
      uv+: {
        'exclude-newer-package': {
          wiswa: '2026-05-22T23:59:59Z',
          'wiswa-typing': '2026-05-22T23:59:59Z',
          'wiswa-vcs': '2026-05-22T23:59:59Z',
        },
      },
    },
  },
  pyinstaller+: {
    collect_data+: ['fastmcp'],
    copy_metadata+: ['fastmcp'],
    vcpkg: {
      enabled: true,
      targets: {
        'windows-11-arm': {
          triplet: 'arm64-windows',
          packages: ['openssl'],
        },
      },
    },
  },
}
