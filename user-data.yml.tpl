#cloud-config

hostname: bearded-vulture-${ip_addr}
fqdn: bearded-vulture-${ip_addr}.public-cloud.net

users:
  - name: gizzmonic
    groups: sudo
    lock_passwd: false
    passwd: $6$gBbGMN1xF/88tkyC$M4.UuNoFeTRO2aFcHpDIPjyHB8tFLLS8y3iGQnnq0BOwQ9Uw9BRLXtHNjjsMgNHe5y77y7dKQK5TOLcWEZxny0
    shell: /bin/bash
    ssh_authorized_keys:
      - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN+5ssY+G2SlScd6n5oXTxNvAsO8EfGU9syjHN1llYE9 gizzmonic@Clankio2.local

write_files:
  - path: /etc/sudoers.d/10-gizzmonic
    content: |
              gizzmonic ALL=(ALL) NOPASSWD: ALL
    permissions:
      '0640'
    owner: root:root

packages:
  - vim
