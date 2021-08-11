#!/bin/bash
pushd `dirname $0` > /dev/null
SCRIPT_PATH=`pwd`
popd > /dev/null

# Uninstall old sdk
if test -f "/opt/intel/sgxsdk/uninstall.sh"; then
    /opt/intel/sgxsdk/uninstall.sh
fi

# Compile SDK and install
make sdk DEBUG=1
make sdk_install_pkg DEBUG=1
sudo mkdir -p /opt/intel
cd /opt/intel
yes yes | sudo ${SCRIPT_PATH}/linux/installer/bin/sgx_linux_x64_sdk_*.bin

