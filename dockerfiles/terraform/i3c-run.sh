

dParams="-d \
    --secret awsAccessKey \
    --secret awsSecretKey \
    --secret awsRegion \
    --secret sshKeys \
    "
i3cAfter() {
    /i exshd terraform "/tf init"
}    