

dParams="-d \
    --secret aws \
    --secret azure \
    "
i3cAfter() {
    /i exshd terraform "/tf init"
}    