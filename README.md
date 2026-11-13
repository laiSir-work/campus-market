# campus-market 校园二手交易平台

个人学习项目：面向校园场景的二手交易平台后端服务。

## 技术栈

| 层 | 技术 |
|---|---|
| 语言 / JDK | Java 21 |
| 框架 | Spring Boot 3.2.x |
| 持久层 | MyBatis-Plus 3.5.5 + MySQL 8 |
| 缓存 | Redis 7（缓存、防穿透、秒杀扣减） |
| 认证 | JWT（jjwt）+ BCrypt |
| 构建 | Maven |

## 快速启动

```bash
# 1. 准备 MySQL（8.x）与 Redis（7.x）
# 2. 建库
#    CREATE DATABASE campus_market DEFAULT CHARSET utf8mb4;
# 3. 复制本机私密配置
#    cp src/main/resources/application-local.yml.example src/main/resources/application-local.yml
#    填入你自己的数据库密码与 Redis 地址（该文件不会提交）
# 4. 启动
mvn spring-boot:run
```

## 开发中

项目正在开发阶段，功能清单与接口文档将随进度补充。

- [x] 工程骨架
- [ ] 用户注册 / 登录（JWT）
- [ ] 商品发布 / 检索
- [ ] 订单与秒杀
- [ ] 压测报告
