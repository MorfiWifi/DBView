
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/13/2017 18:32:39
-- Generated from EDMX file: C:\Users\amir\Documents\Visual Studio 2015\Projects\se_DesignFirst_1\se_DesignFirst_1\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [se_DesignFirst_1];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_UserIncomingCall]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[IncomingCalls] DROP CONSTRAINT [FK_UserIncomingCall];
GO
IF OBJECT_ID(N'[dbo].[FK_UserCustomer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Customers] DROP CONSTRAINT [FK_UserCustomer];
GO
IF OBJECT_ID(N'[dbo].[FK_UserContract]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Contracts] DROP CONSTRAINT [FK_UserContract];
GO
IF OBJECT_ID(N'[dbo].[FK_UserGood]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Goods] DROP CONSTRAINT [FK_UserGood];
GO
IF OBJECT_ID(N'[dbo].[FK_CustomerSign]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Signs] DROP CONSTRAINT [FK_CustomerSign];
GO
IF OBJECT_ID(N'[dbo].[FK_ContractSign]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Signs] DROP CONSTRAINT [FK_ContractSign];
GO
IF OBJECT_ID(N'[dbo].[FK_ContractGood_Contract]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ContractGood] DROP CONSTRAINT [FK_ContractGood_Contract];
GO
IF OBJECT_ID(N'[dbo].[FK_ContractGood_Good]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ContractGood] DROP CONSTRAINT [FK_ContractGood_Good];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Goods]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Goods];
GO
IF OBJECT_ID(N'[dbo].[Customers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Customers];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO
IF OBJECT_ID(N'[dbo].[Contracts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Contracts];
GO
IF OBJECT_ID(N'[dbo].[IncomingCalls]', 'U') IS NOT NULL
    DROP TABLE [dbo].[IncomingCalls];
GO
IF OBJECT_ID(N'[dbo].[Signs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Signs];
GO
IF OBJECT_ID(N'[dbo].[ContractGood]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ContractGood];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Goods'
CREATE TABLE [dbo].[Goods] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Price] int  NOT NULL,
    [UserId] int  NOT NULL
);
GO

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [UserId] int  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [UserName] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [Role] int  NOT NULL,
    [Salary] int  NOT NULL
);
GO

-- Creating table 'Contracts'
CREATE TABLE [dbo].[Contracts] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Content] nvarchar(max)  NOT NULL,
    [UserId] int  NOT NULL,
    [Worth] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'IncomingCalls'
CREATE TABLE [dbo].[IncomingCalls] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Message] nvarchar(max)  NOT NULL,
    [Date] nvarchar(max)  NOT NULL,
    [UserId] int  NOT NULL
);
GO

-- Creating table 'Signs'
CREATE TABLE [dbo].[Signs] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Date] datetime  NOT NULL,
    [IsSuccessfull] nvarchar(max)  NOT NULL,
    [CustomerId] int  NOT NULL,
    [ContractId] int  NOT NULL
);
GO

-- Creating table 'ContractGood'
CREATE TABLE [dbo].[ContractGood] (
    [Contracts_Id] int  NOT NULL,
    [Goods_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Goods'
ALTER TABLE [dbo].[Goods]
ADD CONSTRAINT [PK_Goods]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Contracts'
ALTER TABLE [dbo].[Contracts]
ADD CONSTRAINT [PK_Contracts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'IncomingCalls'
ALTER TABLE [dbo].[IncomingCalls]
ADD CONSTRAINT [PK_IncomingCalls]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Signs'
ALTER TABLE [dbo].[Signs]
ADD CONSTRAINT [PK_Signs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Contracts_Id], [Goods_Id] in table 'ContractGood'
ALTER TABLE [dbo].[ContractGood]
ADD CONSTRAINT [PK_ContractGood]
    PRIMARY KEY CLUSTERED ([Contracts_Id], [Goods_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserId] in table 'IncomingCalls'
ALTER TABLE [dbo].[IncomingCalls]
ADD CONSTRAINT [FK_UserIncomingCall]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserIncomingCall'
CREATE INDEX [IX_FK_UserIncomingCall]
ON [dbo].[IncomingCalls]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [FK_UserCustomer]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserCustomer'
CREATE INDEX [IX_FK_UserCustomer]
ON [dbo].[Customers]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'Contracts'
ALTER TABLE [dbo].[Contracts]
ADD CONSTRAINT [FK_UserContract]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserContract'
CREATE INDEX [IX_FK_UserContract]
ON [dbo].[Contracts]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'Goods'
ALTER TABLE [dbo].[Goods]
ADD CONSTRAINT [FK_UserGood]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserGood'
CREATE INDEX [IX_FK_UserGood]
ON [dbo].[Goods]
    ([UserId]);
GO

-- Creating foreign key on [CustomerId] in table 'Signs'
ALTER TABLE [dbo].[Signs]
ADD CONSTRAINT [FK_CustomerSign]
    FOREIGN KEY ([CustomerId])
    REFERENCES [dbo].[Customers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerSign'
CREATE INDEX [IX_FK_CustomerSign]
ON [dbo].[Signs]
    ([CustomerId]);
GO

-- Creating foreign key on [ContractId] in table 'Signs'
ALTER TABLE [dbo].[Signs]
ADD CONSTRAINT [FK_ContractSign]
    FOREIGN KEY ([ContractId])
    REFERENCES [dbo].[Contracts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ContractSign'
CREATE INDEX [IX_FK_ContractSign]
ON [dbo].[Signs]
    ([ContractId]);
GO

-- Creating foreign key on [Contracts_Id] in table 'ContractGood'
ALTER TABLE [dbo].[ContractGood]
ADD CONSTRAINT [FK_ContractGood_Contract]
    FOREIGN KEY ([Contracts_Id])
    REFERENCES [dbo].[Contracts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Goods_Id] in table 'ContractGood'
ALTER TABLE [dbo].[ContractGood]
ADD CONSTRAINT [FK_ContractGood_Good]
    FOREIGN KEY ([Goods_Id])
    REFERENCES [dbo].[Goods]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ContractGood_Good'
CREATE INDEX [IX_FK_ContractGood_Good]
ON [dbo].[ContractGood]
    ([Goods_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------