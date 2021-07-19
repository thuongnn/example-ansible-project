Ansible logs
---
- Thư mục này chứa logs của trình chạy ansible-playbooks nhằm mục đích debug khi chạy lỗi.
- Tệp log sẽ sinh ra cho mỗi lần chạy, tệp sinh ra có cú pháp như sau:
    ```text
    <tên playbook>_<%năm%tháng%ngày>_<%giờ%phút%giây>.log
    ```
  **Ví dụ**: docker_20210717_051318.log
- Dọn dẹp nhanh thư mục logs khi không còn dùng đến các tệp log nữa bằng command dưới đây:
    ```bash
    make clean
    ```