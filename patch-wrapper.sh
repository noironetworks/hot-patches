#!/bin/sh
set -e

patch="/usr/bin/patch"
package="package"

if ! [ -x "$patch" ] ; then
    echo "ERROR: Executable '$patch' not installed."
    exit 1
fi

rootdir=`python -c "import $package; print $package.__path__[0]" 2>/dev/null || :`
if [ -z "$rootdir" ] ; then
    echo "ERROR: Package '$package' not installed on this host"
    exit 1
fi

echo "INFO: Patching $package at $rootdir"
cd $rootdir
$patch -p 2 <<'EOF'
EOF
echo "INFO: ... Done"
