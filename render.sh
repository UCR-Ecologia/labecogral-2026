#!/bin/bash

set -euo pipefail

echo "Rendering Quarto site..."
if [[ "${1:-}" == "--no-execute" ]]; then
	echo "Mode: no-execute (code chunks will not run)"
	render_output="$(quarto render . --no-execute 2>&1)"
else
	echo "Mode: execute (code chunks will run)"
	render_output="$(quarto render . 2>&1)"
fi

if [[ -n "$render_output" ]]; then
	echo "$render_output"
else
	echo "No files required rendering (site already up to date)."
fi

echo ""
echo "Done! Now you can:"
echo "  git add ."
echo "  git commit -m 'Update content'"
echo "  git push"