### 配置镜像源

```bash
sudo pacman-mirrors -i -c China -m rank # 选择延迟最小的源
sudo pacman -Syy
```

因为需要配置文件, 所以此时需要先安装vim

```bash
sudo pacman -S vim
```

然后在 `/etc/pacman.config`文件中追加如下内容

```text
[archlinuxcn]
SigLevel = Optional TrustedOnly
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch
```

安装`archlinuxcn-keyring` 导入`GPG key`并更新软件仓库

```bash
sudo pacman -Syy
sudo pacman -S archlinuxcn-keyring
sudo pacman -Syyu
```

### pacman 常用指令

```bash
sudo pacman -S 软件名　# 安装
sudo pacman -R 软件名　# 删除单个软件包，保留其全部已经安装的依赖关系
sudo pacman -Rs 软件名 # 除指定软件包，及其所有没有被其他已安装软件包使用的依赖关系
sudo pacman -Ss 软件名  # 查找软件
sudo pacman -Sc # 清空并且下载新数据
sudo pacman -Syu　# 升级所有软件包
sudo pacman -Qs # 搜索已安装的包
```



### 使用Yay包管理工具

```bash
sudo pacman -S yay # 安装yay
yay --aururl "https://aur.tuna.tsinghua.edu.cn" --save # 更改为清华的镜像源
```

修改后的配置文件位于`~/.config/yay/config,json`, 也可以通过如下命令查看

```bash
yay -P -g
```

**yay**的常用指令

```bash
yay -S package # 从 AUR 安装软件包
yay -Rns package # 删除包
yay -Syu # 升级所有已安装的包
yay -Ps # 打印系统统计信息
yay -Qi package # 检查安装的版本
```

yay安装可以不用加`sudo`



### 更换终端

使用aur自带的`oh-my-zsh-git`一键安装

```bash
sudo pacman -S oh-my-zsh-git
cp /usr/share/oh-my-zsh/zshrc ~/.zshrc #ohmyzsh配置文件
chsh -s /bin/zsh #替换默认shell
```

以上配置在下次登录账户是生效



### 配置Git

较新版本中已经自带`Git`, 若没有可以使用`sudo pacman -S git`安装后进行配置

**配置基本信息**

```bash
git config --global user.name "Lin Yang"
git config --global user.email 'geekya215@gmail.com'
```



**配置代理, 网络不错的话可以忽略此项**

```bash
# 使用http/https代理
git config --global http.proxy 'http://127.0.0.1:1080'
git config --global https.proxy 'https://127.0.0.1:1080'

# 使用socks5代理
git config --global http.proxy 'socks5://127.0.0.1:1080'
git config --global https.proxy 'socks5://127.0.0.1:1080'

# 查看当前代理
git config --global http.proxy
git config --global https.proxy

# 删除代理
git config --global -unset http.proxy
git config --global -unset https.proxy
```



**生成SSH key(可选)**

```bash
ssh-keygen -t rsa -b 4096 -C "geekya215@gmail.com"
```

在`~/.ssh`目录下会生成`id_rsa`,`id_rsa.pub`两个文件, 接下来的配置可参考github官方教程



### 科学上网

github下载`electron-ssr-0.2.6.pacman`, 进入下载目录执行以下命令

```bash
chmod +x electron-ssr-0.2.6.pacman
sudo pacman -U electron-ssr-0.2.6.pacman
```



github下载`SwtichOmega`插件, 修改后缀为tar, 解压后在chrome中的插件打开dev模式, 点击`load pack` 加载刚刚解压出来的文件夹, 完成安装

打开`SwitchOmega`的设置面板, 在Proxy servers中添加

```
socks5 127.0.0.1 1080 
```

完成后选择proxy模式即可科学上网



### 开发环境以及工具

```bash
# 开发环境
yay -S jdk8-openjdk
yay -S nodejs
yay -S npm
yay -S yarn
yay -S mysql

# 开发工具
yay -S postman-bin
yay -S intellij-idea-ultimate-edition
yay -S visual-studio-code

# 终端
yay -S tldr # 简化指令描述
yay -S tree # 以树状显示目录结构
yay -S tmux # 分屏
yay -S net-tools # 显示网络配置以及信息 ifconfig netstat
yay -S mosh # SSH工具
yay -S ncdu # 磁盘分析器, 支持vim操作
yay -S ranger # 文件管理
yay -S bat # 文本查看,支持语法高亮, Git集成, 定制化主题
yay -S neofetch # 终端查看系统配置
yay -S htop # 进程查看工具

# 其他
yay -S google-chrome-stable # 404浏览器
yay -S typora # markdown编辑
```
