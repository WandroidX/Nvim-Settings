# ??? cambiar politica de execucion a Unrestricted para poder ejecutar scripts.
# ??? esto tambien instala chocolatey, necesario para instalar todo lo demás
Set-ExecutionPolicy Unrestricted -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco install python3
choco install nvim 
choco install nodejs
choco install git
pip install -U pynvim



