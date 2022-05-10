#!/bin/sh

tiramisu -o '#summary: #body' | tee $XDG_RUNTIME_DIR/polytiramisu-*
