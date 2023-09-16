resource "yandex_compute_instance" "vm-public" {
  platform_id = "standard-v1"
  name        = "vm-public"
  zone        = "ru-central1-b"
  allow_stopping_for_update = true
  
  resources {
    cores         = 2
    memory        = 2
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = "fd82nvvtllmimo92uoul"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    nat=true
  }

  scheduling_policy {
    preemptible = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/ubuntu.pub")}"
  }
}

resource "yandex_compute_instance" "vm-private" {
  platform_id = "standard-v1"
  name        = "vm-private"
  zone        = "ru-central1-b"
  allow_stopping_for_update = true 

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = "fd82nvvtllmimo92uoul"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.private.id
  }

  scheduling_policy {
    preemptible = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/ubuntu.pub")}"
  }
}