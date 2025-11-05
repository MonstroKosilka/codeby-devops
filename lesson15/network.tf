# Содаем Сеть 1 в зоне доступности b
resource "yandex_vpc_network" "lesson15-network-1" {
    description = "Сеть 1 в зоне ru-central1-b для lesson15"
    name = "lesson15-network-1"
}

resource "yandex_vpc_subnet" "lesson15-network-1-public" {
    description = "Публичная подсеть в Сети 1"
    name = "public_subnet_1"
    zone = "ru-central1-a"
    network_id = yandex_vpc_network.lesson15-network-1.id
    v4_cidr_blocks = [ "192.168.10.0/24" ]
}

resource "yandex_vpc_subnet" "lesson15-network-1-private" {
    description = "Частная подсеть в Сети 1"
    name = "private_subnet_1"
    zone = "ru-central1-b"
    network_id = yandex_vpc_network.lesson15-network-1.id
    v4_cidr_blocks = [ "192.168.20.0/24" ]
}

# Создаем Сеть 2 в зоне доступности a
resource "yandex_vpc_network" "lesson15-network-2" {
    description = "Сеть 2 в зоне ru-central1-a для lesson15"
    name = "lesson15-network-2"
}

resource "yandex_vpc_subnet" "lesson15-network-2-public" {
    description = "Публичная подсеть в Сети 2"
    name = "public_subnet_2"
    zone = "ru-central1-a"
    network_id = yandex_vpc_network.lesson15-network-2.id
    v4_cidr_blocks = [ "192.168.30.0/24" ]
}

resource "yandex_vpc_subnet" "lesson15-network-2-private" {
    description = "Частная подсеть в Сети 2"
    name = "private_subnet_2"
    zone = "ru-central1-b"
    network_id = yandex_vpc_network.lesson15-network-2.id
    v4_cidr_blocks = [ "192.168.40.0/24" ]
}