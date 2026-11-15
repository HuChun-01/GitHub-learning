command




++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
Git：
1.1更新Git：
sudo apt-get update && sudo apt-get install git -y

1.2设置用户名和邮箱：
git config --global user.name "YourGitHubUsername"
git config --global user.email "your-email@example.com"

1.3生成SSH密钥，用于免密登录GitHub：
ssh-keygen -t rsa -b 4096 -C "your-email@example.com"  # 一路回车默认配置
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub  # 复制输出的公钥，到 GitHub Settings → SSH and GPG keys 添加

2.1初始化本地仓库：
mkdir git-practice && cd git-practice  # 创建目录
git init  # 初始化本地仓库

2.2提交文件：
echo "Hello Git" > README.md  # 创建文件
git add README.md  # 添加到暂存区
git commit -m "Initial commit"  # 提交到本地仓库

2.3版本回退：
echo "Modified content" >> README.md  # 修改文件
git commit -a -m "Update README"  # 直接提交所有修改
git log --oneline  # 查看提交历史，记录最新 commit 的哈希值（如 `abc123`）
git reset --hard abc123  # 回退到指定版本（本地修改会丢失）

2.4克隆远程仓库：
git clone git@github.com:YourUsername/test-repo.git  # 替换为你的测试仓库地址
cd test-repo

2.5推送本地修改：
echo "Test push" > test.txt
git add test.txt
git commit -m "Add test file"
git push origin main  # 推送到 GitHub 主分支

2.6拉取远程更新：
# 在 GitHub 网页端修改 test.txt 内容，保存后执行：
git pull origin main  # 拉取最新代码

3.1创建并切换分支：
git branch feature/new-page  # 创建分支
git checkout feature/new-page  # 切换分支

3.2分支合并：
echo "New page content" > page.html  # 在分支中修改文件
git commit -a -m "Add new page"

git checkout main  # 切换回主分支
echo "Main branch update" >> README.md  # 在主分支修改文件
git commit -a -m "Update main branch"

git merge feature/new-page  # 合并分支（此时会提示冲突）

# 手动解决冲突：
vim README.md  # 删除冲突标记（<<<<<<<, =======, >>>>>>>），保留需要的内容，如果用 vim，按 Esc 后输入 :wq 保存退出
git add README.md
git commit -m "Fix merge conflict"  # 完成合并提交

4.1删除本地仓库：
cd ..  # 回到上级目录
rm -rf git-practice  # 删除整个练习目录（包括 .git 文件夹）

4.2清理SSH密钥：
rm ~/.ssh/id_rsa*  # 删除 RSA 密钥对（注意备份正式密钥）

重置Git全局配置：
git config --global --unset user.name
git config --global --unset user.email
---------------------------------------------------------
---------------------------------------------------------
查看当前所在分支：
git branch  # 列出所有分支，当前分支前有*标记

以图形化方式查看分支提交记录：
git log --oneline --graph --all  # 以图形化显示所有分支的提交历史

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
Docker
# 启动Docker服务
sudo systemctl start docker
sudo systemctl enable docker  # 开机自启

重启Docker服务
sudo systemctl daemon-reload
sudo systemctl restart docker

确认Docker服务正常运行
sudo systemctl status docker  #显示active (running)则正常

docker info  #查看 Docker 镜像加速器是否生效

----------------------------------------------------------------
----------------------------------------------------------------
彻底卸载现有 Docker 及数据
# 卸载 Docker 软件包
sudo apt-get remove -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras

# 删除 Docker 存储的所有数据（镜像、容器、卷等）
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd

# 清理残留依赖
sudo apt-get autoremove -y
sudo apt-get autoclean

配置阿里云 Docker 源
# 更新包索引并安装必要工具
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg

# 创建密钥存储目录
sudo install -m 0755 -d /etc/apt/keyrings

# 下载并添加阿里云 Docker GPG 密钥
curl -fsSL https://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# 添加阿里云 Docker 源到系统源列表
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://mirrors.aliyun.com/docker-ce/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 更新包索引（使阿里云源生效）
sudo apt-get update

安装Docker引擎
# 安装 Docker 最新版（包含 ce、cli、containerd 等组件）
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# 启动 Docker 服务并设置开机自启
sudo systemctl enable --now docker

# 验证安装（运行 hello-world 镜像，测试拉取和运行）
sudo docker run hello-world



++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
PowerShell: 
wsl --shutdown

#列出可用的 USB 设备
usbipd list

#绑定（共享）USB 设备
#替换 1-13 为你的相机 BUSID（从 usbipd list 中获取）
usbipd bind --busid 1-13

# 将相机挂载到 WSL2
usbipd attach --wsl --busid <BUSID>
usbipd attach --wsl --busid 1-13

#如果有多个 WSL 发行版，需指定发行版名称，例如挂载到名为 Ubuntu-22.04 的发行版：
usbipd attach --distro Ubuntu-22.04 --busid <BUSID>

#若需断开挂载，可在管理员 PowerShell 中执行：
usbipd detach --busid 1-13




++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 

WSL2:
#验证 WSL2 中是否识别相机
lsusb

#强制杀死进程
sudo killall -9 AutoAim


#Permission denied 错误，脚本文件没有 “可执行权限
chmod +x scripts/*.sh   #为 scripts 文件夹内的所有 .sh 脚本添加可执行权限

chmod +x scripts/setup.sh #只给 setup.sh 单独加权限


++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 




#config.user.json(原):
{
  "video": { "obs": { "host": "0.0.0.0", "port": 8765 } },
  "viz": { "enabled": true },
  "frame_source": { "enabled": true }
}


----------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------- 

