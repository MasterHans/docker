# Установка docker

## Инструкция по установке Docker Desktop:
https://docs.docker.com/docker-for-windows/install/


1. Скачать https://desktop.docker.com/win/stable/amd64/Docker%20Desktop%20Installer.exe
2. Настроить Windows Subsystem for Linux Installation Guide for Windows 10
  https://docs.microsoft.com/en-us/windows/wsl/install-win10
3. Запустить Windows Power Shell правой кнопкой мыши как администратор  
    
    wsl --install
    
4. Enables the optional WSL and Virtual Machine Platform components
   Запустить команду в cmd
   
    dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
    
5. Downloads and installs the latest Linux kernel
   https://www.microsoft.com/software-download/windows10
   
6. Sets WSL 2 as the default
   
   wsl --set-default-version 2


## Команды Docker:
Вернуть все образы содержащие mysql в названиях
    
    docker search mysql
    
search с ключом -s, она вернет только наибо-
лее часто используемые образы, опираясь на отзывы других пользователей

    docker search -s mysql
    
команда вернет все образы, имеющие слово «mysql» в названии и получив-
шие не менее 50 звезд по отзывам пользователей
    
    docker search --filter=stars=50 mysql
    
Команда docker pull загружает указанный образ из реестра Docker на локальный
компьютер:

    docker pull yiisoftware/yii2-php:latest

Команда docker images возвращает список образов верхнего уровня, доступных на
локальном компьютере
    
    docker images [options]
    
Команда docker rmi удаляет указанный образ или образы на локальном компью-
тере:
    
    docker rmi [options] image [image, image...]
    
Загрузить образ ubuntu
    
    docker pull ubuntu:latest    
    
Запустить образ
    
    docker run –it ubuntu
    
Команда docker ps выводит список всех контейнеров, запущенных к настоящему
моменту
    
    docker ps    

Команда docker logs выводит из указанного контейнера файлы журналов, содержа-
щие стандартный вывод (stdout и stderr) контейнера:    
    

    1) docker run -it ubuntu //Запустить образ 
    2) docker ps –a //найдите идентификатор запущенного контейнера Ubuntu (eded3539719c) копируем его в буфер 
    3) docker logs eded3539719c


Собрать контейнер MySQL (см. рис. 7.16)
и получить его идентификатор:

    docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql
    
Здесь name – это имя базы данных, -e – ключ для определения переменной окру-
жения с паролем доступа к базе данных, -d – ключ, требующий, чтобы команда
docker run запустила процесс в фоновом режиме.   

Остановить контейнер


    docker stop id_container

Перезапустить контейнер
    
    docker restart id_container

Удалить контейнер

    docker rm [options] containers

Посмотреть содержимое контейнера:

    docker inspect ubuntu    
    
Переименовать контейнер:

Сначала нужно узнать имя контейнера командой:

    docker ps -a

Собственно переименование:    
    
    docker rename gifted_hoover new_name
    
Посмотреть что внутри контейнера:

    docker inspect ubuntu

Скопировать файл из контейнера на диск c:/

    docker cp wonderful_villani:/var/log/bootstrap.log c:/
    
Скопировать файл из локальной машины в контейнер:

    docker cp c:/1.txt wonderful_villani:/var/     
    
Команда docker pause приостанавливает все процессы в указанных контейнерах
unpause - возобновляет
    
    docker pause wonderful_villani
    docker unpause wonderful_villani   

Команда docker create создает новый уровень контейнера, доступный для запи-
си, поверх указанного образа

    docker create fedora -it bash



Команда docker diff говорит сама за себя. Это еще одна очень важная команда, вы-
водящая изменения в файлах и каталогах в файловой системе контейнера:

    docker diff container


создать локально копию образа:
    
    docker commit 596cc899d8a4 myname:version1    
    
Работа с Dockerfile. Файл лежит в текущей директории
    
    docker build -t from_docker_file .    

в файле:

FROM ubuntu:latest
MAINTAINER masterhans75@hotmail.com
RUN apt-get update && apt-get install -y
#Нужно при установке mc выберать регион а это пока не понятно как сделать пакетно
#RUN apt install mc -y
RUN apt-get install mysql-server -y
EXPOSE 3306
CMD ["/usr/bin/MySQLd_safe"]
                

### Запускаем SQL скрипты внутри контейнера                         

    docker run –d –p 3306:3306 from_docker_file 
    docker exec -it b21f10e6f393 bash
    
    mysql
    show databases;
    connect information_schema
    show tables
    

### Компоновщик Docker Compose

Приложения, использующие Docker, обычно состоят из нескольких контейнеров,
т. е. они имеют компоненты (например, приложение, веб-сервер, базу данных),
развернутые в нескольких контейнерах Docker. Чтобы упростить запуск много-
контейнерных приложений, в рамках проекта Docker был создан инструмент
Docker Compose.


### Остановить все контейнеры
    
    docker-compose down
    
### Удалить все контейнеры

    docker rm -f $(docker ps -a -q)    
    
### Delete all volumes using the following command: 

    docker volume rm $(docker volume ls -q)    
    
### Purging All Unused or Dangling Images, Containers, Volumes, and Networks

    docker system prune 
    
### Запуск docker-compose

1) необходимо настроить docker-compose.yml
2) Почему при запуске можно заджавать явно имя хоста:
   
        
        docker-compose build
        
        docker-compose up -h <ServerName> <id_container>
        
    
3) --rm нужен чтобы контейнеры не плодились. Т.к. после того как ты остановишь котейнер он остаётся.
           этот ключ подчищает за собой   
           
        
        docker-compose up --rm -h <ServerName> <id_container>
        
4) Обязательно добавить ключ -d для того чтобы запустилось всё в фоне. И была возможность запустить bash                   

        
        docker-compose up --rm -d -h <ServerName> <id_container>
        
        docker-compose up --rm -d <id_container>
        
5) Запуск bash внутри контейнера


        docker exec -it ad172ba180cc bash          
