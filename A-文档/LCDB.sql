/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2017/11/9 15:29:53                           */
/*==============================================================*/


if exists (select 1
            from  sysobjects
           where  id = object_id('LC_tbl_Log')
            and   type = 'U')
   drop table LC_tbl_Log
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LC_tbl_menu')
            and   type = 'U')
   drop table LC_tbl_menu
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LC_tbl_menugroup')
            and   type = 'U')
   drop table LC_tbl_menugroup
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LC_tbl_role')
            and   type = 'U')
   drop table LC_tbl_role
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LC_tbl_rolemenu')
            and   type = 'U')
   drop table LC_tbl_rolemenu
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LC_tbl_user')
            and   type = 'U')
   drop table LC_tbl_user
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LC_tbl_userrole')
            and   type = 'U')
   drop table LC_tbl_userrole
go

/*==============================================================*/
/* Table: LC_tbl_Log                                            */
/*==============================================================*/
create table LC_tbl_Log (
   logid                bigint               identity,
   userid               bigint               null,
   logtype              int                  null,
   content              nvarchar(Max)        null,
   logtime              datetime             null,
   IP                   nvarchar(20)         null,
   constraint PK_LC_TBL_LOG primary key (logid)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('LC_tbl_Log') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'LC_tbl_Log' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '系统日志表', 
   'user', @CurrentUser, 'table', 'LC_tbl_Log'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('LC_tbl_Log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'logid')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'LC_tbl_Log', 'column', 'logid'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '日志ID',
   'user', @CurrentUser, 'table', 'LC_tbl_Log', 'column', 'logid'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('LC_tbl_Log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'userid')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'LC_tbl_Log', 'column', 'userid'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '用户ID',
   'user', @CurrentUser, 'table', 'LC_tbl_Log', 'column', 'userid'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('LC_tbl_Log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'logtype')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'LC_tbl_Log', 'column', 'logtype'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '日志类型（1业务日志，2系统日志）',
   'user', @CurrentUser, 'table', 'LC_tbl_Log', 'column', 'logtype'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('LC_tbl_Log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'content')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'LC_tbl_Log', 'column', 'content'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '日志内容',
   'user', @CurrentUser, 'table', 'LC_tbl_Log', 'column', 'content'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('LC_tbl_Log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'logtime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'LC_tbl_Log', 'column', 'logtime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '日志时间',
   'user', @CurrentUser, 'table', 'LC_tbl_Log', 'column', 'logtime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('LC_tbl_Log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IP')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'LC_tbl_Log', 'column', 'IP'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '操作IP',
   'user', @CurrentUser, 'table', 'LC_tbl_Log', 'column', 'IP'
go

/*==============================================================*/
/* Table: LC_tbl_menu                                           */
/*==============================================================*/
create table LC_tbl_menu (
   menuid               bigint               identity,
   menuname             nvarchar(20)         null,
   menuurl              nvarchar(30)         null,
   groupid              bigint               null,
   createtime           datetime             null,
   constraint PK_LC_TBL_MENU primary key (menuid)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('LC_tbl_menu') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'LC_tbl_menu' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '权限表', 
   'user', @CurrentUser, 'table', 'LC_tbl_menu'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('LC_tbl_menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'menuid')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'LC_tbl_menu', 'column', 'menuid'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '权限ID',
   'user', @CurrentUser, 'table', 'LC_tbl_menu', 'column', 'menuid'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('LC_tbl_menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'menuname')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'LC_tbl_menu', 'column', 'menuname'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '权限名称',
   'user', @CurrentUser, 'table', 'LC_tbl_menu', 'column', 'menuname'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('LC_tbl_menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'menuurl')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'LC_tbl_menu', 'column', 'menuurl'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '权限地址',
   'user', @CurrentUser, 'table', 'LC_tbl_menu', 'column', 'menuurl'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('LC_tbl_menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'groupid')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'LC_tbl_menu', 'column', 'groupid'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '菜单组ID',
   'user', @CurrentUser, 'table', 'LC_tbl_menu', 'column', 'groupid'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('LC_tbl_menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'createtime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'LC_tbl_menu', 'column', 'createtime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'LC_tbl_menu', 'column', 'createtime'
go

/*==============================================================*/
/* Table: LC_tbl_menugroup                                      */
/*==============================================================*/
create table LC_tbl_menugroup (
   groupid              bigint               identity,
   groupname            nvarchar(20)         null,
   groupstatus          bit                  null,
   createtime           datetime             null,
   constraint PK_LC_TBL_MENUGROUP primary key (groupid)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('LC_tbl_menugroup') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'LC_tbl_menugroup' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '菜单组表', 
   'user', @CurrentUser, 'table', 'LC_tbl_menugroup'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('LC_tbl_menugroup')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'groupid')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'LC_tbl_menugroup', 'column', 'groupid'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '菜单组ID',
   'user', @CurrentUser, 'table', 'LC_tbl_menugroup', 'column', 'groupid'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('LC_tbl_menugroup')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'groupname')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'LC_tbl_menugroup', 'column', 'groupname'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '组名称',
   'user', @CurrentUser, 'table', 'LC_tbl_menugroup', 'column', 'groupname'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('LC_tbl_menugroup')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'groupstatus')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'LC_tbl_menugroup', 'column', 'groupstatus'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '组状态（0,不可用，1可用）',
   'user', @CurrentUser, 'table', 'LC_tbl_menugroup', 'column', 'groupstatus'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('LC_tbl_menugroup')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'createtime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'LC_tbl_menugroup', 'column', 'createtime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'LC_tbl_menugroup', 'column', 'createtime'
go

/*==============================================================*/
/* Table: LC_tbl_role                                           */
/*==============================================================*/
create table LC_tbl_role (
   roleid               bigint               identity,
   rolename             nvarchar(10)         null,
   dirscription         nvarchar(100)        null,
   createtime           datetime             null,
   constraint PK_LC_TBL_ROLE primary key (roleid)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('LC_tbl_role') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'LC_tbl_role' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '角色表', 
   'user', @CurrentUser, 'table', 'LC_tbl_role'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('LC_tbl_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'roleid')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'LC_tbl_role', 'column', 'roleid'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '角色ID',
   'user', @CurrentUser, 'table', 'LC_tbl_role', 'column', 'roleid'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('LC_tbl_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'rolename')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'LC_tbl_role', 'column', 'rolename'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '角色名',
   'user', @CurrentUser, 'table', 'LC_tbl_role', 'column', 'rolename'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('LC_tbl_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'dirscription')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'LC_tbl_role', 'column', 'dirscription'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '角色描述',
   'user', @CurrentUser, 'table', 'LC_tbl_role', 'column', 'dirscription'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('LC_tbl_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'createtime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'LC_tbl_role', 'column', 'createtime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '角色创建时间',
   'user', @CurrentUser, 'table', 'LC_tbl_role', 'column', 'createtime'
go

/*==============================================================*/
/* Table: LC_tbl_rolemenu                                       */
/*==============================================================*/
create table LC_tbl_rolemenu (
   rolemenuid           bigint               identity,
   roleid               bigint               null,
   menuid               bigint               null,
   createtime           datetime             null,
   constraint PK_LC_TBL_ROLEMENU primary key (rolemenuid)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('LC_tbl_rolemenu') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'LC_tbl_rolemenu' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '角色权限表', 
   'user', @CurrentUser, 'table', 'LC_tbl_rolemenu'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('LC_tbl_rolemenu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'rolemenuid')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'LC_tbl_rolemenu', 'column', 'rolemenuid'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '角色菜单ID',
   'user', @CurrentUser, 'table', 'LC_tbl_rolemenu', 'column', 'rolemenuid'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('LC_tbl_rolemenu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'roleid')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'LC_tbl_rolemenu', 'column', 'roleid'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '角色id',
   'user', @CurrentUser, 'table', 'LC_tbl_rolemenu', 'column', 'roleid'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('LC_tbl_rolemenu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'menuid')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'LC_tbl_rolemenu', 'column', 'menuid'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '菜单权限id',
   'user', @CurrentUser, 'table', 'LC_tbl_rolemenu', 'column', 'menuid'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('LC_tbl_rolemenu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'createtime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'LC_tbl_rolemenu', 'column', 'createtime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'LC_tbl_rolemenu', 'column', 'createtime'
go

/*==============================================================*/
/* Table: LC_tbl_user                                           */
/*==============================================================*/
create table LC_tbl_user (
   userid               bigint               identity,
   username             nvarchar(20)         null,
   password             nvarchar(20)         null,
   realname             nvarchar(10)         null,
   Islock               bigint               null,
   isdel                bigint               null,
   createtime           datetime             null,
   createuserid         bigint               null,
   constraint PK_LC_TBL_USER primary key (userid)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('LC_tbl_user') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'LC_tbl_user' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '用户表', 
   'user', @CurrentUser, 'table', 'LC_tbl_user'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('LC_tbl_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'userid')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'LC_tbl_user', 'column', 'userid'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '用户ID',
   'user', @CurrentUser, 'table', 'LC_tbl_user', 'column', 'userid'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('LC_tbl_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'username')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'LC_tbl_user', 'column', 'username'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '用户名',
   'user', @CurrentUser, 'table', 'LC_tbl_user', 'column', 'username'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('LC_tbl_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'password')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'LC_tbl_user', 'column', 'password'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '密码',
   'user', @CurrentUser, 'table', 'LC_tbl_user', 'column', 'password'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('LC_tbl_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'realname')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'LC_tbl_user', 'column', 'realname'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '真实姓名',
   'user', @CurrentUser, 'table', 'LC_tbl_user', 'column', 'realname'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('LC_tbl_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Islock')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'LC_tbl_user', 'column', 'Islock'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否锁定（0未锁定，1锁定）',
   'user', @CurrentUser, 'table', 'LC_tbl_user', 'column', 'Islock'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('LC_tbl_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'isdel')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'LC_tbl_user', 'column', 'isdel'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除（0未锁定，1锁定）',
   'user', @CurrentUser, 'table', 'LC_tbl_user', 'column', 'isdel'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('LC_tbl_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'createtime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'LC_tbl_user', 'column', 'createtime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'LC_tbl_user', 'column', 'createtime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('LC_tbl_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'createuserid')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'LC_tbl_user', 'column', 'createuserid'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建此账户的人ID',
   'user', @CurrentUser, 'table', 'LC_tbl_user', 'column', 'createuserid'
go

/*==============================================================*/
/* Table: LC_tbl_userrole                                       */
/*==============================================================*/
create table LC_tbl_userrole (
   userroleid           bigint               identity,
   userid               bigint               null,
   roleid               bigint               null,
   createtime           datetime             null,
   constraint PK_LC_TBL_USERROLE primary key (userroleid)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('LC_tbl_userrole') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'LC_tbl_userrole' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '用户和角色绑定表', 
   'user', @CurrentUser, 'table', 'LC_tbl_userrole'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('LC_tbl_userrole')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'userroleid')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'LC_tbl_userrole', 'column', 'userroleid'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '用户角色ID',
   'user', @CurrentUser, 'table', 'LC_tbl_userrole', 'column', 'userroleid'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('LC_tbl_userrole')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'userid')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'LC_tbl_userrole', 'column', 'userid'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '用户ID',
   'user', @CurrentUser, 'table', 'LC_tbl_userrole', 'column', 'userid'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('LC_tbl_userrole')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'roleid')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'LC_tbl_userrole', 'column', 'roleid'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '角色id',
   'user', @CurrentUser, 'table', 'LC_tbl_userrole', 'column', 'roleid'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('LC_tbl_userrole')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'createtime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'LC_tbl_userrole', 'column', 'createtime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'LC_tbl_userrole', 'column', 'createtime'
go

