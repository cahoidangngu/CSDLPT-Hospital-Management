USE [CSSG]
GO
/****** Object:  User [SGDN]    Script Date: 4/22/2024 3:32:55 PM ******/
CREATE USER [SGDN] FOR LOGIN [SGDN] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [SGDN]
GO
/****** Object:  Table [dbo].[department]    Script Date: 4/22/2024 3:32:55 PM ******/
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
/****** Object:  Table [dbo].[doctor]    Script Date: 4/22/2024 3:32:55 PM ******/
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
/****** Object:  Table [dbo].[location]    Script Date: 4/22/2024 3:32:55 PM ******/
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
/****** Object:  Table [dbo].[patient]    Script Date: 4/22/2024 3:32:55 PM ******/
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
/****** Object:  Table [dbo].[treatment]    Script Date: 4/22/2024 3:32:55 PM ******/
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
/****** Object:  Table [dbo].[treatment_record]    Script Date: 4/22/2024 3:32:55 PM ******/
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
/****** Object:  Table [dbo].[treatment_regime]    Script Date: 4/22/2024 3:32:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[admin_doctor]    Script Date: 4/22/2024 3:32:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[admin_doctor]
	@location nvarchar(255),
	@doctorId nvarchar(255)
as
begin
	set xact_abort on
	begin try
		begin transaction
			declare @TableName nvarchar(255);
			declare @sql nvarchar(1000);

			set @TableName =
			case 
				when @location = 'saigon' then 'SG'
				when @location = 'danang' then 'DN'
				when @location = 'main' then ''
			end
  

		
		SELECT A.*
		FROM [CSSG].[dbo].doctor AS A
		WHERE A.id LIKE '%' + @TableName + '%' AND A.id LIKE '%' + @doctorId + '%'
		UNION ALL
		SELECT B.*
		FROM [LINH_TO_SERVER_NAM].[CSDN].[dbo].doctor AS B
		WHERE B.id LIKE '%' + @TableName + '%' AND B.id LIKE '%' + @doctorId + '%'
		
		commit
	end try
	begin catch
		print('Error: '+Error_message())
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[admin_doctor_add]    Script Date: 4/22/2024 3:32:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[admin_doctor_add] 
		@location nvarchar(255),
		@doctorId NVARCHAR(255),
		@name nvarchar(255),
		@address nvarchar(255),
		@degree nvarchar(255),
		@phone nvarchar(255),
		@departmentId nvarchar(255)
as
begin
set xact_abort on
begin try
	begin transaction;
		declare @Exists nvarchar(255);
		declare @TableName Nvarchar(255);
		Declare @sql nvarchar(1000);

		

		set @TableName = 
			CASE 
				when @location = 'saigon' then '[CSSG].[dbo].[doctor]'
				when @location = 'danang' then '[LINH_TO_SERVER_NAM].[CSDN].[dbo].[doctor]'
			end
		
		set @sql = 'select TOP 1 @Exists = id from ' + @TableName + ' where id = @doctorId';
		EXEC sp_executesql @sql,  N'@doctorId NVARCHAR(255), @Exists nvarchar(255) OUTPUT', @doctorId, @Exists OUTPUT;


		-- kiểm tra xem patient có trong cơ sở không
		if @Exists is null
			begin
				print 'Chưa có bác sĩ trong cơ sở dữ liệu';
				set @sql = CONCAT(
				'INSERT INTO ', @Tablename ,' (id, name, address, phone, department_id, degree) 
				VALUES 
				(CASE WHEN ''',  @doctorId, ''' <> '''' THEN ''', @doctorId, ''' ELSE null END,
				CASE WHEN ''',  @name, ''' <> '''' THEN ''', @name, ''' ELSE null END,
				CASE WHEN ''', @address,''' <> '''' THEN ''', @address, ''' ELSE null END,
				CASE WHEN ''', @phone, ''' <> '''' THEN ''', @phone, ''' ELSE null END,
				CASE WHEN ''', @departmentId, ''' <> '''' THEN ''', @departmentId, ''' ELSE null END,
				CASE WHEN ''', @degree, ''' <> '''' THEN ''', @degree, ''' ELSE null END)');
				print(@sql);
				EXEC sp_executesql @sql;

				set @sql = 'select * from ' + @TableName + ' where id = @doctorId';
				EXEC sp_executesql @sql,  N'@doctorId NVARCHAR(255)', @doctorId;
			end
		else
			begin
				print 'Đã tồn tại bác sĩ trong cơ sở dữ liệu'
			end
		commit
end try
begin catch
	if @@TRANCOUNT > 0
		rollback transaction
	print 'Error ' + ERROR_MESSAGE();
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[admin_doctor_del]    Script Date: 4/22/2024 3:32:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[admin_doctor_del]
	@doctorId nvarchar(255)
as
begin
	set xact_abort on
	begin try
		begin transaction
			
  
		DELETE FROM [CSSG].[dbo].doctor where id = @doctorId;
		DELETE FROM [LINH_TO_SERVER_NAM].[CSDN].[dbo].doctor where id = @doctorId;
		
		commit
	end try
	begin catch
		print('Error: '+Error_message())
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[admin_patient]    Script Date: 4/22/2024 3:32:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[admin_patient]
	@location nvarchar(255),
	@patientId nvarchar(255)
as
begin
	set xact_abort on
	begin try
		begin transaction
			declare @TableName nvarchar(255);
			declare @sql nvarchar(1000);

			set @TableName =
			case 
				when @location = 'saigon' then 'SG'
				when @location = 'danang' then 'DN'
				when @location = 'main' then ''
			end
  

		
		SELECT A.*
		FROM [CSSG].[dbo].patient AS A
		WHERE A.id LIKE '%' + @TableName + '%' AND A.id LIKE '%' + @patientId + '%'
		UNION ALL
		SELECT B.*
		FROM [LINH_TO_SERVER_NAM].[CSDN].[dbo].patient AS B
		WHERE B.id LIKE '%' + @TableName + '%' AND B.id LIKE '%' + @patientId + '%'
		
		commit
	end try
	begin catch
		print('Error: '+Error_message())
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[admin_patient_add]    Script Date: 4/22/2024 3:32:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[admin_patient_add] 
		@location nvarchar(255),
		@patientId NVARCHAR(255),
		@name nvarchar(255),
		@address nvarchar(255),
		@phone nvarchar(255),
		@departmentId nvarchar(255),
		@dob date,
		@gender nvarchar(255)
as
begin
set xact_abort on
begin try
	begin transaction;
		declare @Exists nvarchar(255);
		declare @TableName Nvarchar(255);
		Declare @sql nvarchar(1000);

		

		set @TableName = 
			CASE 
				when @location = 'saigon' then '[CSSG].[dbo].[patient]'
				when @location = 'danang' then '[LINH_TO_SERVER_NAM].[CSDN].[dbo].[patient]'
			end
		
		set @sql = 'select TOP 1 @Exists = id from ' + @TableName + ' where id = @patientId';
		EXEC sp_executesql @sql,  N'@patientId NVARCHAR(255), @Exists nvarchar(255) OUTPUT', @patientId, @Exists OUTPUT;


		-- kiểm tra xem patient có trong cơ sở không
		if @Exists is null
			begin
				print 'Chưa có bệnh nhân trong cơ sở dữ liệu';
				set @sql = CONCAT(
				'INSERT INTO ', @Tablename ,' (id, name, address, phone, department_id, dob, gender ) 
				VALUES 
				(CASE WHEN ''',  @patientId, ''' <> '''' THEN ''', @patientId, ''' ELSE null END,
				CASE WHEN ''',  @name, ''' <> '''' THEN ''', @name, ''' ELSE null END,
				CASE WHEN ''', @address,''' <> '''' THEN ''', @address, ''' ELSE null END,
				CASE WHEN ''', @phone, ''' <> '''' THEN ''', @phone, ''' ELSE null END,
				CASE WHEN ''', @departmentId, ''' <> '''' THEN ''', @departmentId, ''' ELSE null END,
				CASE WHEN ''', @dob, ''' <> '''' THEN ''', @dob, ''' ELSE null END,
				CASE WHEN ''', @gender, ''' <> '''' THEN ''', @gender, ''' ELSE null END)');
				EXEC sp_executesql @sql;

				set @sql = 'select * from ' + @TableName + ' where id = @patientId';
				EXEC sp_executesql @sql,  N'@patientId NVARCHAR(255)', @patientId;
			end
		else
			begin
				print 'Đã tồn tại bệnh nhân trong cơ sở dữ liệu'
			end
		commit
end try
begin catch
	if @@TRANCOUNT > 0
		rollback transaction
	print 'Error ' + ERROR_MESSAGE();
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[admin_patient_del]    Script Date: 4/22/2024 3:32:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[admin_patient_del]
	@patientId nvarchar(255)
as
begin
	set xact_abort on
	begin try
		begin transaction
			
  
		DELETE FROM [CSSG].[dbo].patient where id = @patientId;
		DELETE FROM [LINH_TO_SERVER_NAM].[CSDN].[dbo].patient where id = @patientId;
		
		commit
	end try
	begin catch
		print('Error: '+Error_message())
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[admin_treatment]    Script Date: 4/22/2024 3:32:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[admin_treatment]
	@treatmentId nvarchar(255)
as
begin
	set xact_abort on
	begin try
		begin transaction
 
		SELECT *
		FROM [CSSG].[dbo].treatment AS A
		WHERE id LIKE '%' + @treatmentId + '%'
		
		commit
	end try
	begin catch
		print('Error: '+Error_message())
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[admin_treatment_add]    Script Date: 4/22/2024 3:32:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[admin_treatment_add]
	@treatmentId nvarchar(255),
	@name nvarchar(255),
	@description nvarchar(1000)
as
begin
	set xact_abort on
	begin try
		begin transaction
		declare @Exists nvarchar(255)

		SELECT @Exists = id FROM [CSSG].[dbo].treatment WHERE id = @treatmentId;
		
		if @Exists is null
			begin
				print 'Chưa có điều trị trong cơ sở dữ liệu';
				
				INSERT INTO [CSSG].[dbo].treatment (id, name, description) 
				VALUES 
				(CASE WHEN @treatmentId <> '' THEN @treatmentId ELSE null END,
				CASE WHEN  @name <> '' THEN  @name  ELSE null END,
				CASE WHEN @description <> '' THEN @description ELSE null END);

			SELECT * FROM [CSSG].[dbo].treatment WHERE id = @treatmentId;
				
			end
		else
			begin
				print 'Đã tồn tại điều trị trong cơ sở dữ liệu'
			end

		commit
	end try
	begin catch
		print('Error: '+Error_message())
	end catch
end

EXEC admin_treatment_add 'T009', 'test', '';
GO
/****** Object:  StoredProcedure [dbo].[doctor_login]    Script Date: 4/22/2024 3:32:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[doctor_login] 
	@username VARCHAR(255),
	@password VARCHAR(255)
AS 
BEGIN
	SELECT * FROM doctor WHERE @username = id AND @password = id
END
GO
/****** Object:  StoredProcedure [dbo].[doctor_patient]    Script Date: 4/22/2024 3:32:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[doctor_patient] 
	@location nvarchar(255),
	@doctorId nvarchar(255),
	@patientId nvarchar(255)
as
begin
set xact_abort on 
begin try
	begin transaction
		declare @Exits nvarchar(255);
		declare @TableName nvarchar(255);
		declare @sql nvarchar(1000);

		set @TableName =
			case 
				when @location = 'saigon' then '[CSSG].[dbo].'
				when @location = 'danang' then '[LINH_TO_SERVER_NAM].[CSDN].[dbo].'
			end

		set @sql = 'SELECT TOP 1 @Exits = id from '+ @TableName+'doctor where id = @doctorId';
		exec sp_executesql @sql, N'@doctorId nvarchar(255), @Exits nvarchar(255) output', @doctorId, @Exits output;  

		if @Exits is not null
			begin
				print('Tìm thấy bác sĩ trong cơ sở dữ liệu')
				set @sql = CONCAT(
					'Select patient.* from ', @TableName ,'patient 
						inner join (
							select treatment_record.patient_id
								from ', @TableName,'treatment_record 
								inner join ', @TableName ,'treatment_regime 
								on treatment_record.treatment_regime_id = treatment_regime.id 
									where treatment_regime.doctor_id = ''',@doctorId,'''
									and treatment_record.patient_id like ''%', @patientId,'%'') as doctor_patient_table 
						on patient.id = doctor_patient_table.patient_id');
				exec sp_executesql @sql;
			end
		else
			begin
				print('Không tìm thấy bác sĩ trong cơ sở dữ liệu')
			end
	
	commit
end try
begin catch
	if @@TRANCOUNT > 0
		rollback transaction
		print('Error:' + ERROR_MESSAGE())
end catch 
end
GO
/****** Object:  StoredProcedure [dbo].[patient_login]    Script Date: 4/22/2024 3:32:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[patient_login] 
	@username VARCHAR(255),
	@password VARCHAR(255)
AS 
BEGIN
	SELECT * FROM patient WHERE @username = id AND @password = id
END
GO
/****** Object:  StoredProcedure [dbo].[patient_result]    Script Date: 4/22/2024 3:32:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- transaction tính toán số tiền bệnh nhân phải trả 
CREATE PROCEDURE [dbo].[patient_result]
	@location VARCHAR(255),
	@patientId VARCHAR(255)
AS
	BEGIN
		declare @price float
		declare @birth date
		declare @TableName Nvarchar(255)
		Declare @sql nvarchar(500)

		set @TableName = 
			CASE 
				when @location = 'saigon' then '[CSSG].[dbo].'
				when @location = 'danang' then '[LINH_TO_SERVER_NAM].[CSDN].[dbo].'
			end
		

	 	SET @sql = 'SELECT @birth = dob FROM ' + @TableName + '[patient] WHERE id =  ''' + @patientId + '''';

		EXEC sp_executesql @sql, N'@patientId NVARCHAR(255), @birth DATE OUTPUT', @patientId, @birth OUTPUT;


		-- kiểm tra xem patient đó có trong cơ sở không
			if @birth is null
			begin
				print 'Không tìm thấy bệnh nhân trong cơ sở dữ liệu'
				rollback
			end
			else 
			set @sql = CONCAT('SELECT treatment_record.patient_id,
                            treatment_record.description,
                            treatment_record.result,
                            treatment_regime.price
                           FROM ', @TableName, 'treatment_record
                           INNER JOIN ', @TableName, 'treatment_regime ON treatment_record.treatment_regime_id = treatment_regime.id
                           WHERE patient_id = ''', @patientId, '''');

			begin
				declare @Records TABLE(
					patient_id nvarchar(255),
					description nvarchar(255),
					result nvarchar(255),
					price int
				)
			insert into @Records(patient_id, description, result ,price)
			EXEC(@sql)

				-- in ra thống kê đó
			select * from @Records
				-- tính toán tổng tiền của bệnh nhân đó
				set @price = (select sum(price) from @Records)
				-- truy vấn số tuổi của bệnh nhân để bảo hiểm chi trả
				-- 1980 - 1989: 10%
				-- 1990 - 1999: 12%
				-- 2000 - nay: 15%
				if YEAR(@birth) between 1980 and 1989
					begin
						set @price = @price * 90/100
					end
				else if YEAR(@birth) between 1990 and 1999
					begin
						set @price = @price * 88/100
					end
				else if YEAR(@birth) > 2000
					begin
						set @price = @price * 85/100
					end
				print 'Tổng số tiền bệnh nhân phải trả là: ' + CAST(@price as nvarchar(255));
			end
		END
GO
/****** Object:  StoredProcedure [dbo].[sp_MSdel_dbotreatment]    Script Date: 4/22/2024 3:32:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_MSins_dbotreatment]    Script Date: 4/22/2024 3:32:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_MSupd_dbotreatment]    Script Date: 4/22/2024 3:32:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[update_doctor_location]    Script Date: 4/22/2024 3:32:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- transaction update doctor
CREATE PROCEDURE [dbo].[update_doctor_location] 
		@location nvarchar(255),
		@doctorId NVARCHAR(255),
		@name nvarchar(255),
		@address nvarchar(255),
		@degree nvarchar(255),
		@phone nvarchar(255),
		@departmentId nvarchar(255)
as
begin
set xact_abort on
begin try
	begin transaction;
		declare @Exists nvarchar(255);
		declare @TableName Nvarchar(255);
		Declare @sql nvarchar(1000);

		

		set @TableName = 
			CASE 
				when @location = 'saigon' then '[CSSG].[dbo].[doctor]'
				when @location = 'danang' then '[LINH_TO_SERVER_NAM].[CSDN].[dbo].[doctor]'
			end
		
		set @sql = 'select TOP 1 @Exists = id from ' + @TableName + ' where id = @doctorId';
		EXEC sp_executesql @sql,  N'@doctorId NVARCHAR(255), @Exists nvarchar(255) OUTPUT', @doctorId, @Exists OUTPUT;


		-- kiểm tra xem patient có trong cơ sở không
		if @Exists is not null
			begin
				print 'Có bác sĩ trong cơ sở dữ liệu';
				set @sql = CONCAT(
				'UPDATE ', @Tablename ,' 
				SET
				name = CASE WHEN ''',  @name, ''' <> '''' THEN ''', @name, ''' ELSE name END,
				address = CASE WHEN ''', @address,''' <> '''' THEN ''', @address, ''' ELSE address END,
				phone = CASE WHEN ''', @phone, ''' <> '''' THEN ''', @phone, ''' ELSE phone END,
				department_id = CASE WHEN ''', @departmentId, ''' <> '''' THEN ''', @departmentId, ''' ELSE department_id END,
				degree = CASE WHEN ''', @degree, ''' <> '''' THEN ''', @degree, ''' ELSE degree END
				WHERE id = ''', @doctorId,'''');
				print(@sql);
				EXEC sp_executesql @sql;

				set @sql = 'select * from ' + @TableName + ' where id = @doctorId';
				EXEC sp_executesql @sql,  N'@doctorId NVARCHAR(255)', @doctorId;
			end
		else
			begin
				print 'Không tìm thấy bác sĩ trong cơ sở dữ liệu'
			end
		commit
end try
begin catch
	if @@TRANCOUNT > 0
		rollback transaction
	print 'Error ' + ERROR_MESSAGE();
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[update_patient_location]    Script Date: 4/22/2024 3:32:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- transaction update patient
CREATE PROCEDURE [dbo].[update_patient_location] 
		@location nvarchar(255),
		@patientId NVARCHAR(255),
		@name nvarchar(255),
		@address nvarchar(255),
		@phone nvarchar(255),
		@departmentId nvarchar(255),
		@dob date,
		@gender nvarchar(255)
as
begin
set xact_abort on
begin try
	begin transaction;
		declare @Exists nvarchar(255);
		declare @TableName Nvarchar(255);
		Declare @sql nvarchar(1000);

		

		set @TableName = 
			CASE 
				when @location = 'saigon' then '[CSSG].[dbo].[patient]'
				when @location = 'danang' then '[LINH_TO_SERVER_NAM].[CSDN].[dbo].[patient]'
			end
		
		set @sql = 'select TOP 1 @Exists = id from ' + @TableName + ' where id = @patientId';
		EXEC sp_executesql @sql,  N'@patientId NVARCHAR(255), @Exists nvarchar(255) OUTPUT', @patientId, @Exists OUTPUT;


		-- kiểm tra xem patient có trong cơ sở không
		if @Exists is not null
			begin
				print 'Có bệnh nhân trong cơ sở dữ liệu';
				set @sql = CONCAT(
				'UPDATE ', @Tablename ,' 
				SET
				name = CASE WHEN ''',  @name, ''' <> '''' THEN ''', @name, ''' ELSE name END,
				address = CASE WHEN ''', @address,''' <> '''' THEN ''', @address, ''' ELSE address END,
				phone = CASE WHEN ''', @phone, ''' <> '''' THEN ''', @phone, ''' ELSE phone END,
				department_id = CASE WHEN ''', @departmentId, ''' <> '''' THEN ''', @departmentId, ''' ELSE department_id END,
				dob = CASE WHEN ''', @dob, ''' IS NOT NULL THEN ''', @dob, ''' ELSE dob END,
				gender = CASE WHEN ''',@gender, ''' <> '''' THEN ''', @gender, ''' ELSE gender END
				WHERE id = ''', @patientId,'''');
				EXEC(@sql)

				set @sql = 'select * from ' + @TableName + ' where id = @patientId';
				EXEC sp_executesql @sql,  N'@patientId NVARCHAR(255)', @patientId;
			end
		else
			begin
				print 'Không tìm thấy bệnh nhân trong cơ sở dữ liệu'
			end
		commit
end try
begin catch
	if @@TRANCOUNT > 0
		rollback transaction
	print 'Error ' + ERROR_MESSAGE();
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[update_treatment]    Script Date: 4/22/2024 3:32:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[update_treatment]
	@treatmentId nvarchar(255),
	@name nvarchar(255),
	@description nvarchar(1000)
as
begin
	set xact_abort on
	begin try
		begin transaction
 
		UPDATE [CSSG].[dbo].treatment
		SET name = CASE WHEN @name <> '' THEN @name ELSE name END,
		description = CASE WHEN @description <> '' THEN @description ELSE description END 
		WHERE id = @treatmentId 

		SELECT * FROM [CSSG].[dbo].treatment WHERE id = @treatmentId;
		
		commit
	end try
	begin catch
		print('Error: '+Error_message())
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[user_login]    Script Date: 4/22/2024 3:32:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[user_login]
	@role NVARCHAR(255),	
	@location NVARCHAR(255),
	@username NVARCHAR(255),
	@password NVARCHAR(255)
AS
BEGIN
	DECLARE @sql NVARCHAR(MAX)

	IF @location = 'saigon'
	BEGIN
		SET @sql = 'SELECT * FROM [CSSG].[dbo].' + QUOTENAME(@role) + ' WHERE id = @username AND id = @password'
		EXEC sp_executesql @sql, N'@username NVARCHAR(255), @password NVARCHAR(255)', @username, @password
	END
	ELSE IF @location = 'danang'
	BEGIN
		SET @sql = 'SELECT * FROM [LINH_TO_SERVER_NAM].[CSDN].[dbo].' + QUOTENAME(@role) + ' WHERE id = @username AND id = @password'
		EXEC sp_executesql @sql, N'@username NVARCHAR(255), @password NVARCHAR(255)', @username, @password
	END
END
GO
