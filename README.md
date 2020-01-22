# l2sp  Linux2SteamProxy-Shell  Project
Use proxy with steam

## !!!<font color="red">WARN</font>!!!


<font color="red">This instruction set has only been tested and tested on the Ubuntu 19+ operating system and has NOT been tested on other platforms. Please attention!</font>



## How to use?

Zh_TW:[中文使用說明](https://blog.sakurax.org/archives/100.html)  

Execute with root privileges in the terminal

### Install with network
```
  wget https://raw.githubusercontent.com/SkyFaklist/l2sp/master/l2sh.sh && chmod +x l2sh.sh && bash l2sh.sh
```

### Install without network
```
git clone https://github.com/SkyFaklist/l2sp.git

cd l2sp

chmod +x ./l2sh.sh && bash ./l2sh.sh
```


It may be a little difficult to set it up, but I believe you can


## Edit Proxy config
```
vim /etc/proxychains
```
**type  ip  port [user pass]**

For example : ***socks5  127.0.0.1 1080 admin passwd***


This project is inseparable from the support of the open source project 'proxychains'
