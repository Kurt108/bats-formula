include:
  - git

github:
  ssh_known_hosts:
    - present
    - name: github.com
    - user: root
    - enc: ssh-rsa
    - fingerprint: 16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48

bats:
  git.latest:
    - name: git@github.com:sstephenson/bats.git
    - target: /opt/bats
    - require:
      - sls: git
      - ssh_known_hosts: github


bats-tests:
  file.recurse:
    - name: /opt/bats-test
    - source: salt://salt/test
