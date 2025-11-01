# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "epduq2tjdbj74kh3nrnq"
resource "yandex_compute_instance" "import_vm" {
  allow_recreate            = null
  allow_stopping_for_update = null
  description               = null
  folder_id                 = "b1ghet44o1pbg2o3ipei"
  gpu_cluster_id            = null
  hostname                  = "handmade-vm"
  labels                    = {}
  maintenance_grace_period  = null
  maintenance_policy        = null
  metadata = {
    ssh-keys  = "fedora:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDWRhyaJK0ZLDVXxzJARvMuDSuD967Shn3K/Ww2gHNq7ScBcYo7fKYNzRmWp58T7/AOGBfyVBBYOBp7c1BbWunDC6g0FgXgAC5z682bDmuYU3pY8zMwaYS1ybG/2Pj91+lRxyZS8G3smm+Fxb59C4VVlXMy6+rKZEA4NoFfBkwozoUO0NYBL+zvzyjLoUZ3XJPWUIPm5ZfZnz7kRwp22363tO/9bI6HGmEck1muFmkWRjFCcPf0zDjMKpu2+YRUMRNFQNsAJMxYBoOPrO4r2jmK2Sv+5xYnQUNIKM15z90apbrAwevh6lPn7dDYG0NgCPVz5KnwGfDuYIRZrf7fCqhT"
    user-data = "#cloud-config\ndatasource:\n Ec2:\n  strict_id: false\nssh_pwauth: no\nusers:\n- name: fedora\n  sudo: ALL=(ALL) NOPASSWD:ALL\n  shell: /bin/bash\n  ssh_authorized_keys:\n  - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDWRhyaJK0ZLDVXxzJARvMuDSuD967Shn3K/Ww2gHNq7ScBcYo7fKYNzRmWp58T7/AOGBfyVBBYOBp7c1BbWunDC6g0FgXgAC5z682bDmuYU3pY8zMwaYS1ybG/2Pj91+lRxyZS8G3smm+Fxb59C4VVlXMy6+rKZEA4NoFfBkwozoUO0NYBL+zvzyjLoUZ3XJPWUIPm5ZfZnz7kRwp22363tO/9bI6HGmEck1muFmkWRjFCcPf0zDjMKpu2+YRUMRNFQNsAJMxYBoOPrO4r2jmK2Sv+5xYnQUNIKM15z90apbrAwevh6lPn7dDYG0NgCPVz5KnwGfDuYIRZrf7fCqhT"
  }
  name                      = "handmade-vm"
  network_acceleration_type = "standard"
  platform_id               = "standard-v3"
  service_account_id        = null
  zone                      = "ru-central1-b"
  boot_disk {
    auto_delete = true
    #device_name = "epd5kt4a6im5ciho49li"
    #disk_id     = "epd5kt4a6im5ciho49li"
    mode        = "READ_WRITE"
    initialize_params {
      block_size  = 4096
      description = null
      image_id    = "fd8rdm99k2cojlojjehm"
      kms_key_id  = null
      name        = "disk-fedora-37-1761953962734"
      size        = 10
      snapshot_id = null
      type        = "network-ssd"
    }
  }
  metadata_options {
    aws_v1_http_endpoint = 1
    aws_v1_http_token    = 2
    gce_http_endpoint    = 1
    gce_http_token       = 1
  }
  network_interface {
    nat                = true
    security_group_ids = [yandex_vpc_security_group.public_sg.id]
    subnet_id          = yandex_vpc_subnet.public_subnet.id
  }
  placement_policy {
    host_affinity_rules       = []
    placement_group_id        = null
    placement_group_partition = 0
  }
  resources {
    core_fraction = 50
    cores         = 2
    gpus          = 0
    memory        = 2
  }
  scheduling_policy {
    preemptible = false
  }
}
