#!/bin/bash -eux

echo '==> Applying slow DNS fix'
if [[ "${PACKER_BUILDER_TYPE}" =~ "virtualbox" ]]; then
  echo 'echo "single-request-reopen" >> /etc/resolv.conf' > /etc/NetworkManager/dispatcher.d/fix-slow-dns
  chmod +x /etc/NetworkManager/dispatcher.d/fix-slow-dns
  service network restart
  echo '==> Slow DNS fix applied (single-request-reopen)'
else
  echo '==> Slow DNS fix not required for this platform, skipping'
fi
