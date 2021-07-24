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
