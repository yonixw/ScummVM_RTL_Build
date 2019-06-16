# escape=`
FROM python:3.7.3-windowsservercore AS python

# Different by the windows update version 
# Kind of anti docker LOL
FROM mcr.microsoft.com/powershell:6.2.1-windowsservercore-1809

# Copy from the python FROM
COPY --from=python /Python /Python

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV PYTHON_VERSION 3.7.3
ENV PYTHON_PIP_VERSION 19.1.1

RUN $env:PATH = 'C:\Python;C:\Python\Scripts;{0}' -f $env:PATH ; `
    Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\' -Name Path -Value $env:PATH ; `
    mkdir $env:APPDATA\Python\Python36\site-packages ; `
    Invoke-WebRequest 'https://bootstrap.pypa.io/get-pip.py' -OutFile 'get-pip.py' -UseBasicParsing ; `
    $replace = ('import tempfile{0}import site{0}site.getusersitepackages()' -f [char][int]10) ; `
    Get-Content get-pip.py | Foreach-Object { $_ -replace 'import tempfile', $replace } | Out-File -Encoding Ascii getpip.py ; `
    $pipInstall = ('pip=={0}' -f $env:PYTHON_PIP_VERSION) ; `
    python getpip.py $pipInstall ; `
    Remove-Item get-pip.py ; `
    Remove-Item getpip.py
RUN pip install --no-cache-dir virtualenv

# Prepare the ENV:
WORKDIR C:\src\app
COPY install.bat .
RUN cmd.exe /C install.bat
ENV GIT c:\src\app\PortableGit\bin

COPY build.bat .
COPY build.sh .

CMD cmd.exe /C build.bat
