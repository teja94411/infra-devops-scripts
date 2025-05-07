# 🤖 Ansible Commands Cheat Sheet — With Definitions

```bash
# 🔧 INSTALLATION
sudo apt update && sudo apt install ansible        # Install Ansible on Ubuntu/Debian
sudo yum install ansible                           # Install Ansible on RHEL/CentOS
ansible --version                                  # Check Ansible version

# 📄 INVENTORY FILE
cat /etc/ansible/hosts                             # Default inventory file
ansible-inventory --list -y                        # Show parsed inventory in YAML

# 🔍 PING ALL HOSTS
ansible all -m ping                                # Ping all hosts in the inventory

# 🚀 AD-HOC COMMANDS (One-liners)

# Run shell command on all hosts
ansible all -m shell -a "uptime"                   # Show uptime on all hosts

# Use a specific group
ansible webservers -m shell -a "df -h"             # Disk space check on 'webservers' group

# Copy file to remote
ansible all -m copy -a "src=./file.txt dest=/tmp/file.txt"

# Fetch file from remote
ansible all -m fetch -a "src=/etc/hosts dest=./backup/ flat=yes"

# Create directory
ansible all -m file -a "path=/opt/demo state=directory mode=0755"

# Install package
ansible all -m apt -a "name=nginx state=present" -b   # Ubuntu/Debian
ansible all -m yum -a "name=httpd state=present" -b   # RHEL/CentOS

# Start a service
ansible all -m service -a "name=nginx state=started" -b

# 📝 PLAYBOOK COMMANDS

# Run a playbook
ansible-playbook site.yml                            # Execute playbook

# Run with inventory
ansible-playbook -i inventory.ini site.yml           # Use specific inventory

# Run with tags
ansible-playbook site.yml --tags "install"

# Check without executing (dry-run)
ansible-playbook site.yml --check

# Run with extra vars
ansible-playbook site.yml --extra-vars "env=dev"

# Limit to a specific host
ansible-playbook site.yml --limit "web01"

# Use a different user and ask for sudo password
ansible-playbook site.yml -u ubuntu -b -K

# 📦 ROLES

# Create a role
ansible-galaxy init nginx-role

# Install roles from Galaxy
ansible-galaxy install geerlingguy.nginx

# Run playbook using a role
ansible-playbook roles-playbook.yml

# 📁 DIRECTORY STRUCTURE (BEST PRACTICE)

# Recommended layout:
production                  # Inventory file for production
staging                    # Inventory file for staging
group_vars/
    all.yml                # Variables for all hosts
    webservers.yml         # Variables for webservers group
host_vars/
    web01.yml              # Variables for web01 host
roles/
    nginx/
        tasks/
        handlers/
        defaults/
        files/
        templates/
site.yml                   # Main playbook

# 🧪 TESTING & DEBUGGING

ansible-playbook site.yml -vvv                       # Verbose mode for troubleshooting
ansible webservers -m setup                         # Gather system facts
ansible webservers -m debug -a "msg='Test message'" # Debug module

# 🧹 CLEANUP

ansible all -m file -a "path=/tmp/demo.txt state=absent"   # Delete file

```
