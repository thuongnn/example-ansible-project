Kịch bản chạy Ansible
---
- Thư mục này chứa sẵn các playbooks cho các trường hợp chạy.
- Ví dụ cùng là cài đặt docker nhưng sẽ có nhiều TH khác nhau như sau:
    - Cài đặt docker như bình thường
    - Cài đặt docker kết hợp cấu hình docker proxy
    - Cài đặt docker kết hợp cấu hình authentication với private registry  
- Mỗi một trường hợp kể trên có thể tạo cho nó một playbook cụ thể (dùng chung một ansible roles).
- Tham khảo các tham số cho chạy playbook trong tệp có format đường dẫn như sau:
    ```text
    ./roles/<role_sử_dụng>/defaults/main.yml
    ```
  **Ví dụ**:
    ```text
    /roles/docker/defaults/main.yml
    ```
- Ví dụ playbook cho cài đặt docker thông thường (sử dụng roles docker trong thư mục roles):
    ```yaml
    ---
    - name: Gather facts
      hosts: all
      gather_facts: true
      any_errors_fatal: true
      become: true
      tasks:
        - set_fact:
            playbook_action: install
      tags:
        - always
    
    - name: Installing Docker
      hosts: cloud_servers
      any_errors_fatal: true
      become: true
      gather_facts: false
      roles:
        - docker
      vars:
        docker_proxy_enable: false
        docker_registry_insecure: false
      tags:
        - docker
    ```