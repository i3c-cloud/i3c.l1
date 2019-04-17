

dParams="-d \
    -v $uData/.profile/home:/home \
    --secret awsAccessKey \
    --secret awsSecretKey \
    --secret awsRegion \
    --secret sshKeys \
    "

i3cAfter(){
    /i exshd ansible "if [ ! -e /home/ansible ]; then echo '' | sudo -S cp -R /home.backup/* /home/ && sudo chown -R ansible:ansible /home; fi"
    /i exshd ansible "ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa >/dev/null"
    /i exshd ansible "sudo chmod 700 -R ~/.ssh"

}