## scala-development-vm
Vagrant script (using Chef cookbooks) that creates a Virtualbox instance of Fedora for Scala development. Installs the latest Community version of IntelliJ IDEA.

### Pre-requisites
Both Vagrant and Virtualbox are required to already be installed. These can be installed directly from the vendor's site, or using a package manager.
If you are running Windows, then I recommend using Chocolatey to install these packages.

#### Chocolatey Installation Script
``` bat
@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
choco install VirtualBox -y
choco install Vagrant -y
```

If you do not already have Git installed, then run the following Chocolatey script. Since this installer adds items to the environment variables, you will need to restart the command prompt after the installation completes (before moving to the next step).

``` bat
choco install Git -y
```

### Usage
Once Vagrant and Virtualbox have been installed, then run the following commands to create your virtual Scala development environment. Be sure to run this in the area in which you'd like
to clone the Git repository (not C:\windows\system32).

``` bat
git clone https://github.com/KevinMellott91/scala-development-vm.git
cd scala-development-vm
vagrant up --provision
```

That's it! The username and password of the Fedora virtual machine are both "vagrant".

### Roadmap
I'd like to figure out how to pre-configure the IntelliJ IDEA IDE settings and plug-ins as part of the installation. Please contribute any other ideas or suggestions that you would find useful as well.
Pull requests are more than welcome!
 
### Notes
The "idea" Chef cookbook contains modifications to the [original version](https://github.com/vptheron/chef-idea) that was created by [Vincent Theron](https://github.com/vptheron). These changes have been submitted as a pull-request. 
