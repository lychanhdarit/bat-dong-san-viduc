
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/28/2018 09:29:24
-- Generated from EDMX file: D:\DEV\WebDEV\WebDEV\Areas\admincp\Models\Models.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Data];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_news_news_category]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[news] DROP CONSTRAINT [FK_news_news_category];
GO
IF OBJECT_ID(N'[dbo].[FK_picture_picture_group]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[picture] DROP CONSTRAINT [FK_picture_picture_group];
GO
IF OBJECT_ID(N'[dbo].[FK_product_product_category]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[product] DROP CONSTRAINT [FK_product_product_category];
GO
IF OBJECT_ID(N'[dbo].[FK_user_member_user_group]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[user_member] DROP CONSTRAINT [FK_user_member_user_group];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[news]', 'U') IS NOT NULL
    DROP TABLE [dbo].[news];
GO
IF OBJECT_ID(N'[dbo].[news_category]', 'U') IS NOT NULL
    DROP TABLE [dbo].[news_category];
GO
IF OBJECT_ID(N'[dbo].[picture]', 'U') IS NOT NULL
    DROP TABLE [dbo].[picture];
GO
IF OBJECT_ID(N'[dbo].[picture_group]', 'U') IS NOT NULL
    DROP TABLE [dbo].[picture_group];
GO
IF OBJECT_ID(N'[dbo].[product]', 'U') IS NOT NULL
    DROP TABLE [dbo].[product];
GO
IF OBJECT_ID(N'[dbo].[product_category]', 'U') IS NOT NULL
    DROP TABLE [dbo].[product_category];
GO
IF OBJECT_ID(N'[dbo].[product_picture]', 'U') IS NOT NULL
    DROP TABLE [dbo].[product_picture];
GO
IF OBJECT_ID(N'[dbo].[router_config]', 'U') IS NOT NULL
    DROP TABLE [dbo].[router_config];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[user_group]', 'U') IS NOT NULL
    DROP TABLE [dbo].[user_group];
GO
IF OBJECT_ID(N'[dbo].[user_member]', 'U') IS NOT NULL
    DROP TABLE [dbo].[user_member];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'news'
CREATE TABLE [dbo].[news] (
    [id] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(550)  NULL,
    [desciption] nvarchar(max)  NULL,
    [content1] nvarchar(max)  NULL,
    [content2] nvarchar(max)  NULL,
    [content3] nvarchar(max)  NULL,
    [content4] nvarchar(max)  NULL,
    [content5] nvarchar(max)  NULL,
    [meta_title] nvarchar(550)  NULL,
    [meta_description] nvarchar(max)  NULL,
    [meta_keywords] nvarchar(550)  NULL,
    [images] nvarchar(50)  NULL,
    [datecreate] nvarchar(50)  NULL,
    [dateend] nvarchar(50)  NOT NULL,
    [dateedit] nvarchar(50)  NULL,
    [usercreate] int  NULL,
    [useredit] int  NULL,
    [actived] bit  NULL,
    [deleted] bit  NULL,
    [parent] int  NULL,
    [tags] nvarchar(550)  NULL,
    [views] int  NULL,
    [rating] int  NULL,
    [code] nvarchar(50)  NULL,
    [url] nvarchar(550)  NULL,
    [price] nvarchar(50)  NULL,
    [quantity] int  NULL
);
GO

-- Creating table 'news_category'
CREATE TABLE [dbo].[news_category] (
    [id] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(550)  NULL,
    [desciption] nvarchar(max)  NULL,
    [content1] nvarchar(max)  NULL,
    [content2] nvarchar(max)  NULL,
    [content3] nvarchar(max)  NULL,
    [content4] nvarchar(max)  NULL,
    [content5] nvarchar(max)  NULL,
    [meta_title] nvarchar(550)  NULL,
    [meta_description] nvarchar(max)  NULL,
    [meta_keywords] nvarchar(550)  NULL,
    [images] nvarchar(50)  NULL,
    [datecreate] nvarchar(50)  NULL,
    [dateedit] nvarchar(50)  NULL,
    [usercreate] int  NULL,
    [useredit] int  NULL,
    [actived] bit  NULL,
    [deleted] bit  NULL,
    [parent] int  NULL,
    [tags] nvarchar(550)  NULL,
    [views] int  NULL,
    [rating] int  NULL,
    [code] nvarchar(50)  NULL,
    [url] nvarchar(550)  NULL,
    [price] nvarchar(50)  NULL,
    [quantity] int  NULL
);
GO

-- Creating table 'pictures'
CREATE TABLE [dbo].[pictures] (
    [id] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(550)  NULL,
    [filename] nvarchar(550)  NULL,
    [group_picture] int  NULL,
    [active] bit  NULL,
    [note] nvarchar(550)  NULL
);
GO

-- Creating table 'picture_group'
CREATE TABLE [dbo].[picture_group] (
    [id] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(550)  NULL,
    [active] bit  NULL,
    [note] nvarchar(550)  NULL
);
GO

-- Creating table 'products'
CREATE TABLE [dbo].[products] (
    [id] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(550)  NULL,
    [desciption] nvarchar(max)  NULL,
    [content1] nvarchar(max)  NULL,
    [content2] nvarchar(max)  NULL,
    [content3] nvarchar(max)  NULL,
    [content4] nvarchar(max)  NULL,
    [content5] nvarchar(max)  NULL,
    [meta_title] nvarchar(550)  NULL,
    [meta_description] nvarchar(max)  NULL,
    [meta_keywords] nvarchar(550)  NULL,
    [images] nvarchar(50)  NULL,
    [datecreate] nvarchar(50)  NULL,
    [dateedit] nvarchar(50)  NULL,
    [usercreate] int  NULL,
    [dateend] nvarchar(50)  NULL,
    [useredit] int  NULL,
    [actived] bit  NULL,
    [deleted] bit  NULL,
    [parent] int  NULL,
    [tags] nvarchar(550)  NULL,
    [views] int  NULL,
    [rating] int  NULL,
    [code] nvarchar(50)  NULL,
    [url] nvarchar(550)  NULL,
    [price] nvarchar(50)  NULL,
    [quantity] int  NULL
);
GO

-- Creating table 'product_category'
CREATE TABLE [dbo].[product_category] (
    [id] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(550)  NULL,
    [desciption] nvarchar(max)  NULL,
    [content1] nvarchar(max)  NULL,
    [content2] nvarchar(max)  NULL,
    [content3] nvarchar(max)  NULL,
    [content4] nvarchar(max)  NULL,
    [content5] nvarchar(max)  NULL,
    [meta_title] nvarchar(550)  NULL,
    [meta_description] nvarchar(max)  NULL,
    [meta_keywords] nvarchar(550)  NULL,
    [images] nvarchar(50)  NULL,
    [datecreate] nvarchar(50)  NULL,
    [dateedit] nvarchar(50)  NULL,
    [usercreate] int  NULL,
    [useredit] int  NULL,
    [actived] bit  NULL,
    [deleted] bit  NULL,
    [parent] int  NULL,
    [tags] nvarchar(550)  NULL,
    [views] int  NULL,
    [rating] int  NULL,
    [code] nvarchar(50)  NULL,
    [url] nvarchar(550)  NULL,
    [price] nvarchar(50)  NULL,
    [quantity] int  NULL
);
GO

-- Creating table 'product_picture'
CREATE TABLE [dbo].[product_picture] (
    [id] int IDENTITY(1,1) NOT NULL,
    [id_product] int  NULL,
    [filename] nvarchar(550)  NULL,
    [title] nvarchar(max)  NULL,
    [active] bit  NULL
);
GO

-- Creating table 'router_config'
CREATE TABLE [dbo].[router_config] (
    [id] int IDENTITY(1,1) NOT NULL,
    [url] nvarchar(500)  NULL,
    [controller] nvarchar(500)  NULL,
    [action] nvarchar(500)  NULL,
    [itemId] nvarchar(500)  NULL,
    [actived] bit  NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'user_group'
CREATE TABLE [dbo].[user_group] (
    [id] int IDENTITY(1,1) NOT NULL,
    [name] int  NULL,
    [active] bit  NULL,
    [permission] nvarchar(max)  NULL
);
GO

-- Creating table 'user_member'
CREATE TABLE [dbo].[user_member] (
    [id] int IDENTITY(1,1) NOT NULL,
    [username] nvarchar(550)  NOT NULL,
    [password_user] nvarchar(max)  NULL,
    [fullname] nvarchar(550)  NULL,
    [email] nvarchar(50)  NULL,
    [phone] nvarchar(50)  NULL,
    [address] nvarchar(550)  NULL,
    [birthday] nvarchar(50)  NULL,
    [active] bit  NULL,
    [group_user] int  NULL,
    [datecreate] nvarchar(50)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [id] in table 'news'
ALTER TABLE [dbo].[news]
ADD CONSTRAINT [PK_news]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'news_category'
ALTER TABLE [dbo].[news_category]
ADD CONSTRAINT [PK_news_category]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'pictures'
ALTER TABLE [dbo].[pictures]
ADD CONSTRAINT [PK_pictures]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'picture_group'
ALTER TABLE [dbo].[picture_group]
ADD CONSTRAINT [PK_picture_group]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'products'
ALTER TABLE [dbo].[products]
ADD CONSTRAINT [PK_products]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'product_category'
ALTER TABLE [dbo].[product_category]
ADD CONSTRAINT [PK_product_category]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'product_picture'
ALTER TABLE [dbo].[product_picture]
ADD CONSTRAINT [PK_product_picture]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'router_config'
ALTER TABLE [dbo].[router_config]
ADD CONSTRAINT [PK_router_config]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [id] in table 'user_group'
ALTER TABLE [dbo].[user_group]
ADD CONSTRAINT [PK_user_group]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'user_member'
ALTER TABLE [dbo].[user_member]
ADD CONSTRAINT [PK_user_member]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [parent] in table 'news'
ALTER TABLE [dbo].[news]
ADD CONSTRAINT [FK_news_news_category]
    FOREIGN KEY ([parent])
    REFERENCES [dbo].[news_category]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_news_news_category'
CREATE INDEX [IX_FK_news_news_category]
ON [dbo].[news]
    ([parent]);
GO

-- Creating foreign key on [group_picture] in table 'pictures'
ALTER TABLE [dbo].[pictures]
ADD CONSTRAINT [FK_picture_picture_group]
    FOREIGN KEY ([group_picture])
    REFERENCES [dbo].[picture_group]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_picture_picture_group'
CREATE INDEX [IX_FK_picture_picture_group]
ON [dbo].[pictures]
    ([group_picture]);
GO

-- Creating foreign key on [parent] in table 'products'
ALTER TABLE [dbo].[products]
ADD CONSTRAINT [FK_product_product_category]
    FOREIGN KEY ([parent])
    REFERENCES [dbo].[product_category]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_product_product_category'
CREATE INDEX [IX_FK_product_product_category]
ON [dbo].[products]
    ([parent]);
GO

-- Creating foreign key on [group_user] in table 'user_member'
ALTER TABLE [dbo].[user_member]
ADD CONSTRAINT [FK_user_member_user_group]
    FOREIGN KEY ([group_user])
    REFERENCES [dbo].[user_group]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_user_member_user_group'
CREATE INDEX [IX_FK_user_member_user_group]
ON [dbo].[user_member]
    ([group_user]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------