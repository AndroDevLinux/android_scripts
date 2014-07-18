echo "========================================"
echo "OpenDelta Configurator for Xperia M"
echo "========================================"

if [ "$VERSION" == "" ]; then
        if [ "$1" != "" ]; then
                VERSION=$1
        fi
fi

if [ "$VERSION" == "" ]; then
        echo "Abort: no version number, use future version instead this build version ( 1.0.2 | 8 |...)" >&2
        exit 1
fi
sed -i 's/^\(.*ro.delta.version=\).*/\1'"$VERSION"'/' device/sony/nicki/nicki.mk
echo "Version number verification:"
sed -n '/ro.delta.version=/p' device/sony/nicki/nicki.mk
