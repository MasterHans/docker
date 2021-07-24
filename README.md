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
