Example ansible project
---
### Cấu hình inventory
- Khởi tạo tệp `hosts.ini` với nội dung trong tệp mẫu `hosts.ini.template` bằng lệnh sau:
    ```bash
    make init
    ```
- Cập nhật tệp `/inventory/hosts.ini` với mẫu như dưới đây:
    ```ini
    [cloud_servers]
    node-1 ansible_host=<IP Address of server 1>
    node-2 ansible_host=<IP Address of server 2>
    node-3 ansible_host=<IP Address of server 3>
    
    [all:vars]
    ansible_user=<normal user (need add to sudo group)>
    ansible_password=<password of normal user>
    ansible_become_user=root
    ansible_become_password=<password of root user>
    ansible_become_method=su
    ```
### Đọc hướng dẫn (README.md) trong thư mục logs và playbooks
- [Thư mục logs](./logs/README.md)  
- [Thư mục playbooks](./playbooks/README.md)

### Chạy ansible playbooks
```bash
chmod +x ./install.sh
./install.sh "<<playbook_name>>"
```
Ví dụ trong thư mục playbooks có tệp playbook là `docker.yml`, để chạy playbook này chạy lệnh như sau:
```bash
./install.sh docker
```
Nếu playbook không hợp lệ hay không tồn tại sẽ hiển thị lỗi như dưới đây:
```bash
./install.sh nginx
---
Error: playbook-name does not exist! check again in playbooks folder.
Example:
  path: playbooks/docker.yml
  Run this playbook by command: ./install.sh docker
```