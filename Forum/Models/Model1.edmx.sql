
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 06/28/2018 02:47:53
-- Generated from EDMX file: C:\Users\emily\Desktop\Forum\Forum\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [MyForum];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Album_ToMember]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Album] DROP CONSTRAINT [FK_Album_ToMember];
GO
IF OBJECT_ID(N'[dbo].[FK_Article_ToMember]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Article] DROP CONSTRAINT [FK_Article_ToMember];
GO
IF OBJECT_ID(N'[dbo].[FK_Message_ToArticle]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Message] DROP CONSTRAINT [FK_Message_ToArticle];
GO
IF OBJECT_ID(N'[dbo].[FK_Message_ToMember]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Message] DROP CONSTRAINT [FK_Message_ToMember];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Album]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Album];
GO
IF OBJECT_ID(N'[dbo].[Article]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Article];
GO
IF OBJECT_ID(N'[dbo].[Book]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Book];
GO
IF OBJECT_ID(N'[dbo].[Member]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Member];
GO
IF OBJECT_ID(N'[dbo].[Message]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Message];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Album'
CREATE TABLE [dbo].[Album] (
    [Alb_Id] int IDENTITY(1,1) NOT NULL,
    [FileName] nvarchar(50)  NOT NULL,
    [Url] nvarchar(max)  NOT NULL,
    [Size] int  NOT NULL,
    [Type] varchar(100)  NOT NULL,
    [Account] varchar(30)  NOT NULL,
    [CreateTime] datetime  NOT NULL
);
GO

-- Creating table 'Article'
CREATE TABLE [dbo].[Article] (
    [A_Id] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(50)  NOT NULL,
    [Content] nvarchar(max)  NOT NULL,
    [Account] varchar(30)  NOT NULL,
    [CreateTime] datetime  NOT NULL,
    [Watch] int  NOT NULL
);
GO

-- Creating table 'Member'
CREATE TABLE [dbo].[Member] (
    [Account] varchar(30)  NOT NULL,
    [Password] varchar(50)  NOT NULL,
    [Name] nvarchar(20)  NOT NULL,
    [Email] varchar(200)  NOT NULL,
    [AuthCode] nchar(10)  NOT NULL,
    [IsAdmin] bit  NOT NULL
);
GO

-- Creating table 'Message'
CREATE TABLE [dbo].[Message] (
    [M_Id] int IDENTITY(1,1) NOT NULL,
    [A_Id] int  NOT NULL,
    [Account] varchar(30)  NOT NULL,
    [Content] nvarchar(100)  NOT NULL,
    [CreateTime] datetime  NOT NULL
);
GO

-- Creating table 'Book'
CREATE TABLE [dbo].[Book] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(50)  NOT NULL,
    [author] nvarchar(50)  NOT NULL,
    [time] datetime  NOT NULL,
    [MemberAccount] varchar(30)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Alb_Id] in table 'Album'
ALTER TABLE [dbo].[Album]
ADD CONSTRAINT [PK_Album]
    PRIMARY KEY CLUSTERED ([Alb_Id] ASC);
GO

-- Creating primary key on [A_Id] in table 'Article'
ALTER TABLE [dbo].[Article]
ADD CONSTRAINT [PK_Article]
    PRIMARY KEY CLUSTERED ([A_Id] ASC);
GO

-- Creating primary key on [Account] in table 'Member'
ALTER TABLE [dbo].[Member]
ADD CONSTRAINT [PK_Member]
    PRIMARY KEY CLUSTERED ([Account] ASC);
GO

-- Creating primary key on [M_Id] in table 'Message'
ALTER TABLE [dbo].[Message]
ADD CONSTRAINT [PK_Message]
    PRIMARY KEY CLUSTERED ([M_Id] ASC);
GO

-- Creating primary key on [Id] in table 'Book'
ALTER TABLE [dbo].[Book]
ADD CONSTRAINT [PK_Book]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Account] in table 'Album'
ALTER TABLE [dbo].[Album]
ADD CONSTRAINT [FK_Album_ToMember]
    FOREIGN KEY ([Account])
    REFERENCES [dbo].[Member]
        ([Account])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Album_ToMember'
CREATE INDEX [IX_FK_Album_ToMember]
ON [dbo].[Album]
    ([Account]);
GO

-- Creating foreign key on [Account] in table 'Article'
ALTER TABLE [dbo].[Article]
ADD CONSTRAINT [FK_Article_ToMember]
    FOREIGN KEY ([Account])
    REFERENCES [dbo].[Member]
        ([Account])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Article_ToMember'
CREATE INDEX [IX_FK_Article_ToMember]
ON [dbo].[Article]
    ([Account]);
GO

-- Creating foreign key on [A_Id] in table 'Message'
ALTER TABLE [dbo].[Message]
ADD CONSTRAINT [FK_Message_ToArticle]
    FOREIGN KEY ([A_Id])
    REFERENCES [dbo].[Article]
        ([A_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Message_ToArticle'
CREATE INDEX [IX_FK_Message_ToArticle]
ON [dbo].[Message]
    ([A_Id]);
GO

-- Creating foreign key on [Account] in table 'Message'
ALTER TABLE [dbo].[Message]
ADD CONSTRAINT [FK_Message_ToMember]
    FOREIGN KEY ([Account])
    REFERENCES [dbo].[Member]
        ([Account])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Message_ToMember'
CREATE INDEX [IX_FK_Message_ToMember]
ON [dbo].[Message]
    ([Account]);
GO

-- Creating foreign key on [MemberAccount] in table 'Book'
ALTER TABLE [dbo].[Book]
ADD CONSTRAINT [FK_BookMember]
    FOREIGN KEY ([MemberAccount])
    REFERENCES [dbo].[Member]
        ([Account])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BookMember'
CREATE INDEX [IX_FK_BookMember]
ON [dbo].[Book]
    ([MemberAccount]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------