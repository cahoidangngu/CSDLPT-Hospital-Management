USE [CSDN]
GO
/****** Object:  User [DNSG]    Script Date: 4/22/2024 3:34:07 PM ******/
CREATE USER [DNSG] FOR LOGIN [DNSG] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [DNSG]
GO
/****** Object:  Table [dbo].[department]    Script Date: 4/22/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[department](
	[id] [varchar](255) NOT NULL,
	[name] [nvarchar](255) NULL,
	[location_id] [varchar](255) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK__departme__3213E83F01A50C90] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doctor]    Script Date: 4/22/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doctor](
	[id] [varchar](255) NOT NULL,
	[name] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[degree] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[department_id] [varchar](255) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK__doctor__3213E83FBB1309A6] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[location]    Script Date: 4/22/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[location](
	[id] [varchar](255) NOT NULL,
	[name] [nvarchar](255) NULL,
	[address] [text] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK__location__3213E83FEE0604E9] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[patient]    Script Date: 4/22/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patient](
	[id] [varchar](255) NOT NULL,
	[name] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[dob] [date] NULL,
	[gender] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[department_id] [varchar](255) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK__patient__3213E83FE78465CE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[treatment]    Script Date: 4/22/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[treatment](
	[id] [varchar](255) NOT NULL,
	[name] [nvarchar](255) NULL,
	[description] [text] NULL,
 CONSTRAINT [PK__treatmen__3213E83F6E8ED4F3] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[treatment_record]    Script Date: 4/22/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[treatment_record](
	[id] [varchar](255) NOT NULL,
	[description] [text] NULL,
	[result] [text] NULL,
	[treatment_regime_id] [varchar](255) NOT NULL,
	[patient_id] [varchar](255) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK__treatmen__3213E83FAD93752C] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[treatment_regime]    Script Date: 4/22/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[treatment_regime](
	[id] [varchar](255) NOT NULL,
	[time] [time](7) NULL,
	[price] [float] NULL,
	[doctor_id] [varchar](255) NOT NULL,
	[treatment_id] [varchar](255) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK__treatmen__3213E83F20E8C9E4] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[department] ADD  CONSTRAINT [MSmerge_df_rowguid_6F8F2D29E5884AD29F427D31D1E37C59]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[doctor] ADD  CONSTRAINT [MSmerge_df_rowguid_BFEEBAF690B149ECBD1425ECBB495FA4]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[location] ADD  CONSTRAINT [MSmerge_df_rowguid_A41111817A9D409392D350BC9FE05BB4]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[patient] ADD  CONSTRAINT [MSmerge_df_rowguid_D1A58987CB4D4E2ABE9A5231916628D6]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[treatment_record] ADD  CONSTRAINT [MSmerge_df_rowguid_1CFE8979E573436EB8004AC2882A0DAC]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[treatment_regime] ADD  CONSTRAINT [MSmerge_df_rowguid_75A525E86EBE413CB49F2E742567173C]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[department]  WITH NOCHECK ADD  CONSTRAINT [FK__departmen__locat__286302EC] FOREIGN KEY([location_id])
REFERENCES [dbo].[location] ([id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[department] CHECK CONSTRAINT [FK__departmen__locat__286302EC]
GO
ALTER TABLE [dbo].[doctor]  WITH NOCHECK ADD  CONSTRAINT [FK__doctor__departme__2B3F6F97] FOREIGN KEY([department_id])
REFERENCES [dbo].[department] ([id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[doctor] CHECK CONSTRAINT [FK__doctor__departme__2B3F6F97]
GO
ALTER TABLE [dbo].[patient]  WITH NOCHECK ADD  CONSTRAINT [FK__patient__departm__2E1BDC42] FOREIGN KEY([department_id])
REFERENCES [dbo].[department] ([id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[patient] CHECK CONSTRAINT [FK__patient__departm__2E1BDC42]
GO
ALTER TABLE [dbo].[treatment_record]  WITH NOCHECK ADD  CONSTRAINT [FK__treatment__patie__35BCFE0A] FOREIGN KEY([patient_id])
REFERENCES [dbo].[patient] ([id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[treatment_record] CHECK CONSTRAINT [FK__treatment__patie__35BCFE0A]
GO
ALTER TABLE [dbo].[treatment_record]  WITH NOCHECK ADD  CONSTRAINT [FK__treatment__treat__34C8D9D1] FOREIGN KEY([treatment_regime_id])
REFERENCES [dbo].[treatment_regime] ([id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[treatment_record] CHECK CONSTRAINT [FK__treatment__treat__34C8D9D1]
GO
ALTER TABLE [dbo].[treatment_regime]  WITH NOCHECK ADD  CONSTRAINT [FK__treatment__docto__30F848ED] FOREIGN KEY([doctor_id])
REFERENCES [dbo].[doctor] ([id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[treatment_regime] CHECK CONSTRAINT [FK__treatment__docto__30F848ED]
GO
/****** Object:  StoredProcedure [dbo].[sp_MSdel_dbotreatment]    Script Date: 4/22/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_MSdel_dbotreatment]
		@pkc1 varchar(255)
as
begin  
	declare @primarykey_text nvarchar(100) = ''
	delete [dbo].[treatment] 
	where [id] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
		Begin
			if exists (Select * from sys.all_parameters where object_id = OBJECT_ID('sp_MSreplraiserror') and [name] = '@param3')
			Begin
				
				set @primarykey_text = @primarykey_text + '[id] = ' + convert(nvarchar(100),@pkc1,1)
				exec sp_MSreplraiserror @errorid=20598, @param1=N'[dbo].[treatment]', @param2=@primarykey_text, @param3=13234 
			End
			Else
				exec sp_MSreplraiserror @errorid=20598
		End
end  
GO
/****** Object:  StoredProcedure [dbo].[sp_MSins_dbotreatment]    Script Date: 4/22/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_MSins_dbotreatment]
    @c1 varchar(255),
    @c2 nvarchar(255),
    @c3 text
as
begin  
	insert into [dbo].[treatment] (
		[id],
		[name],
		[description]
	) values (
		@c1,
		@c2,
		@c3	) 
end  
GO
/****** Object:  StoredProcedure [dbo].[sp_MSupd_dbotreatment]    Script Date: 4/22/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_MSupd_dbotreatment]
		@c1 varchar(255) = NULL,
		@c2 nvarchar(255) = NULL,
		@c3 text = NULL,
		@pkc1 varchar(255) = NULL,
		@bitmap binary(1)
as
begin  
	declare @primarykey_text nvarchar(100) = ''
if (substring(@bitmap,1,1) & 1 = 1)
begin 
update [dbo].[treatment] set
		[id] = case substring(@bitmap,1,1) & 1 when 1 then @c1 else [id] end,
		[name] = case substring(@bitmap,1,1) & 2 when 2 then @c2 else [name] end,
		[description] = case substring(@bitmap,1,1) & 4 when 4 then @c3 else [description] end
	where [id] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
		Begin
			if exists (Select * from sys.all_parameters where object_id = OBJECT_ID('sp_MSreplraiserror') and [name] = '@param3')
			Begin
				
				set @primarykey_text = @primarykey_text + '[id] = ' + convert(nvarchar(100),@pkc1,1)
				exec sp_MSreplraiserror @errorid=20598, @param1=N'[dbo].[treatment]', @param2=@primarykey_text, @param3=13233 
			End
			Else
				exec sp_MSreplraiserror @errorid=20598
		End
end  
else
begin 
update [dbo].[treatment] set
		[name] = case substring(@bitmap,1,1) & 2 when 2 then @c2 else [name] end,
		[description] = case substring(@bitmap,1,1) & 4 when 4 then @c3 else [description] end
	where [id] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
		Begin
			if exists (Select * from sys.all_parameters where object_id = OBJECT_ID('sp_MSreplraiserror') and [name] = '@param3')
			Begin
				
				set @primarykey_text = @primarykey_text + '[id] = ' + convert(nvarchar(100),@pkc1,1)
				exec sp_MSreplraiserror @errorid=20598, @param1=N'[dbo].[treatment]', @param2=@primarykey_text, @param3=13233 
			End
			Else
				exec sp_MSreplraiserror @errorid=20598
		End
end 
end 
GO
