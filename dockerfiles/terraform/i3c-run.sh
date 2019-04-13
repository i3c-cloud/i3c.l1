

dParams="-d \
    --secret awsAccessKey \
    --secret awsSecretKey \
    --secret awsRegion \
    "
i3cAfter() {
   ## /i exshd terraform "echo \"export TF_VAR_aws_access_key=\\\$(/r secret awsAccessKey)\" >> /root/.bashrc"
}    