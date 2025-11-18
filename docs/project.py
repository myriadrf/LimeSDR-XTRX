# Copyright date and release version should be updated accordingly!

project = 'LimeSDR XTRX'
copyright = '2024-2025 Lime Microsystems'
author = 'Lime Microsystems'
release = 'v1.3'

# These are used for the "Edit on GitHub" links.
# github_repo_path should be set to the branch + path to the docs.
# E.g. 'master/docs/', 'main/docs/' or 'docs/docs/' etc.

github_repo = 'LimeSDR-XTRX'
github_repo_path= 'docs/docs/'

# The default language for syntax highlighting in code blocks.
# This can be overridden using the ".. code-block::" directive.
highlight_language = 'console'

# Intersphinx mapping
# For MyriadRF internal projects list the project slug only.
# For external projects specify the reference and the full URL.
# To minimise build time only include projects that are referenced!
intersphinx_internal = [
    'limesdr-gw',
]
intersphinx_external = {
    # 'numpy': 'https://numpy.org/doc/stable/',
}

# Set to True if the project is archived.
archived = False

# When True internal intersphinx targets point at stage.myriadrf.org.
staging = True
