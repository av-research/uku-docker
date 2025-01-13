#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/code/sm_ws/src/umrr_driver"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/code/sm_ws/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/code/sm_ws/install/lib/python3/dist-packages:/code/sm_ws/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/code/sm_ws/build" \
    "/usr/bin/python3" \
    "/code/sm_ws/src/umrr_driver/setup.py" \
     \
    build --build-base "/code/sm_ws/build/umrr_driver" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/code/sm_ws/install" --install-scripts="/code/sm_ws/install/bin"
