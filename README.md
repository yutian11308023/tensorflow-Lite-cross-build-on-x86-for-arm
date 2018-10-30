# tensorflow-Lite-cross-build-on-x86-for-arm

follow this guide, you can cross build tensorflow-lite framework on X86 for arm and aarch64 platform。
copyright@tian.yu_1@nxp.com

1. you should have one X86 machine that installed with ubuntu OS,

2. import the based docker image base-x86-os.tar on your x86 host  
docker import - base-x86-os < base-x86-os.tar

3. run the dockerfile to build tensorflow-lite automatically  
docker build -t your-image-name --network=host .
