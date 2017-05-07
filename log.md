## Daily log 日志 -- Objective-C


### 2017.05.07
发现了个很头疼的问题。
OC 是 git 仓库，其下面的 QRCode 创建时选择了 git 版本控制。
之前（似乎）成功提交过一次。
今天代码再想提交，QRCode 项目的 'master' branch 在 shell 根本找不到。
最后解决办法还是把 QRCode 下的 '.git' 目录删干净。