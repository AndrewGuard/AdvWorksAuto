﻿SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
PRINT N'Dropping extended properties'
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', NULL, NULL
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'COLUMN', N'CompanyName'
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'COLUMN', N'CustomerID'
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'COLUMN', N'EmailAddress'
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'COLUMN', N'FirstName'
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'COLUMN', N'LastName'
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'COLUMN', N'MiddleName'
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'COLUMN', N'ModifiedDate'
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'COLUMN', N'NameStyle'
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'COLUMN', N'PasswordHash'
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'COLUMN', N'Phone'
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'COLUMN', N'rowguid'
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'COLUMN', N'SalesPerson'
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'COLUMN', N'Suffix'
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'COLUMN', N'Title'
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'CONSTRAINT', N'AK_Customer_rowguid'
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'CONSTRAINT', N'DF_Customer_ModifiedDate'
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'CONSTRAINT', N'DF_Customer_NameStyle'
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'CONSTRAINT', N'DF_Customer_rowguid'
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'CONSTRAINT', N'PK_Customer_CustomerID'
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'INDEX', N'IX_Customer_EmailAddress'
GO
EXEC sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'INDEX', N'PK_Customer_CustomerID'
GO
PRINT N'Dropping foreign keys from [SalesLT].[CustomerAddress]'
GO
ALTER TABLE [SalesLT].[CustomerAddress] DROP CONSTRAINT [FK_CustomerAddress_Customer_CustomerID]
GO
PRINT N'Dropping foreign keys from [SalesLT].[SalesOrderHeader]'
GO
ALTER TABLE [SalesLT].[SalesOrderHeader] DROP CONSTRAINT [FK_SalesOrderHeader_Customer_CustomerID]
GO
PRINT N'Dropping constraints from [SalesLT].[Customer]'
GO
ALTER TABLE [SalesLT].[Customer] DROP CONSTRAINT [PK_Customer_CustomerID]
GO
PRINT N'Dropping constraints from [SalesLT].[Customer]'
GO
ALTER TABLE [SalesLT].[Customer] DROP CONSTRAINT [AK_Customer_rowguid]
GO
PRINT N'Dropping constraints from [SalesLT].[Customer]'
GO
ALTER TABLE [SalesLT].[Customer] DROP CONSTRAINT [DF_Customer_NameStyle]
GO
PRINT N'Dropping constraints from [SalesLT].[Customer]'
GO
ALTER TABLE [SalesLT].[Customer] DROP CONSTRAINT [DF_Customer_rowguid]
GO
PRINT N'Dropping constraints from [SalesLT].[Customer]'
GO
ALTER TABLE [SalesLT].[Customer] DROP CONSTRAINT [DF_Customer_ModifiedDate]
GO
PRINT N'Dropping index [IX_Customer_EmailAddress] from [SalesLT].[Customer]'
GO
DROP INDEX [IX_Customer_EmailAddress] ON [SalesLT].[Customer]
GO
PRINT N'Rebuilding [SalesLT].[Customer]'
GO
CREATE TABLE [SalesLT].[RG_Recovery_1_Customer]
(
[CustomerID] [int] NOT NULL IDENTITY(1, 1),
[NameStyle] [dbo].[NameStyle] NOT NULL CONSTRAINT [DF_Customer_NameStyle] DEFAULT ((0)),
[Title] [nvarchar] (8) NULL,
[FirstName] [dbo].[Name] NOT NULL,
[MiddleName] [dbo].[Name] NULL,
[LastName] [dbo].[Name] NOT NULL,
[Suffix] [nvarchar] (10) NULL,
[CompanyName] [nvarchar] (128) NULL,
[SalesPerson] [nvarchar] (256) NULL,
[EmailAddress] [nvarchar] (50) NULL,
[Phone] [dbo].[Phone] NULL,
[PasswordHash] [varchar] (128) NOT NULL,
[PasswordSalt] [varchar] (10) NOT NULL,
[rowguid] [uniqueidentifier] NOT NULL ROWGUIDCOL CONSTRAINT [DF_Customer_rowguid] DEFAULT (newid()),
[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_Customer_ModifiedDate] DEFAULT (getdate()),
[New] [nchar] (10) NULL
)
GO
SET IDENTITY_INSERT [SalesLT].[RG_Recovery_1_Customer] ON
GO
INSERT INTO [SalesLT].[RG_Recovery_1_Customer]([CustomerID], [NameStyle], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [CompanyName], [SalesPerson], [EmailAddress], [Phone], [PasswordHash], [rowguid], [ModifiedDate], [New]) SELECT [CustomerID], [NameStyle], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [CompanyName], [SalesPerson], [EmailAddress], [Phone], [PasswordHash], [rowguid], [ModifiedDate], [New] FROM [SalesLT].[Customer]
GO
SET IDENTITY_INSERT [SalesLT].[RG_Recovery_1_Customer] OFF
GO
DECLARE @idVal BIGINT
SELECT @idVal = IDENT_CURRENT(N'[SalesLT].[Customer]')
IF @idVal IS NOT NULL
    DBCC CHECKIDENT(N'[SalesLT].[RG_Recovery_1_Customer]', RESEED, @idVal)
GO
DROP TABLE [SalesLT].[Customer]
GO
EXEC sp_rename N'[SalesLT].[RG_Recovery_1_Customer]', N'Customer', N'OBJECT'
GO
PRINT N'Creating primary key [PK_Customer_CustomerID] on [SalesLT].[Customer]'
GO
ALTER TABLE [SalesLT].[Customer] ADD CONSTRAINT [PK_Customer_CustomerID] PRIMARY KEY CLUSTERED ([CustomerID])
GO
PRINT N'Creating index [IX_Customer_EmailAddress] on [SalesLT].[Customer]'
GO
CREATE NONCLUSTERED INDEX [IX_Customer_EmailAddress] ON [SalesLT].[Customer] ([EmailAddress])
GO
PRINT N'Adding constraints to [SalesLT].[Customer]'
GO
ALTER TABLE [SalesLT].[Customer] ADD CONSTRAINT [AK_Customer_rowguid] UNIQUE NONCLUSTERED ([rowguid])
GO
PRINT N'Adding foreign keys to [SalesLT].[CustomerAddress]'
GO
ALTER TABLE [SalesLT].[CustomerAddress] ADD CONSTRAINT [FK_CustomerAddress_Customer_CustomerID] FOREIGN KEY ([CustomerID]) REFERENCES [SalesLT].[Customer] ([CustomerID])
GO
PRINT N'Adding foreign keys to [SalesLT].[SalesOrderHeader]'
GO
ALTER TABLE [SalesLT].[SalesOrderHeader] ADD CONSTRAINT [FK_SalesOrderHeader_Customer_CustomerID] FOREIGN KEY ([CustomerID]) REFERENCES [SalesLT].[Customer] ([CustomerID])
GO
PRINT N'Creating extended properties'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Customer information.', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'The customer''s organization.', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'COLUMN', N'CompanyName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary key for Customer records.', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'COLUMN', N'CustomerID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'E-mail address for the person.', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'COLUMN', N'EmailAddress'
GO
EXEC sp_addextendedproperty N'MS_Description', N'First name of the person.', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'COLUMN', N'FirstName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Last name of the person.', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'COLUMN', N'LastName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Middle name or middle initial of the person.', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'COLUMN', N'MiddleName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'COLUMN', N'ModifiedDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'0 = The data in FirstName and LastName are stored in western style (first name, last name) order.  1 = Eastern style (last name, first name) order.', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'COLUMN', N'NameStyle'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Password for the e-mail account.', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'COLUMN', N'PasswordHash'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Random value concatenated with the password string before the password is hashed.', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'COLUMN', N'PasswordSalt'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Phone number associated with the person.', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'COLUMN', N'Phone'
GO
EXEC sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'COLUMN', N'rowguid'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The customer''s sales person, an employee of AdventureWorks Cycles.', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'COLUMN', N'SalesPerson'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Surname suffix. For example, Sr. or Jr.', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'COLUMN', N'Suffix'
GO
EXEC sp_addextendedproperty N'MS_Description', N'A courtesy title. For example, Mr. or Ms.', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'COLUMN', N'Title'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Unique nonclustered constraint. Used to support replication samples.', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'CONSTRAINT', N'AK_Customer_rowguid'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'CONSTRAINT', N'DF_Customer_ModifiedDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Default constraint value of 0', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'CONSTRAINT', N'DF_Customer_NameStyle'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'CONSTRAINT', N'DF_Customer_rowguid'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'CONSTRAINT', N'PK_Customer_CustomerID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'INDEX', N'IX_Customer_EmailAddress'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'SalesLT', 'TABLE', N'Customer', 'INDEX', N'PK_Customer_CustomerID'
GO

﻿SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS, NOCOUNT ON
GO
SET DATEFORMAT YMD
GO
SET XACT_ABORT ON
GO

PRINT(N'Update 848 rows in [SalesLT].[Customer]')
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='1KjXYs4=' WHERE [CustomerID] = 1
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='fs1ZGhY=' WHERE [CustomerID] = 2
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='YTNH5Rw=' WHERE [CustomerID] = 3
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='nm7D5e4=' WHERE [CustomerID] = 4
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='cNFKU4w=' WHERE [CustomerID] = 5
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='ihWf50M=' WHERE [CustomerID] = 6
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='sPoUBSQ=' WHERE [CustomerID] = 7
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Ls05W3g=' WHERE [CustomerID] = 10
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='jpHKbqE=' WHERE [CustomerID] = 11
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='wVLnvHo=' WHERE [CustomerID] = 12
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='8KfYx/4=' WHERE [CustomerID] = 16
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='c7Ttvv0=' WHERE [CustomerID] = 18
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='zXNgrJw=' WHERE [CustomerID] = 19
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='uMsvfdo=' WHERE [CustomerID] = 20
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='p6pOqKc=' WHERE [CustomerID] = 21
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='SmyIPjE=' WHERE [CustomerID] = 22
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='33g5co8=' WHERE [CustomerID] = 23
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='TgZnUOg=' WHERE [CustomerID] = 24
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='jKtOaOw=' WHERE [CustomerID] = 25
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='SZ+r60o=' WHERE [CustomerID] = 28
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='IRNPDIw=' WHERE [CustomerID] = 29
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='mFRhaEg=' WHERE [CustomerID] = 30
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Jvsxxrg=' WHERE [CustomerID] = 34
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='ot8WcXk=' WHERE [CustomerID] = 37
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='6IvcbVg=' WHERE [CustomerID] = 38
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='uHgb0IU=' WHERE [CustomerID] = 39
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Xe7grug=' WHERE [CustomerID] = 40
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='8soIcx8=' WHERE [CustomerID] = 41
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='JK9/WX8=' WHERE [CustomerID] = 42
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='YADhpPo=' WHERE [CustomerID] = 43
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='/kc6RdY=' WHERE [CustomerID] = 46
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='8n38uVg=' WHERE [CustomerID] = 47
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Zb6O1a0=' WHERE [CustomerID] = 48
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='n7ydrrc=' WHERE [CustomerID] = 52
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='xw9RymE=' WHERE [CustomerID] = 55
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='hpOsvJU=' WHERE [CustomerID] = 56
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='N5Ajt+s=' WHERE [CustomerID] = 57
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='QgzjTPU=' WHERE [CustomerID] = 58
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='KiAAI5M=' WHERE [CustomerID] = 59
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='eK6Wzw0=' WHERE [CustomerID] = 60
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='5MZXwF4=' WHERE [CustomerID] = 61
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='HaDRSbY=' WHERE [CustomerID] = 64
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='qxbTTkE=' WHERE [CustomerID] = 65
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Uifpoxw=' WHERE [CustomerID] = 66
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='6fOTb8g=' WHERE [CustomerID] = 70
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='09k9Tis=' WHERE [CustomerID] = 73
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='J9DNyhU=' WHERE [CustomerID] = 74
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='DKu7/UM=' WHERE [CustomerID] = 75
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='PJEpZaA=' WHERE [CustomerID] = 76
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='MjQeaAE=' WHERE [CustomerID] = 77
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='BsI2IB4=' WHERE [CustomerID] = 78
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='lGI5cA0=' WHERE [CustomerID] = 79
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='5NcSbeg=' WHERE [CustomerID] = 82
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='MAOhXKA=' WHERE [CustomerID] = 83
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='966Lz4w=' WHERE [CustomerID] = 84
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='/rh9tFs=' WHERE [CustomerID] = 88
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='IrqLpXQ=' WHERE [CustomerID] = 91
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='zmqmiAQ=' WHERE [CustomerID] = 92
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='l32Vf08=' WHERE [CustomerID] = 93
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='A+rOrG0=' WHERE [CustomerID] = 94
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='BUBjqIQ=' WHERE [CustomerID] = 95
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='WVm7PpY=' WHERE [CustomerID] = 96
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='GdsdWsk=' WHERE [CustomerID] = 97
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='b96sfSU=' WHERE [CustomerID] = 100
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='94SS2WQ=' WHERE [CustomerID] = 101
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='OHu+9rc=' WHERE [CustomerID] = 102
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='NuexV8w=' WHERE [CustomerID] = 106
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='jcMXc0w=' WHERE [CustomerID] = 109
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='IS71rL8=' WHERE [CustomerID] = 110
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='sA8S2v4=' WHERE [CustomerID] = 111
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='UUwXzgY=' WHERE [CustomerID] = 112
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='ke7sTgo=' WHERE [CustomerID] = 113
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='j6Z6ny8=' WHERE [CustomerID] = 114
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='4m5UYgM=' WHERE [CustomerID] = 115
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='5MEUKYU=' WHERE [CustomerID] = 118
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='ycYA+jA=' WHERE [CustomerID] = 119
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='7+I+4k4=' WHERE [CustomerID] = 120
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='R273GbA=' WHERE [CustomerID] = 124
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='jH5dJh4=' WHERE [CustomerID] = 127
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='OSnERUk=' WHERE [CustomerID] = 128
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='3tT/ffQ=' WHERE [CustomerID] = 129
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='QXbFwBQ=' WHERE [CustomerID] = 130
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='dPOi278=' WHERE [CustomerID] = 131
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='60Z0AcQ=' WHERE [CustomerID] = 132
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='ewV5lII=' WHERE [CustomerID] = 133
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='8ju6sOA=' WHERE [CustomerID] = 136
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='lUNnQso=' WHERE [CustomerID] = 137
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='PZCGT2g=' WHERE [CustomerID] = 138
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='83inWt0=' WHERE [CustomerID] = 142
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='MxiyX14=' WHERE [CustomerID] = 145
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='jpRF8lY=' WHERE [CustomerID] = 146
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='hGHOthw=' WHERE [CustomerID] = 147
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='6ZoXk8E=' WHERE [CustomerID] = 148
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='OzSaq2k=' WHERE [CustomerID] = 149
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='2cMmc9Y=' WHERE [CustomerID] = 150
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='PiILPfc=' WHERE [CustomerID] = 151
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='fYgdeM0=' WHERE [CustomerID] = 154
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Whn5BXY=' WHERE [CustomerID] = 155
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='w7ec7iI=' WHERE [CustomerID] = 156
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='QS6UTS4=' WHERE [CustomerID] = 160
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='LCi+QgQ=' WHERE [CustomerID] = 163
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='M4cce8o=' WHERE [CustomerID] = 164
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='oMeb83g=' WHERE [CustomerID] = 165
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='n+71V7I=' WHERE [CustomerID] = 166
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='hiSI26I=' WHERE [CustomerID] = 167
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='dz8Ej6A=' WHERE [CustomerID] = 168
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='lsd099Q=' WHERE [CustomerID] = 169
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='M8SoIWU=' WHERE [CustomerID] = 172
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='DUDd/5g=' WHERE [CustomerID] = 173
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='G5ADims=' WHERE [CustomerID] = 174
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='FihOX8w=' WHERE [CustomerID] = 178
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='ggpF1Og=' WHERE [CustomerID] = 180
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='vhvGQUE=' WHERE [CustomerID] = 181
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='kj/7VTw=' WHERE [CustomerID] = 182
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='BG6Ps64=' WHERE [CustomerID] = 183
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='ZcFvFFc=' WHERE [CustomerID] = 184
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='ekE0M9I=' WHERE [CustomerID] = 185
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='pI/k4Qw=' WHERE [CustomerID] = 186
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='/9h1e7s=' WHERE [CustomerID] = 187
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='s7z2FRc=' WHERE [CustomerID] = 190
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='FccEr0Q=' WHERE [CustomerID] = 191
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='okCr0j4=' WHERE [CustomerID] = 192
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='C2IP7to=' WHERE [CustomerID] = 196
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='6xHx1mQ=' WHERE [CustomerID] = 197
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='TYGH50Q=' WHERE [CustomerID] = 198
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='1PXmt4Y=' WHERE [CustomerID] = 199
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='GR7idhc=' WHERE [CustomerID] = 200
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Jx6w2tk=' WHERE [CustomerID] = 201
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='6UypM3o=' WHERE [CustomerID] = 202
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='RqNfsHY=' WHERE [CustomerID] = 203
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='TLqFgK0=' WHERE [CustomerID] = 204
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='6YiQ2V8=' WHERE [CustomerID] = 205
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='WWk6sxA=' WHERE [CustomerID] = 208
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='c0oPTcw=' WHERE [CustomerID] = 209
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='m3KdhOo=' WHERE [CustomerID] = 210
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='M6OjY4Y=' WHERE [CustomerID] = 214
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='k3iiros=' WHERE [CustomerID] = 217
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='0fgKxF4=' WHERE [CustomerID] = 218
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='2t9hMlk=' WHERE [CustomerID] = 219
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='mQK+bIw=' WHERE [CustomerID] = 220
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='CqQEYuw=' WHERE [CustomerID] = 221
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='lkPNcdI=' WHERE [CustomerID] = 222
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='XdEyqf4=' WHERE [CustomerID] = 223
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Tb+oJnk=' WHERE [CustomerID] = 226
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='OtAJEtc=' WHERE [CustomerID] = 227
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='W1IKTDo=' WHERE [CustomerID] = 228
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='AnSCCJw=' WHERE [CustomerID] = 232
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='F1wnUPk=' WHERE [CustomerID] = 235
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='ojfzrl4=' WHERE [CustomerID] = 236
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='dt/JUB4=' WHERE [CustomerID] = 237
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='F/sb/Xc=' WHERE [CustomerID] = 238
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='cpPYnNE=' WHERE [CustomerID] = 239
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='mgl/qso=' WHERE [CustomerID] = 240
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='3V8BWNc=' WHERE [CustomerID] = 241
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='rLOroU0=' WHERE [CustomerID] = 244
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='r9owTtw=' WHERE [CustomerID] = 245
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='HQA1TJE=' WHERE [CustomerID] = 246
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='mZ4Tbi0=' WHERE [CustomerID] = 250
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='xAk6xGo=' WHERE [CustomerID] = 253
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='G5Du9Sw=' WHERE [CustomerID] = 254
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Yqlwc+g=' WHERE [CustomerID] = 255
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='B/Jr1SE=' WHERE [CustomerID] = 256
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='6Mzfp8w=' WHERE [CustomerID] = 257
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='iKVyEt4=' WHERE [CustomerID] = 258
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='7hC00f0=' WHERE [CustomerID] = 259
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='H5fjp4Y=' WHERE [CustomerID] = 262
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='e8KtQ70=' WHERE [CustomerID] = 263
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='MLAW5PQ=' WHERE [CustomerID] = 264
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='KoBtEoU=' WHERE [CustomerID] = 268
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='NbybY4k=' WHERE [CustomerID] = 271
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='2NEGr8A=' WHERE [CustomerID] = 272
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='/tv9aHA=' WHERE [CustomerID] = 273
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='k1FFTeE=' WHERE [CustomerID] = 274
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='LQWSses=' WHERE [CustomerID] = 275
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='HUE+JKI=' WHERE [CustomerID] = 276
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='rQoQs38=' WHERE [CustomerID] = 277
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='6ansEQA=' WHERE [CustomerID] = 280
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='RpQyjlA=' WHERE [CustomerID] = 281
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='V1n+9SQ=' WHERE [CustomerID] = 282
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='abrUsFg=' WHERE [CustomerID] = 286
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='fqDHYeo=' WHERE [CustomerID] = 287
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='cdUS/K4=' WHERE [CustomerID] = 288
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='fjVy+G4=' WHERE [CustomerID] = 289
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='rXx8clQ=' WHERE [CustomerID] = 290
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='mv8CSkM=' WHERE [CustomerID] = 291
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='8L4g3I4=' WHERE [CustomerID] = 292
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='vJ/AcXo=' WHERE [CustomerID] = 293
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='L1e3Y34=' WHERE [CustomerID] = 294
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='k6zgROU=' WHERE [CustomerID] = 295
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='mQH+E8w=' WHERE [CustomerID] = 298
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='FooiQMs=' WHERE [CustomerID] = 299
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='oOIbGSo=' WHERE [CustomerID] = 300
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='hrRF3s4=' WHERE [CustomerID] = 304
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='F0hRcQ8=' WHERE [CustomerID] = 306
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='ru6E/qg=' WHERE [CustomerID] = 307
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='BNNUWH4=' WHERE [CustomerID] = 308
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='ZXH0EUg=' WHERE [CustomerID] = 309
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='n/q5ims=' WHERE [CustomerID] = 310
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='v5pJpw0=' WHERE [CustomerID] = 311
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='hXYQBis=' WHERE [CustomerID] = 312
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='q1lJvKo=' WHERE [CustomerID] = 313
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='6CMCzUQ=' WHERE [CustomerID] = 316
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='KVVlFXY=' WHERE [CustomerID] = 317
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='BX3pcB8=' WHERE [CustomerID] = 318
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='eiCRDs8=' WHERE [CustomerID] = 322
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='T2lZOPo=' WHERE [CustomerID] = 323
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='GNkVrfA=' WHERE [CustomerID] = 325
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='3CEircg=' WHERE [CustomerID] = 326
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='QhHP+y8=' WHERE [CustomerID] = 327
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='iES3IZA=' WHERE [CustomerID] = 328
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='9ak86/4=' WHERE [CustomerID] = 329
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='7erbA0k=' WHERE [CustomerID] = 330
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='HDCU1Bk=' WHERE [CustomerID] = 331
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='jYD20wc=' WHERE [CustomerID] = 334
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='2Ugh6Q4=' WHERE [CustomerID] = 335
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='x4UseEA=' WHERE [CustomerID] = 336
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='hSwmBWk=' WHERE [CustomerID] = 340
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='WTZFkow=' WHERE [CustomerID] = 343
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='x1JqF8M=' WHERE [CustomerID] = 344
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='kAdG4pM=' WHERE [CustomerID] = 345
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='FNe76Vk=' WHERE [CustomerID] = 346
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='6QL/f9s=' WHERE [CustomerID] = 347
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='CGYtmQ4=' WHERE [CustomerID] = 348
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Zkv5OCw=' WHERE [CustomerID] = 349
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='4YXPsTU=' WHERE [CustomerID] = 352
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='eVaIdvY=' WHERE [CustomerID] = 353
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='qoGU2YA=' WHERE [CustomerID] = 354
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='jMsXQbs=' WHERE [CustomerID] = 358
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='7xa5oqo=' WHERE [CustomerID] = 360
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='jZhDom8=' WHERE [CustomerID] = 361
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='xUz/uts=' WHERE [CustomerID] = 362
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='3VRtZxg=' WHERE [CustomerID] = 363
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Cdwoi3o=' WHERE [CustomerID] = 364
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='7wlaV4Y=' WHERE [CustomerID] = 365
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='bwG1Wck=' WHERE [CustomerID] = 366
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='3D0YsUM=' WHERE [CustomerID] = 367
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='/P0XMaQ=' WHERE [CustomerID] = 370
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='MY+7QbE=' WHERE [CustomerID] = 371
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='yv8Jhf8=' WHERE [CustomerID] = 372
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='J1cVbE8=' WHERE [CustomerID] = 376
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='FSkdXTM=' WHERE [CustomerID] = 377
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='B+59kWs=' WHERE [CustomerID] = 379
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='gF7bPbY=' WHERE [CustomerID] = 380
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='6ZebGOE=' WHERE [CustomerID] = 381
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='OLqP9tg=' WHERE [CustomerID] = 382
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='+v0uddA=' WHERE [CustomerID] = 383
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='kCUx/bc=' WHERE [CustomerID] = 384
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='a2bt7rI=' WHERE [CustomerID] = 385
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='j/3FTKs=' WHERE [CustomerID] = 388
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='lnEeim8=' WHERE [CustomerID] = 389
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='abgBRtE=' WHERE [CustomerID] = 390
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='SNjG3l0=' WHERE [CustomerID] = 394
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='hY2Xf6o=' WHERE [CustomerID] = 395
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='7xO2UQE=' WHERE [CustomerID] = 397
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Jmtgb40=' WHERE [CustomerID] = 398
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='+apUSQU=' WHERE [CustomerID] = 399
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Q5WaAeA=' WHERE [CustomerID] = 400
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='0lp7vWg=' WHERE [CustomerID] = 401
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='5qLSJhI=' WHERE [CustomerID] = 402
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='RvrCF5g=' WHERE [CustomerID] = 403
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='S111y4k=' WHERE [CustomerID] = 406
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='3lDpoDs=' WHERE [CustomerID] = 407
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='ns1gQU4=' WHERE [CustomerID] = 408
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='v8LsuAE=' WHERE [CustomerID] = 412
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Ze2j4rQ=' WHERE [CustomerID] = 415
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='aKMOOAA=' WHERE [CustomerID] = 416
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='BuagBic=' WHERE [CustomerID] = 417
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='af0s25U=' WHERE [CustomerID] = 418
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='p9JC+Qs=' WHERE [CustomerID] = 419
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='tAAs8Fk=' WHERE [CustomerID] = 420
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='KOGA0IE=' WHERE [CustomerID] = 421
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='7P8PxcQ=' WHERE [CustomerID] = 424
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='8fDglPw=' WHERE [CustomerID] = 425
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='DblcZuo=' WHERE [CustomerID] = 426
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='fS7eEaQ=' WHERE [CustomerID] = 430
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='TmbNGeI=' WHERE [CustomerID] = 431
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='bhH3VWU=' WHERE [CustomerID] = 433
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='4TnK5Fo=' WHERE [CustomerID] = 434
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='PavVqD4=' WHERE [CustomerID] = 435
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='8iuXJ0k=' WHERE [CustomerID] = 436
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='9P3dKrM=' WHERE [CustomerID] = 437
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='XaJdIYM=' WHERE [CustomerID] = 438
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='2HvuG3I=' WHERE [CustomerID] = 439
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='bsrg3KE=' WHERE [CustomerID] = 442
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='aNoO9K0=' WHERE [CustomerID] = 443
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='XjtM78E=' WHERE [CustomerID] = 444
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='vx5Ko/Q=' WHERE [CustomerID] = 448
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='/4/gh8A=' WHERE [CustomerID] = 451
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='4blcnbQ=' WHERE [CustomerID] = 452
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='+Yo0P+0=' WHERE [CustomerID] = 453
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='qUowBt4=' WHERE [CustomerID] = 454
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='X1REDgI=' WHERE [CustomerID] = 455
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='x+UpoXE=' WHERE [CustomerID] = 456
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='zYqZHNo=' WHERE [CustomerID] = 457
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='ZFXGiMU=' WHERE [CustomerID] = 460
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Vuzh1IE=' WHERE [CustomerID] = 461
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='hZbeVTs=' WHERE [CustomerID] = 462
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='+iF/Sqs=' WHERE [CustomerID] = 466
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='HfBhcWQ=' WHERE [CustomerID] = 468
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='5hdHSeE=' WHERE [CustomerID] = 469
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='k8iQbOY=' WHERE [CustomerID] = 470
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='MFN+Ar8=' WHERE [CustomerID] = 471
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='r8MY8Co=' WHERE [CustomerID] = 472
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='hvfA+Y0=' WHERE [CustomerID] = 473
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='hxyAApA=' WHERE [CustomerID] = 474
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Pz84Lbs=' WHERE [CustomerID] = 475
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='H8DZOb4=' WHERE [CustomerID] = 478
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='s0Fgpmc=' WHERE [CustomerID] = 479
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='MO+/tX0=' WHERE [CustomerID] = 480
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='n/cr6qs=' WHERE [CustomerID] = 484
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='H30Eu1I=' WHERE [CustomerID] = 487
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='i2U3DxA=' WHERE [CustomerID] = 488
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='GQqIg64=' WHERE [CustomerID] = 489
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='t31Ri34=' WHERE [CustomerID] = 490
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='jA7oD80=' WHERE [CustomerID] = 491
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='sQuHPto=' WHERE [CustomerID] = 492
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='ic4F61g=' WHERE [CustomerID] = 493
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='eFbn7kk=' WHERE [CustomerID] = 496
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='yvdbcxM=' WHERE [CustomerID] = 497
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='E7joL4U=' WHERE [CustomerID] = 498
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='sEZH3m0=' WHERE [CustomerID] = 502
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Zg4TO0Q=' WHERE [CustomerID] = 504
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='BhyhRuI=' WHERE [CustomerID] = 505
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='NVfuzjo=' WHERE [CustomerID] = 506
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='toJKEB0=' WHERE [CustomerID] = 507
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='IrlfUfg=' WHERE [CustomerID] = 508
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='r/UyVHY=' WHERE [CustomerID] = 509
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='BJUetfg=' WHERE [CustomerID] = 510
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='D5ohtJ8=' WHERE [CustomerID] = 511
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='DBuWFZ4=' WHERE [CustomerID] = 514
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='3KzW2g8=' WHERE [CustomerID] = 515
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='aOFmjMY=' WHERE [CustomerID] = 516
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='x8xILbE=' WHERE [CustomerID] = 520
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='S640434=' WHERE [CustomerID] = 523
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='gTOrXjM=' WHERE [CustomerID] = 526
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='br8PN50=' WHERE [CustomerID] = 527
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='v1Ew2R4=' WHERE [CustomerID] = 528
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='dUASILc=' WHERE [CustomerID] = 529
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='s9kzXNA=' WHERE [CustomerID] = 532
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='30pSFOQ=' WHERE [CustomerID] = 533
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='xdzdXEw=' WHERE [CustomerID] = 534
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='C4OiUF4=' WHERE [CustomerID] = 538
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='dS1y3X0=' WHERE [CustomerID] = 541
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='GAfxRv4=' WHERE [CustomerID] = 542
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='K0sYx+Y=' WHERE [CustomerID] = 543
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='117fxZM=' WHERE [CustomerID] = 544
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='7uZHIds=' WHERE [CustomerID] = 545
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='0sZGs8c=' WHERE [CustomerID] = 546
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='ISstDas=' WHERE [CustomerID] = 547
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Ap+5ADc=' WHERE [CustomerID] = 550
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='uFYBREA=' WHERE [CustomerID] = 551
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='W9zzlRs=' WHERE [CustomerID] = 552
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='qcerumU=' WHERE [CustomerID] = 556
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='NNRxDmg=' WHERE [CustomerID] = 559
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='IZ5yIjI=' WHERE [CustomerID] = 560
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='7wNTdi8=' WHERE [CustomerID] = 561
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='pXNy1Eg=' WHERE [CustomerID] = 562
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='jKAQI7c=' WHERE [CustomerID] = 563
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='M5BkDDQ=' WHERE [CustomerID] = 564
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='s71j+uU=' WHERE [CustomerID] = 565
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='e139ONA=' WHERE [CustomerID] = 568
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='KUNCNjU=' WHERE [CustomerID] = 569
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='IlDduMc=' WHERE [CustomerID] = 570
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Qtn1h+4=' WHERE [CustomerID] = 574
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='GVMmXow=' WHERE [CustomerID] = 577
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='qwoGYjU=' WHERE [CustomerID] = 578
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='rrgbG/U=' WHERE [CustomerID] = 579
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='HQlRLlk=' WHERE [CustomerID] = 580
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='anxKyOc=' WHERE [CustomerID] = 581
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='rpyd5Tw=' WHERE [CustomerID] = 582
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='ckT+1XU=' WHERE [CustomerID] = 583
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='VQqvrDo=' WHERE [CustomerID] = 586
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='83MFiok=' WHERE [CustomerID] = 587
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='bvb6hus=' WHERE [CustomerID] = 588
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='XSHxez4=' WHERE [CustomerID] = 592
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='FDIch68=' WHERE [CustomerID] = 595
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='WGizZm8=' WHERE [CustomerID] = 596
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='FebyYno=' WHERE [CustomerID] = 597
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='0rK3P2k=' WHERE [CustomerID] = 598
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='68RH5og=' WHERE [CustomerID] = 599
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='wmfLAOE=' WHERE [CustomerID] = 600
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='hLswDiQ=' WHERE [CustomerID] = 601
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='7uwL9LU=' WHERE [CustomerID] = 604
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='beKST+I=' WHERE [CustomerID] = 605
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='yvAO+sY=' WHERE [CustomerID] = 606
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='4QdzKJI=' WHERE [CustomerID] = 607
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Hp2yS7E=' WHERE [CustomerID] = 608
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='AwqZdYk=' WHERE [CustomerID] = 609
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='QvunVRs=' WHERE [CustomerID] = 610
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='awRBGoA=' WHERE [CustomerID] = 613
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='SC/mXZQ=' WHERE [CustomerID] = 617
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='fJ1qzBg=' WHERE [CustomerID] = 620
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='hDyaJt4=' WHERE [CustomerID] = 621
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='M0RBO9w=' WHERE [CustomerID] = 622
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='gJeczkk=' WHERE [CustomerID] = 623
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='wt1HllQ=' WHERE [CustomerID] = 624
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='ZqTw9GM=' WHERE [CustomerID] = 625
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='hGtKm+M=' WHERE [CustomerID] = 626
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='HGudpUM=' WHERE [CustomerID] = 629
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='m9GHYGc=' WHERE [CustomerID] = 630
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='/Q1sZG0=' WHERE [CustomerID] = 631
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='WnTAc/0=' WHERE [CustomerID] = 635
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='0JS3VLg=' WHERE [CustomerID] = 637
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='tRFzZLs=' WHERE [CustomerID] = 641
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='DfqJQ4g=' WHERE [CustomerID] = 643
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='FAw6ojc=' WHERE [CustomerID] = 644
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='DmNlCmQ=' WHERE [CustomerID] = 645
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='LqtoWXs=' WHERE [CustomerID] = 646
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='uXetzTc=' WHERE [CustomerID] = 647
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='256h+G0=' WHERE [CustomerID] = 648
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='IZ6tF0Y=' WHERE [CustomerID] = 649
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='osDZuYo=' WHERE [CustomerID] = 650
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='kc4E3DA=' WHERE [CustomerID] = 653
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Y/Ty5LA=' WHERE [CustomerID] = 654
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='uJ5Exxo=' WHERE [CustomerID] = 655
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='MYqiM6w=' WHERE [CustomerID] = 659
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='/PSiwRg=' WHERE [CustomerID] = 660
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='niDlQYk=' WHERE [CustomerID] = 661
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='blIz9rk=' WHERE [CustomerID] = 665
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='LH8E+mM=' WHERE [CustomerID] = 668
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='ZeNva8s=' WHERE [CustomerID] = 669
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='1lkXMps=' WHERE [CustomerID] = 670
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='YuvPgz4=' WHERE [CustomerID] = 671
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='ClRPyyM=' WHERE [CustomerID] = 672
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='zNDLlSI=' WHERE [CustomerID] = 673
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='CAB+B+I=' WHERE [CustomerID] = 674
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='1sXsDEE=' WHERE [CustomerID] = 677
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='jj5f+ZA=' WHERE [CustomerID] = 678
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='KnmJUbs=' WHERE [CustomerID] = 679
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='JYjWVqI=' WHERE [CustomerID] = 683
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='TfeFfy4=' WHERE [CustomerID] = 685
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Em3q8s4=' WHERE [CustomerID] = 689
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='5dgYmOY=' WHERE [CustomerID] = 692
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='MPxWTOU=' WHERE [CustomerID] = 693
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='M7xYGr4=' WHERE [CustomerID] = 694
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='v43cndI=' WHERE [CustomerID] = 695
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='pDYvCjw=' WHERE [CustomerID] = 696
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='sQMfTfM=' WHERE [CustomerID] = 697
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='DZ8e0Xk=' WHERE [CustomerID] = 698
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Q5U1IZU=' WHERE [CustomerID] = 701
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='rpyd5Tw=' WHERE [CustomerID] = 29485
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='rrgbG/U=' WHERE [CustomerID] = 29486
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='jA7oD80=' WHERE [CustomerID] = 29489
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='i2U3DxA=' WHERE [CustomerID] = 29490
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='117fxZM=' WHERE [CustomerID] = 29492
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='uFYBREA=' WHERE [CustomerID] = 29494
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='r/UyVHY=' WHERE [CustomerID] = 29496
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='NVfuzjo=' WHERE [CustomerID] = 29497
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='yvdbcxM=' WHERE [CustomerID] = 29499
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='IZ5yIjI=' WHERE [CustomerID] = 29502
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='IlDduMc=' WHERE [CustomerID] = 29503
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='M5BkDDQ=' WHERE [CustomerID] = 29505
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='jKAQI7c=' WHERE [CustomerID] = 29506
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='7wNTdi8=' WHERE [CustomerID] = 29508
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='KUNCNjU=' WHERE [CustomerID] = 29510
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='CGYtmQ4=' WHERE [CustomerID] = 29511
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='qoGU2YA=' WHERE [CustomerID] = 29515
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='7xa5oqo=' WHERE [CustomerID] = 29517
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='0lp7vWg=' WHERE [CustomerID] = 29521
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='hXYQBis=' WHERE [CustomerID] = 29522
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='ZXH0EUg=' WHERE [CustomerID] = 29523
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='3VRtZxg=' WHERE [CustomerID] = 29524
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='bwG1Wck=' WHERE [CustomerID] = 29525
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='3lDpoDs=' WHERE [CustomerID] = 29527
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='F0hRcQ8=' WHERE [CustomerID] = 29528
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='oOIbGSo=' WHERE [CustomerID] = 29530
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='XaJdIYM=' WHERE [CustomerID] = 29531
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='4TnK5Fo=' WHERE [CustomerID] = 29532
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='TmbNGeI=' WHERE [CustomerID] = 29533
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='mv8CSkM=' WHERE [CustomerID] = 29535
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='cdUS/K4=' WHERE [CustomerID] = 29536
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='m3KdhOo=' WHERE [CustomerID] = 29539
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='lUNnQso=' WHERE [CustomerID] = 29541
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='XjtM78E=' WHERE [CustomerID] = 29544
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='zXNgrJw=' WHERE [CustomerID] = 29545
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='8KfYx/4=' WHERE [CustomerID] = 29546
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='BX3pcB8=' WHERE [CustomerID] = 29548
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='kj/7VTw=' WHERE [CustomerID] = 29550
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Jx6w2tk=' WHERE [CustomerID] = 29553
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='TYGH50Q=' WHERE [CustomerID] = 29554
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='ns1gQU4=' WHERE [CustomerID] = 29557
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='2Ugh6Q4=' WHERE [CustomerID] = 29558
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='G5Du9Sw=' WHERE [CustomerID] = 29559
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='6Mzfp8w=' WHERE [CustomerID] = 29560
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Hp2yS7E=' WHERE [CustomerID] = 29562
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='BJUetfg=' WHERE [CustomerID] = 29565
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Zg4TO0Q=' WHERE [CustomerID] = 29566
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='SZ+r60o=' WHERE [CustomerID] = 29567
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='jKtOaOw=' WHERE [CustomerID] = 29568
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='SmyIPjE=' WHERE [CustomerID] = 29569
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='8L4g3I4=' WHERE [CustomerID] = 29570
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='fjVy+G4=' WHERE [CustomerID] = 29571
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='dz8Ej6A=' WHERE [CustomerID] = 29573
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='oMeb83g=' WHERE [CustomerID] = 29574
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='7P8PxcQ=' WHERE [CustomerID] = 29576
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='w7ec7iI=' WHERE [CustomerID] = 29577
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='OzSaq2k=' WHERE [CustomerID] = 29579
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='jpRF8lY=' WHERE [CustomerID] = 29580
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='MxiyX14=' WHERE [CustomerID] = 29582
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='6ZoXk8E=' WHERE [CustomerID] = 29583
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='PiILPfc=' WHERE [CustomerID] = 29584
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='J9DNyhU=' WHERE [CustomerID] = 29585
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='C4OiUF4=' WHERE [CustomerID] = 29587
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='dS1y3X0=' WHERE [CustomerID] = 29588
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='T2lZOPo=' WHERE [CustomerID] = 29590
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='mQK+bIw=' WHERE [CustomerID] = 29591
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='dt/JUB4=' WHERE [CustomerID] = 29593
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='MAOhXKA=' WHERE [CustomerID] = 29596
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='MjQeaAE=' WHERE [CustomerID] = 29598
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Jmtgb40=' WHERE [CustomerID] = 29599
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='hY2Xf6o=' WHERE [CustomerID] = 29600
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='DblcZuo=' WHERE [CustomerID] = 29601
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='aNoO9K0=' WHERE [CustomerID] = 29603
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='9P3dKrM=' WHERE [CustomerID] = 29605
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='x1JqF8M=' WHERE [CustomerID] = 29606
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='e8KtQ70=' WHERE [CustomerID] = 29608
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='NbybY4k=' WHERE [CustomerID] = 29611
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='KoBtEoU=' WHERE [CustomerID] = 29612
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='DBuWFZ4=' WHERE [CustomerID] = 29614
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='x8xILbE=' WHERE [CustomerID] = 29615
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='8iuXJ0k=' WHERE [CustomerID] = 29616
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='bhH3VWU=' WHERE [CustomerID] = 29617
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='fS7eEaQ=' WHERE [CustomerID] = 29618
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='eVaIdvY=' WHERE [CustomerID] = 29620
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='2NEGr8A=' WHERE [CustomerID] = 29622
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='LQWSses=' WHERE [CustomerID] = 29623
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='RpQyjlA=' WHERE [CustomerID] = 29625
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='wVLnvHo=' WHERE [CustomerID] = 29627
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='fYgdeM0=' WHERE [CustomerID] = 29629
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='BUBjqIQ=' WHERE [CustomerID] = 29631
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='zmqmiAQ=' WHERE [CustomerID] = 29632
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='v43cndI=' WHERE [CustomerID] = 29635
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='DZ8e0Xk=' WHERE [CustomerID] = 29636
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='YTNH5Rw=' WHERE [CustomerID] = 29637
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='ihWf50M=' WHERE [CustomerID] = 29638
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Whn5BXY=' WHERE [CustomerID] = 29639
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='68RH5og=' WHERE [CustomerID] = 29641
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='beKST+I=' WHERE [CustomerID] = 29643
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='QS6UTS4=' WHERE [CustomerID] = 29644
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='LCi+QgQ=' WHERE [CustomerID] = 29645
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='n+71V7I=' WHERE [CustomerID] = 29646
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='bvb6hus=' WHERE [CustomerID] = 29649
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='KOGA0IE=' WHERE [CustomerID] = 29650
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='af0s25U=' WHERE [CustomerID] = 29651
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='pI/k4Qw=' WHERE [CustomerID] = 29653
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='BG6Ps64=' WHERE [CustomerID] = 29654
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='ggpF1Og=' WHERE [CustomerID] = 29655
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='BuagBic=' WHERE [CustomerID] = 29659
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='tAAs8Fk=' WHERE [CustomerID] = 29660
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='2cMmc9Y=' WHERE [CustomerID] = 29662
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='hGHOthw=' WHERE [CustomerID] = 29663
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='PZCGT2g=' WHERE [CustomerID] = 29666
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='3tT/ffQ=' WHERE [CustomerID] = 29668
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='7+I+4k4=' WHERE [CustomerID] = 29671
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='j6Z6ny8=' WHERE [CustomerID] = 29673
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='sA8S2v4=' WHERE [CustomerID] = 29674
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='94SS2WQ=' WHERE [CustomerID] = 29677
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='lnEeim8=' WHERE [CustomerID] = 29680
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='+v0uddA=' WHERE [CustomerID] = 29682
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='gF7bPbY=' WHERE [CustomerID] = 29683
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='FSkdXTM=' WHERE [CustomerID] = 29684
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='7wlaV4Y=' WHERE [CustomerID] = 29686
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='fqDHYeo=' WHERE [CustomerID] = 29688
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='rXx8clQ=' WHERE [CustomerID] = 29689
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='vJ/AcXo=' WHERE [CustomerID] = 29690
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='FooiQMs=' WHERE [CustomerID] = 29692
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='BNNUWH4=' WHERE [CustomerID] = 29695
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='v5pJpw0=' WHERE [CustomerID] = 29696
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='KVVlFXY=' WHERE [CustomerID] = 29698
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Uifpoxw=' WHERE [CustomerID] = 29699
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='DKu7/UM=' WHERE [CustomerID] = 29702
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='BsI2IB4=' WHERE [CustomerID] = 29703
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='966Lz4w=' WHERE [CustomerID] = 29705
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='l32Vf08=' WHERE [CustomerID] = 29708
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='5dgYmOY=' WHERE [CustomerID] = 29709
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='lsd099Q=' WHERE [CustomerID] = 29710
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='M8SoIWU=' WHERE [CustomerID] = 29711
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='FihOX8w=' WHERE [CustomerID] = 29713
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='DUDd/5g=' WHERE [CustomerID] = 29714
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='hiSI26I=' WHERE [CustomerID] = 29716
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='M4cce8o=' WHERE [CustomerID] = 29717
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='ZeNva8s=' WHERE [CustomerID] = 29719
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='ClRPyyM=' WHERE [CustomerID] = 29720
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='jj5f+ZA=' WHERE [CustomerID] = 29722
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='MPxWTOU=' WHERE [CustomerID] = 29727
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='pDYvCjw=' WHERE [CustomerID] = 29728
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Q5U1IZU=' WHERE [CustomerID] = 29730
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='PavVqD4=' WHERE [CustomerID] = 29732
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='2HvuG3I=' WHERE [CustomerID] = 29733
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='bsrg3KE=' WHERE [CustomerID] = 29734
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='vx5Ko/Q=' WHERE [CustomerID] = 29736
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='/4/gh8A=' WHERE [CustomerID] = 29737
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='qUowBt4=' WHERE [CustomerID] = 29738
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='zYqZHNo=' WHERE [CustomerID] = 29739
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='ZFXGiMU=' WHERE [CustomerID] = 29740
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='+iF/Sqs=' WHERE [CustomerID] = 29741
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='5hdHSeE=' WHERE [CustomerID] = 29742
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='r8MY8Co=' WHERE [CustomerID] = 29743
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Pz84Lbs=' WHERE [CustomerID] = 29744
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='qwoGYjU=' WHERE [CustomerID] = 29747
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='anxKyOc=' WHERE [CustomerID] = 29748
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='83MFiok=' WHERE [CustomerID] = 29750
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='WGizZm8=' WHERE [CustomerID] = 29753
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='E7joL4U=' WHERE [CustomerID] = 29755
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='sQuHPto=' WHERE [CustomerID] = 29757
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='GQqIg64=' WHERE [CustomerID] = 29758
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='MO+/tX0=' WHERE [CustomerID] = 29761
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='hxyAApA=' WHERE [CustomerID] = 29763
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='MFN+Ar8=' WHERE [CustomerID] = 29764
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='HfBhcWQ=' WHERE [CustomerID] = 29765
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='hZbeVTs=' WHERE [CustomerID] = 29766
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='x+UpoXE=' WHERE [CustomerID] = 29768
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='+Yo0P+0=' WHERE [CustomerID] = 29769
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Ls05W3g=' WHERE [CustomerID] = 29770
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='sPoUBSQ=' WHERE [CustomerID] = 29771
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='nm7D5e4=' WHERE [CustomerID] = 29772
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='1KjXYs4=' WHERE [CustomerID] = 29773
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Xe7grug=' WHERE [CustomerID] = 29774
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='ot8WcXk=' WHERE [CustomerID] = 29775
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Jvsxxrg=' WHERE [CustomerID] = 29776
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='abrUsFg=' WHERE [CustomerID] = 29778
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='6ansEQA=' WHERE [CustomerID] = 29780
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='rQoQs38=' WHERE [CustomerID] = 29781
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='k1FFTeE=' WHERE [CustomerID] = 29782
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='S640434=' WHERE [CustomerID] = 29783
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='dUASILc=' WHERE [CustomerID] = 29784
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='s9kzXNA=' WHERE [CustomerID] = 29785
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='3CEircg=' WHERE [CustomerID] = 29787
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='7erbA0k=' WHERE [CustomerID] = 29788
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='x4UseEA=' WHERE [CustomerID] = 29789
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='kAdG4pM=' WHERE [CustomerID] = 29792
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='ewV5lII=' WHERE [CustomerID] = 29793
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='8ju6sOA=' WHERE [CustomerID] = 29794
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='83inWt0=' WHERE [CustomerID] = 29796
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='qxbTTkE=' WHERE [CustomerID] = 29797
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='KiAAI5M=' WHERE [CustomerID] = 29799
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='hpOsvJU=' WHERE [CustomerID] = 29800
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='8n38uVg=' WHERE [CustomerID] = 29803
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='8soIcx8=' WHERE [CustomerID] = 29805
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='6IvcbVg=' WHERE [CustomerID] = 29806
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='IRNPDIw=' WHERE [CustomerID] = 29807
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='33g5co8=' WHERE [CustomerID] = 29809
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='uMsvfdo=' WHERE [CustomerID] = 29810
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='jpHKbqE=' WHERE [CustomerID] = 29813
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='cNFKU4w=' WHERE [CustomerID] = 29815
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='fs1ZGhY=' WHERE [CustomerID] = 29816
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='sQMfTfM=' WHERE [CustomerID] = 29818
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='M7xYGr4=' WHERE [CustomerID] = 29819
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='TfeFfy4=' WHERE [CustomerID] = 29822
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='KnmJUbs=' WHERE [CustomerID] = 29824
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='zNDLlSI=' WHERE [CustomerID] = 29826
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='1lkXMps=' WHERE [CustomerID] = 29827
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='niDlQYk=' WHERE [CustomerID] = 29830
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='uJ5Exxo=' WHERE [CustomerID] = 29831
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Y/Ty5LA=' WHERE [CustomerID] = 29832
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='256h+G0=' WHERE [CustomerID] = 29834
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='DmNlCmQ=' WHERE [CustomerID] = 29835
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='m9GHYGc=' WHERE [CustomerID] = 29840
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='wt1HllQ=' WHERE [CustomerID] = 29842
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='hDyaJt4=' WHERE [CustomerID] = 29843
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='AwqZdYk=' WHERE [CustomerID] = 29847
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='yvAO+sY=' WHERE [CustomerID] = 29848
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='FebyYno=' WHERE [CustomerID] = 29850
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='v8LsuAE=' WHERE [CustomerID] = 29851
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='S111y4k=' WHERE [CustomerID] = 29852
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='RvrCF5g=' WHERE [CustomerID] = 29853
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Q5WaAeA=' WHERE [CustomerID] = 29854
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='e139ONA=' WHERE [CustomerID] = 29855
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Qtn1h+4=' WHERE [CustomerID] = 29857
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='GVMmXow=' WHERE [CustomerID] = 29858
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='HQlRLlk=' WHERE [CustomerID] = 29859
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='SC/mXZQ=' WHERE [CustomerID] = 29860
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='gJeczkk=' WHERE [CustomerID] = 29861
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='hGtKm+M=' WHERE [CustomerID] = 29862
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='HGudpUM=' WHERE [CustomerID] = 29863
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='H5fjp4Y=' WHERE [CustomerID] = 29864
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='7hC00f0=' WHERE [CustomerID] = 29865
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='B/Jr1SE=' WHERE [CustomerID] = 29866
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='xAk6xGo=' WHERE [CustomerID] = 29867
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='mZ4Tbi0=' WHERE [CustomerID] = 29868
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='rLOroU0=' WHERE [CustomerID] = 29870
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='3V8BWNc=' WHERE [CustomerID] = 29871
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='F/sb/Xc=' WHERE [CustomerID] = 29872
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='F1wnUPk=' WHERE [CustomerID] = 29873
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='AnSCCJw=' WHERE [CustomerID] = 29874
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Tb+oJnk=' WHERE [CustomerID] = 29876
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='XdEyqf4=' WHERE [CustomerID] = 29877
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='8fDglPw=' WHERE [CustomerID] = 29879
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='W1IKTDo=' WHERE [CustomerID] = 29881
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='lkPNcdI=' WHERE [CustomerID] = 29883
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='2t9hMlk=' WHERE [CustomerID] = 29884
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='0fgKxF4=' WHERE [CustomerID] = 29885
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='RqNfsHY=' WHERE [CustomerID] = 29889
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='GR7idhc=' WHERE [CustomerID] = 29890
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='6xHx1mQ=' WHERE [CustomerID] = 29891
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='FccEr0Q=' WHERE [CustomerID] = 29892
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='ekE0M9I=' WHERE [CustomerID] = 29893
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='s0Fgpmc=' WHERE [CustomerID] = 29895
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='hvfA+Y0=' WHERE [CustomerID] = 29897
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='7xO2UQE=' WHERE [CustomerID] = 29898
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='j/3FTKs=' WHERE [CustomerID] = 29900
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='a2bt7rI=' WHERE [CustomerID] = 29901
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='OLqP9tg=' WHERE [CustomerID] = 29902
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='B+59kWs=' WHERE [CustomerID] = 29903
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='J1cVbE8=' WHERE [CustomerID] = 29904
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='/P0XMaQ=' WHERE [CustomerID] = 29905
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Cdwoi3o=' WHERE [CustomerID] = 29906
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='jZhDom8=' WHERE [CustomerID] = 29907
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='jMsXQbs=' WHERE [CustomerID] = 29908
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='4YXPsTU=' WHERE [CustomerID] = 29910
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='W9zzlRs=' WHERE [CustomerID] = 29911
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='0sZGs8c=' WHERE [CustomerID] = 29913
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='7uZHIds=' WHERE [CustomerID] = 29914
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='GAfxRv4=' WHERE [CustomerID] = 29915
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='b96sfSU=' WHERE [CustomerID] = 29918
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='GdsdWsk=' WHERE [CustomerID] = 29919
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='A+rOrG0=' WHERE [CustomerID] = 29920
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='IrqLpXQ=' WHERE [CustomerID] = 29921
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='/rh9tFs=' WHERE [CustomerID] = 29922
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='lGI5cA0=' WHERE [CustomerID] = 29924
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='09k9Tis=' WHERE [CustomerID] = 29925
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='6fOTb8g=' WHERE [CustomerID] = 29926
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='HaDRSbY=' WHERE [CustomerID] = 29928
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='5MZXwF4=' WHERE [CustomerID] = 29929
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='QgzjTPU=' WHERE [CustomerID] = 29930
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='xw9RymE=' WHERE [CustomerID] = 29931
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='n7ydrrc=' WHERE [CustomerID] = 29932
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='/kc6RdY=' WHERE [CustomerID] = 29934
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='YADhpPo=' WHERE [CustomerID] = 29935
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='vhvGQUE=' WHERE [CustomerID] = 29936
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='ZcFvFFc=' WHERE [CustomerID] = 29937
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='/9h1e7s=' WHERE [CustomerID] = 29938
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='s7z2FRc=' WHERE [CustomerID] = 29939
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='C2IP7to=' WHERE [CustomerID] = 29941
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='1PXmt4Y=' WHERE [CustomerID] = 29942
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='6UypM3o=' WHERE [CustomerID] = 29943
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='WVm7PpY=' WHERE [CustomerID] = 29944
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='OHu+9rc=' WHERE [CustomerID] = 29946
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='UUwXzgY=' WHERE [CustomerID] = 29948
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='4m5UYgM=' WHERE [CustomerID] = 29949
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='5MEUKYU=' WHERE [CustomerID] = 29950
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='R273GbA=' WHERE [CustomerID] = 29952
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='jH5dJh4=' WHERE [CustomerID] = 29953
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='QXbFwBQ=' WHERE [CustomerID] = 29954
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='c7Ttvv0=' WHERE [CustomerID] = 29955
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='p6pOqKc=' WHERE [CustomerID] = 29956
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='TgZnUOg=' WHERE [CustomerID] = 29957
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='mFRhaEg=' WHERE [CustomerID] = 29959
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='uHgb0IU=' WHERE [CustomerID] = 29962
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Zb6O1a0=' WHERE [CustomerID] = 29964
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='N5Ajt+s=' WHERE [CustomerID] = 29967
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='/Q1sZG0=' WHERE [CustomerID] = 29969
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='0JS3VLg=' WHERE [CustomerID] = 29971
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='DfqJQ4g=' WHERE [CustomerID] = 29973
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='LqtoWXs=' WHERE [CustomerID] = 29974
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='IZ6tF0Y=' WHERE [CustomerID] = 29975
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='MYqiM6w=' WHERE [CustomerID] = 29978
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='blIz9rk=' WHERE [CustomerID] = 29980
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='LH8E+mM=' WHERE [CustomerID] = 29981
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='CAB+B+I=' WHERE [CustomerID] = 29982
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='1sXsDEE=' WHERE [CustomerID] = 29983
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='JYjWVqI=' WHERE [CustomerID] = 29985
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='6YiQ2V8=' WHERE [CustomerID] = 29987
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='WWk6sxA=' WHERE [CustomerID] = 29988
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='M6OjY4Y=' WHERE [CustomerID] = 29990
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='k3iiros=' WHERE [CustomerID] = 29991
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='CqQEYuw=' WHERE [CustomerID] = 29992
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='OtAJEtc=' WHERE [CustomerID] = 29994
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='ojfzrl4=' WHERE [CustomerID] = 29997
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='cpPYnNE=' WHERE [CustomerID] = 29998
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='r9owTtw=' WHERE [CustomerID] = 30000
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='pXNy1Eg=' WHERE [CustomerID] = 30003
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='NNRxDmg=' WHERE [CustomerID] = 30004
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='qcerumU=' WHERE [CustomerID] = 30005
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Ap+5ADc=' WHERE [CustomerID] = 30007
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='K0sYx+Y=' WHERE [CustomerID] = 30008
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='xdzdXEw=' WHERE [CustomerID] = 30010
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='v1Ew2R4=' WHERE [CustomerID] = 30012
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='aOFmjMY=' WHERE [CustomerID] = 30016
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='GNkVrfA=' WHERE [CustomerID] = 30018
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='eiCRDs8=' WHERE [CustomerID] = 30019
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='6CMCzUQ=' WHERE [CustomerID] = 30021
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='q1lJvKo=' WHERE [CustomerID] = 30022
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='n/q5ims=' WHERE [CustomerID] = 30023
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='ru6E/qg=' WHERE [CustomerID] = 30024
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='hrRF3s4=' WHERE [CustomerID] = 30025
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='k6zgROU=' WHERE [CustomerID] = 30027
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='ckT+1XU=' WHERE [CustomerID] = 30028
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='VQqvrDo=' WHERE [CustomerID] = 30029
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='XSHxez4=' WHERE [CustomerID] = 30030
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='FDIch68=' WHERE [CustomerID] = 30031
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='0rK3P2k=' WHERE [CustomerID] = 30032
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='hLswDiQ=' WHERE [CustomerID] = 30033
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='7uwL9LU=' WHERE [CustomerID] = 30034
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='4QdzKJI=' WHERE [CustomerID] = 30035
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='QvunVRs=' WHERE [CustomerID] = 30036
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='awRBGoA=' WHERE [CustomerID] = 30037
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='M0RBO9w=' WHERE [CustomerID] = 30039
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='ZqTw9GM=' WHERE [CustomerID] = 30040
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='H8DZOb4=' WHERE [CustomerID] = 30042
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='n/cr6qs=' WHERE [CustomerID] = 30044
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='H30Eu1I=' WHERE [CustomerID] = 30045
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='t31Ri34=' WHERE [CustomerID] = 30046
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='ic4F61g=' WHERE [CustomerID] = 30047
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='eFbn7kk=' WHERE [CustomerID] = 30048
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='sEZH3m0=' WHERE [CustomerID] = 30050
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='BhyhRuI=' WHERE [CustomerID] = 30051
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='D5ohtJ8=' WHERE [CustomerID] = 30052
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='yv8Jhf8=' WHERE [CustomerID] = 30053
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='6ZebGOE=' WHERE [CustomerID] = 30055
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='kCUx/bc=' WHERE [CustomerID] = 30056
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='abgBRtE=' WHERE [CustomerID] = 30058
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='+apUSQU=' WHERE [CustomerID] = 30061
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='dPOi278=' WHERE [CustomerID] = 30063
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='OSnERUk=' WHERE [CustomerID] = 30064
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='ycYA+jA=' WHERE [CustomerID] = 30067
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='ke7sTgo=' WHERE [CustomerID] = 30069
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='IS71rL8=' WHERE [CustomerID] = 30070
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='jcMXc0w=' WHERE [CustomerID] = 30071
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='NuexV8w=' WHERE [CustomerID] = 30072
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='30pSFOQ=' WHERE [CustomerID] = 30074
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='br8PN50=' WHERE [CustomerID] = 30076
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='k8iQbOY=' WHERE [CustomerID] = 30080
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Vuzh1IE=' WHERE [CustomerID] = 30083
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='V1n+9SQ=' WHERE [CustomerID] = 30087
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='HUE+JKI=' WHERE [CustomerID] = 30089
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='/tv9aHA=' WHERE [CustomerID] = 30090
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='MLAW5PQ=' WHERE [CustomerID] = 30093
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='iKVyEt4=' WHERE [CustomerID] = 30094
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Yqlwc+g=' WHERE [CustomerID] = 30095
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='HQA1TJE=' WHERE [CustomerID] = 30098
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='mgl/qso=' WHERE [CustomerID] = 30100
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='WnTAc/0=' WHERE [CustomerID] = 30102
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='tRFzZLs=' WHERE [CustomerID] = 30104
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='FAw6ojc=' WHERE [CustomerID] = 30105
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='uXetzTc=' WHERE [CustomerID] = 30106
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='osDZuYo=' WHERE [CustomerID] = 30107
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='kc4E3DA=' WHERE [CustomerID] = 30108
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='/PSiwRg=' WHERE [CustomerID] = 30109
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='Zkv5OCw=' WHERE [CustomerID] = 30110
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='FNe76Vk=' WHERE [CustomerID] = 30111
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='WTZFkow=' WHERE [CustomerID] = 30112
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='hSwmBWk=' WHERE [CustomerID] = 30113
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='jYD20wc=' WHERE [CustomerID] = 30115
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='HDCU1Bk=' WHERE [CustomerID] = 30116
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='iES3IZA=' WHERE [CustomerID] = 30117
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='QhHP+y8=' WHERE [CustomerID] = 30118
UPDATE [SalesLT].[Customer] SET [PasswordSalt]='' WHERE [CustomerID] = 30121

