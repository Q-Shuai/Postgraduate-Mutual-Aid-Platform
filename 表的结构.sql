-- -----------------------------------------------------
-- Database: kaoyan_platform (考研互助平台)
-- Character Set: utf8mb4
-- -----------------------------------------------------
-- 假设使用 MySQL 数据库，使用 InnoDB 引擎，utf8mb4 字符集
-- 在实际使用中，请根据您的数据库系统和需求进行调整
-- -----------------------------------------------------

-- 1. 考生表 (student) 
CREATE TABLE student (
    id BIGINT(20) NOT NULL PRIMARY KEY COMMENT '主键id',
    user_name VARCHAR(50) NOT NULL COMMENT '考生用户名',
    account VARCHAR(50) NOT NULL COMMENT '考生账号',
    password VARCHAR(200) NOT NULL COMMENT '考生密码',
    avatar VARCHAR(255) NULL COMMENT '考生用户头像地址',
    gender CHAR(10) NULL COMMENT '性别',
    major VARCHAR(20) NULL COMMENT '考生专业名称',
    email VARCHAR(50) NULL COMMENT '考生邮箱地址',
    phone VARCHAR(50) NOT NULL COMMENT '考生手机号码',
    money DECIMAL(8, 2) NULL COMMENT '考生用户余额',
    created_time DATETIME NOT NULL COMMENT '考生用户创建时间',
    admin_id BIGINT(20) NOT NULL COMMENT '管理者id (外键)',
    status CHAR(1) NULL COMMENT '账号状态（0禁用1正常）',
    del_flag CHAR(1) NOT NULL COMMENT '数据有效性(0无效1有效)'
);

-- 2. 管理员表 (admin) 
CREATE TABLE admin (
    id BIGINT(20) NOT NULL PRIMARY KEY COMMENT '主键id',
    user_name VARCHAR(50) NOT NULL COMMENT '管理员用户名',
    account VARCHAR(30) NOT NULL COMMENT '管理员账号',
    password VARCHAR(200) NOT NULL COMMENT '管理员密码',
    avatar VARCHAR(255) NULL COMMENT '管理员用户头像地址',
    gender CHAR(10) NULL COMMENT '性别',
    email VARCHAR(50) NOT NULL COMMENT '管理员邮箱地址',
    phone VARCHAR(50) NOT NULL COMMENT '管理员手机号码',
    created_time DATETIME NOT NULL COMMENT '管理员账号创建时间',
    status CHAR(1) NOT NULL COMMENT '账号状态（0禁用1正常）',
    del_flag CHAR(1) NOT NULL COMMENT '数据有效性(0无效1有效)'
);

-- 3. 教师表 (teacher) 
CREATE TABLE teacher (
    id BIGINT(20) NOT NULL PRIMARY KEY COMMENT '主键id',
    user_name VARCHAR(50) NOT NULL COMMENT '教师用户名',
    account VARCHAR(30) NOT NULL COMMENT '教师账号',
    password VARCHAR(200) NOT NULL COMMENT '教师密码',
    avatar VARCHAR(255) NULL COMMENT '教师用户头像地址',
    gender CHAR(10) NULL COMMENT '性别',
    position VARCHAR(10) NULL COMMENT '教师职位',
    email VARCHAR(50) NOT NULL COMMENT '教师邮箱地址',
    phone VARCHAR(50) NOT NULL COMMENT '教师手机号码',
    money DECIMAL(8, 2) NULL COMMENT '教师用户余额',
    created_time DATETIME NOT NULL COMMENT '教师用户创建时间',
    admin_id BIGINT(20) NOT NULL COMMENT '管理者id (外键)',
    status CHAR(1) NOT NULL COMMENT '账号状态（0禁用1正常）',
    del_flag CHAR(1) NOT NULL COMMENT '数据有效性(0无效1有效)'
);

-- 4. 资讯表 (information) 
CREATE TABLE information (
    id BIGINT(20) NOT NULL PRIMARY KEY COMMENT '主键id',
    title VARCHAR(50) NOT NULL COMMENT '资讯标题',
    category_name VARCHAR(10) NULL COMMENT '类型名称',
    picture VARCHAR(255) NULL COMMENT '资讯封面图片地址',
    content LONGTEXT NULL COMMENT '资讯内容',
    click_num INT(11) NULL DEFAULT 0 COMMENT '点击量',
    created_by BIGINT(20) NOT NULL COMMENT '创建人id (外键)',
    created_time DATETIME NOT NULL COMMENT '创建时间',
    updated_by BIGINT(20) NULL COMMENT '修改人id (外键)',
    updated_time DATETIME NULL COMMENT '修改时间',
    status CHAR(1) NOT NULL COMMENT '状态（1正常 0禁用 ）',
    del_flag CHAR(1) NOT NULL COMMENT '数据有效性(0无效1有效)',
    publish_time DATETIME NULL COMMENT '发布时间'
);

-- 5. 论坛帖子表 (forum) 
CREATE TABLE forum (
    id BIGINT(20) NOT NULL PRIMARY KEY COMMENT '主键id',
    user_name VARCHAR(50) NOT NULL COMMENT '发帖用户名称',
    title VARCHAR(20) NOT NULL COMMENT '帖子标题',
    content LONGTEXT NULL COMMENT '帖子内容',
    parent_id BIGINT(20) NULL COMMENT '父节点id',
    status CHAR(1) NOT NULL COMMENT '状态（1展示 0禁用）',
    created_by BIGINT(20) NOT NULL COMMENT '创建人id (外键)',
    created_time DATETIME NOT NULL COMMENT '创建时间',
    del_flag CHAR(1) NOT NULL COMMENT '数据有效性(0无效1有效)',
    is_done VARCHAR(10) NOT NULL COMMENT '是否公开'
);

-- 6. 资料表 (material) 
CREATE TABLE material (
    id BIGINT(20) NOT NULL PRIMARY KEY COMMENT '主键id',
    title VARCHAR(50) NOT NULL COMMENT '资料标题',
    category_name VARCHAR(10) NULL COMMENT '资料类型名称',
    picture VARCHAR(255) NULL COMMENT '资料封面图片地址',
    content VARCHAR(255) NULL COMMENT '资料内容', -- 资料内容字段长度似乎过短，可能指存储链接/路径。
    down_num INT(11) NULL DEFAULT 0 COMMENT '下载量',
    price DECIMAL(8, 2) NULL COMMENT '资料价格',
    introduction VARCHAR(250) NULL COMMENT '资料简介',
    created_by BIGINT(20) NOT NULL COMMENT '创建人id (外键)',
    created_time DATETIME NOT NULL COMMENT '创建时间',
    status CHAR(10) NOT NULL COMMENT '审核状态(通过 不通过）',
    del_flag CHAR(1) NOT NULL COMMENT '数据有效性(0无效1有效)',
    result VARCHAR(200) NULL COMMENT '审核消息'
);

-- 7. 经验贴表 (experience) 
CREATE TABLE experience (
    id BIGINT(20) NOT NULL PRIMARY KEY COMMENT '主键id',
    title VARCHAR(50) NOT NULL COMMENT '经验贴标题',
    category_name VARCHAR(10) NULL COMMENT '经验贴类型名称',
    picture VARCHAR(255) NULL COMMENT '封面图片地址',
    content LONGTEXT NULL COMMENT '经验贴内容',
    store_num INT(11) NULL DEFAULT 0 COMMENT '收藏量',
    click_num INT(11) NULL DEFAULT 0 COMMENT '访问量',
    created_by BIGINT(20) NOT NULL COMMENT '创建人id (外键)',
    created_time DATETIME NOT NULL COMMENT '创建时间',
    publish_time DATETIME NOT NULL COMMENT '发布日期',
    status CHAR(10) NOT NULL COMMENT '审核状态(通过 不通过 未审核)',
    del_flag CHAR(1) NOT NULL COMMENT '数据有效性(0无效1有效)',
    result VARCHAR(200) NULL COMMENT '审核消息'
);

-- 8. 商品表 (commodity) 
CREATE TABLE commodity (
    id BIGINT(20) NOT NULL PRIMARY KEY COMMENT '主键id',
    name VARCHAR(50) NOT NULL COMMENT '商品名称',
    category_name VARCHAR(10) NULL COMMENT '商品类型名称',
    picture VARCHAR(255) NULL COMMENT '商品图片地址',
    price DECIMAL(8, 2) NULL COMMENT '商品价格',
    introduction VARCHAR(250) NULL COMMENT '商品介绍',
    created_by BIGINT(20) NOT NULL COMMENT '归属人id (外键)',
    created_time DATETIME NOT NULL COMMENT '发布时间',
    status CHAR(10) NOT NULL COMMENT '审核状态（通过 不通过 未审核 已购买 已下架）',
    del_flag CHAR(1) NOT NULL COMMENT '数据有效性(0无效1有效)'
);

-- 9. 订单表 (order) 
CREATE TABLE `order` ( -- 订单表名使用反引号以避免与SQL保留字冲突
    id BIGINT(20) NOT NULL PRIMARY KEY COMMENT '主键id',
    order_id BIGINT(20) NOT NULL COMMENT '订单编号',
    user_id BIGINT(20) NOT NULL COMMENT '收件人id (外键)',
    user_name VARCHAR(20) NOT NULL COMMENT '收件人姓名',
    phone VARCHAR(20) NOT NULL COMMENT '收件人联系电话',
    good_id BIGINT(20) NOT NULL COMMENT '商品编号 (外键)',
    good_name VARCHAR(20) NOT NULL COMMENT '商品名称',
    picture VARCHAR(255) NULL COMMENT '商品图片',
    total_price DECIMAL(8, 2) NOT NULL COMMENT '订单金额',
    quantity INT(11) NOT NULL COMMENT '购买数量',
    created_time DATETIME NOT NULL COMMENT '创建时间',
    detail_address VARCHAR(50) NOT NULL COMMENT '详细地址',
    del_flag CHAR(1) NOT NULL COMMENT '数据有效性(0无效1有效)',
    table_name VARCHAR(10) NOT NULL COMMENT '表名',
    status VARCHAR(10) NOT NULL COMMENT '订单状态(已支付 已发货 已完成)',
    price DECIMAL(8, 2) NOT NULL COMMENT '单价',
    link VARCHAR(250) NULL COMMENT '发货链接'
);

-- 10. 购物车表 (cart) 
CREATE TABLE cart (
    id BIGINT(20) NOT NULL PRIMARY KEY COMMENT '主键id',
    user_id BIGINT(20) NOT NULL COMMENT '用户id (外键)',
    good_id BIGINT(20) NOT NULL COMMENT '商品id (外键)',
    good_name VARCHAR(50) NOT NULL COMMENT '商品名称',
    picture VARCHAR(255) NULL COMMENT '商品图片',
    quantity INT(11) NOT NULL COMMENT '购买数量',
    created_time DATETIME NOT NULL COMMENT '创建时间',
    price DECIMAL(8, 2) NULL COMMENT '总金额',
    del_flag CHAR(1) NOT NULL COMMENT '数据有效性(0无效 1有效)',
    table_name VARCHAR(50) NOT NULL COMMENT '表名'
);

-- 11. 地址表 (address) 
CREATE TABLE address (
    id BIGINT(20) NOT NULL PRIMARY KEY COMMENT '主键id',
    user_id BIGINT(20) NOT NULL COMMENT '收件人id (外键)',
    user_name VARCHAR(20) NOT NULL COMMENT '收件人姓名',
    user_phone VARCHAR(20) NOT NULL COMMENT '收件人联系电话',
    is_default CHAR(1) NOT NULL COMMENT '是否为默认地址(0否1是)',
    created_time DATETIME NOT NULL COMMENT '创建时间',
    detail_address VARCHAR(150) NULL COMMENT '详细地址',
    del_flag CHAR(1) NOT NULL COMMENT '数据有效性(0无效1有效)'
);

-- 12. 收藏表 (store) 
CREATE TABLE store (
    id BIGINT(20) NOT NULL PRIMARY KEY COMMENT '主键id',
    title VARCHAR(50) NOT NULL COMMENT '收藏的标题',
    refid BIGINT(20) NOT NULL COMMENT '收藏的id (外键)',
    picture VARCHAR(255) NULL COMMENT '封面图片地址',
    created_by BIGINT(20) NOT NULL COMMENT '收藏人id (外键)',
    created_time DATETIME NOT NULL COMMENT '收藏时间',
    del_flag CHAR(1) NOT NULL COMMENT '数据有效性(0无效1有效)',
    table_name VARCHAR(200) NOT NULL COMMENT '表名'
);

-- 13. 评论表 (comment) 
CREATE TABLE comment (
    id BIGINT(20) NOT NULL PRIMARY KEY COMMENT '主键id',
    refid BIGINT(20) NOT NULL COMMENT '关联表id',
    created_by BIGINT(20) NOT NULL COMMENT '评论人id (外键)',
    created_time DATETIME NOT NULL COMMENT '评论时间',
    content VARCHAR(255) NULL COMMENT '评论内容',
    del_flag CHAR(1) NOT NULL COMMENT '数据有效性(0无效1有效)'
);

-- 14. 分类表 (category) 
CREATE TABLE category (
    id BIGINT(20) NOT NULL PRIMARY KEY COMMENT '主键id',
    description VARCHAR(200) NOT NULL COMMENT '分类描述',
    category_name VARCHAR(200) NOT NULL COMMENT '分类名称',
    created_time DATETIME NOT NULL COMMENT '创建时间',
    status VARCHAR(10) NOT NULL COMMENT '分类状态（正常 禁用）',
    del_flag CHAR(1) NOT NULL COMMENT '数据有效性(0无效1有效)'
);