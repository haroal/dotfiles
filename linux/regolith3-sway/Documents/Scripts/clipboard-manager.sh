#!/usr/bin/env bash

#
# Script to display copyQ clipboard manager content in modal GUI, via ilia, to let user pick a copied value easily.
#

# Get 10 latest copyQ entries (with new lines escapes)
MAX_NUM_ELEMENTS=20
values=$(copyq eval -- "for(i=size(),j=0; i>0&&j < ${MAX_NUM_ELEMENTS}; --i,++j) print(str(read(j)).replace(/\\\\n/g, '\\\\\\\\n').replace(/\\n/g, '\\\\n') + '\n');")
# Display them via ilia to let user select one
escaped_value=$(echo -n "${values}" | ilia -p textlist -l "Clipboard" -n 2> /dev/null)
if [ -z "${escaped_value}" ]; then
	# User didn't select any so just exit
	exit 0
fi

# Unescape new lines
escaped_value=${escaped_value//\\n/$'\n'}
value=${escaped_value//$'\\\n'/\\n}

# Add copied value to the clipboard
copyq copy "${value}" > /dev/null
# Add copied value to the top of the copyQ list
copyq add "${value}"
