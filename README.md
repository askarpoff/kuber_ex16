# Домашнее задание к занятию «Организация сети»

### Задание 1. Yandex Cloud 

**Что нужно сделать**

1. Создать пустую VPC. Выбрать зону.
2. Публичная подсеть.

 - Создать в VPC subnet с названием public, сетью 192.168.10.0/24.
 - Создать в этой подсети NAT-инстанс, присвоив ему адрес 192.168.10.254. В качестве image_id использовать fd80mrhj8fl2oe87o4e1.
 - Создать в этой публичной подсети виртуалку с публичным IP, подключиться к ней и убедиться, что есть доступ к интернету.
3. Приватная подсеть.
 - Создать в VPC subnet с названием private, сетью 192.168.20.0/24.
 - Создать route table. Добавить статический маршрут, направляющий весь исходящий трафик private сети в NAT-инстанс.
 - Создать в этой приватной подсети виртуалку с внутренним IP, подключиться к ней через виртуалку, созданную ранее, и убедиться, что есть доступ к интернету.

### Ответ:

Сделал файлы

[main.tf](https://github.com/askarpoff/kuber_ex16/blob/main/terraform/main.tf) - Виртуалки

[network.tf](https://github.com/askarpoff/kuber_ex16/blob/main/terraform/network.tf) - Сеть

[provider.tf](https://github.com/askarpoff/kuber_ex16/blob/main/terraform/provider.tf) - Провайдер

[output.tf](https://github.com/askarpoff/kuber_ex16/blob/main/terraform/output.tf) - Вывод выданных ip

Применил

![image](https://github.com/askarpoff/kuber_ex16/assets/108946489/54cc68e6-e37e-47fe-b63b-c44e3ee6e3ec)

Зашел на публичный ip, Интернет есть

![image](https://github.com/askarpoff/kuber_ex16/assets/108946489/989a09f0-5ae3-40e3-b180-6be24244832d)

Выхожу, пробрасываю закрытый ключ на сервер в публичной сети

![image](https://github.com/askarpoff/kuber_ex16/assets/108946489/0967a13d-aee3-406b-b7e3-133f165bfbff)

Снова подключаюсь и захожу по ssh на сервер в приватной сети

![image](https://github.com/askarpoff/kuber_ex16/assets/108946489/0dc91003-7408-47aa-9555-c435a58c5858)

Доступ в Интернет на ВМ есть, видится в сети под адресом NAT-инстанса

![image](https://github.com/askarpoff/kuber_ex16/assets/108946489/c207ac32-2766-40c8-8de8-9070577587fd)



