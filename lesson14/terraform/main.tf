terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  zone = "ru-central1-b"
}

resource "yandex_compute_disk" "boot-disk-1" {
  name     = "boot-disk-1"
  type     = "network-hdd"
  zone     = "ru-central1-b"
  size     = "10"
  image_id = "fd86n9726b9nc43mr7ru"
}

resource "yandex_compute_disk" "boot-disk-2" {
  name     = "boot-disk-2"
  type     = "network-hdd"
  zone     = "ru-central1-b"
  size     = "10"
  image_id = "fd86n9726b9nc43mr7ru"
}

resource "yandex_compute_instance" "vm-1" {
  name = "public_vm"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    disk_id = yandex_compute_disk.boot-disk-1.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.public_subnet.id
    nat       = true
    security_group_ids = [yandex_vpc_security_group.public_sg.id]
  }

  metadata = {
    ssh-keys = "ubuntu:${file("./ssh_key.pub")}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install -y nginx",
      "sudo systemctl enable nginx",
      "sudo mkdir -p /var/www/lesson14/html",
      "sudo chmod -R 755 /var/www/lesson14/html"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("./ssh_key")
      host        = self.network_interface[0].nat_ip_address
    }
  }

  provisioner "local-exec" {
    command = "scp -i ssh_key -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null index.html ubuntu@${self.network_interface[0].nat_ip_address}:/home/ubuntu/"    
  }

  provisioner "local-exec" {
    command = "scp -i ssh_key -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null lesson14 ubuntu@${self.network_interface[0].nat_ip_address}:/home/ubuntu/"    
  }

  provisioner "remote-exec" {
    inline = [
      "sudo cp index.html /var/www/lesson14/html/",
      "sudo cp lesson14 /etc/nginx/sites-available/",
      "sudo ln -s /etc/nginx/sites-available/lesson14 /etc/nginx/sites-enabled/",
      "sudo rm /etc/nginx/sites-enabled/default",
      "sudo systemctl restart nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("./ssh_key")
      host        = self.network_interface[0].nat_ip_address
    }
  }
}

resource "yandex_compute_instance" "vm-2" {
  name = "private_vm"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    disk_id = yandex_compute_disk.boot-disk-2.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.private_subnet.id
    nat       = true
    security_group_ids = [yandex_vpc_security_group.private_sg.id]
  }

  metadata = {
    ssh-keys = "ubuntu:${file("./ssh_key.pub")}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install -y nginx",
      "sudo systemctl enable nginx",
      "sudo mkdir -p /var/www/lesson14/html",
      "sudo chmod -R 755 /var/www/lesson14/html"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("./ssh_key")
      host        = self.network_interface[0].nat_ip_address
    }
  }

  provisioner "local-exec" {
    command = "scp -i ssh_key -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null index_private.html ubuntu@${self.network_interface[0].nat_ip_address}:/home/ubuntu/"    
  }

  provisioner "local-exec" {
    command = "scp -i ssh_key -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null lesson14_private_vm ubuntu@${self.network_interface[0].nat_ip_address}:/home/ubuntu/"    
  }

  provisioner "remote-exec" {
    inline = [
      "sudo cp index_private.html /var/www/lesson14/html/",
      "sudo cp lesson14_private_vm /etc/nginx/sites-available/",
      "sudo ln -s /etc/nginx/sites-available/lesson14_private_vm /etc/nginx/sites-enabled/",
      "sudo rm /etc/nginx/sites-enabled/default",
      "sudo systemctl restart nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("./ssh_key")
      host        = self.network_interface[0].nat_ip_address
    }
  }
}

