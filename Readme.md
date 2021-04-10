## Setting up Visual Studio Code ##
We will use VSCode for all excercises, as it is cross-platform and has extensions for everything we need.  
1. Download and install VSCode for your OS from [here](https://code.visualstudio.com/download)
2. We will use the following extensions
    1. Remote SSH development kit (ms-vscode-remote.remote-ssh). We will use this to run our shell scripts on remote terminal of VM. This is not needed, if you're on Mac or Linux and will be using the built-in shell
    2. Python develompent kit (ms-python.python). We will install this in our remote instance for sure, but you can install it locally too.
    3. SpellCheck (timonwong.shellcheck) is a linter for shell scripts
    4. language-Ansible (haaaad.ansible)
    5. YAML (redhat.vscode-yaml)
    6. HashiCorp Terraform hashicorp.terraform
## Setting up our VM ##
To be successful in the course we need at least one Linux VM (in some Lectures more than one)
### Windows users ###
Windows users can use the Ubuntu app on Windows Subsystem for Linux (WSL) to quickly spin up an Ubuntu VM. This will be sufficient for most lectures. Install the app from [Microsoft Store](https://www.microsoft.com/en-us/p/ubuntu/9nblggh4msv6?activetab=pivot:overviewtab)  
Another option is to use Vagrant + VirtualBox.  
You can download Vagrant from [here](https://www.vagrantup.com/downloads) and VirtualBox from [here](https://www.virtualbox.org/wiki/Downloads)  
Basic steps to spin up a VM, after you have installed Vagrant and VirtualBox
1. Pull the Vagrantfile from the git repository
2. Open command prompt and navigate to the directory, where you pulled the Vagrantfile. This directory will be your home directory for the Vagrant project and Vagrant will add some extra hidden files and directories inside.
3. Type `vagrant up`. Note that if vagrant executable is not in your PATH, you will need to provide absolute path to the executable.
4. Vagrant will take some time to download the VM image and start up the VM
5. Once it is ready do `vagrant ssh` from your command prompt and this should start SSH session with your new VM
6. Inside `/vagrant` directory you will see the content of the directory where you placed the Vagrantfile
7. Check that the directory is synchronizing in real time between the host OS and the guest OS
### Mac users ###

## Configuring VSCode for Remote development ##
We need to get the SSH config for our Vagrant box
1. Go to the directory where your Vagrantfile is placed
2. In Command prompt / terminal type `vagrant ssh-config`. This will dump the SSH config for the Vagrant box, including the host, port, and path to private key.
3. Save this output to a file or add it in your default ssh config. In Windows this should be a hidden file **.ssh\config** under the home directory of the user
    1. As an alternative you can save it as separate file and create custom config for VSCode
    2. Inside VSCode open the Command Palette and look for Remote-SSH: Open Configuration File
    3. Select custom configuration file and provide path to the file you saved in step 3.1
4. From the command palette choose Remote-SSH: Connect to Host, choose "default"
5. New Window will pop-up and VSCode will take some time to set-up the "server"
6. For more information, check
    1. If you use Vagrant, https://code.visualstudio.com/docs/remote/ssh
    2. If you use WSL, check https://code.visualstudio.com/docs/remote/wsl
