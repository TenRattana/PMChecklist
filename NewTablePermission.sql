USE [m_checklist_dev]
GO
/****** Object:  UserDefinedFunction [dbo].[SplitString]    Script Date: 1/12/2025 11:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SplitString]
(
    @String NVARCHAR(MAX),
    @Delimiter CHAR(1)
)
RETURNS @Result TABLE (Value NVARCHAR(MAX))
AS
BEGIN
    DECLARE @Start INT, @End INT
    SET @Start = 1
    SET @End = CHARINDEX(@Delimiter, @String)

    WHILE @Start <= LEN(@String)
    BEGIN
        IF @End = 0 
            SET @End = LEN(@String) + 1

        INSERT INTO @Result (Value)
        VALUES (SUBSTRING(@String, @Start, @End - @Start))

        SET @Start = @End + 1
        SET @End = CHARINDEX(@Delimiter, @String, @Start)
    END

    RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[GetApporvedInPage]    Script Date: 1/12/2025 11:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetApporvedInPage]
    @PageIndex INT = NULL,
    @PageSize INT = NULL,
	@ID NVARCHAR(9) = NULL
AS
BEGIN
	IF @ID IS NOT NULL AND @ID <> ''
	BEGIN 
        ;WITH ApporvedData AS (
            SELECT 
                er.TableID, 
                m.MachineID,
                m.MachineName, 
                f.FormID, 
                f.FormName,
                er.UserID, 
                er.ApporvedID,
                er.Status, 
                er.CreateDate,
				u.UserName,
                ROW_NUMBER() OVER (
                    ORDER BY 
                        er.CreateDate DESC, 
                        CAST(SUBSTRING(er.TableID, PATINDEX('%[0-9]%', er.TableID), LEN(er.TableID)) AS INT) DESC
                ) AS RowNum
            FROM 
                ExpectedResults AS er
            INNER JOIN 
                Machines AS m ON m.MachineID = er.MachineID 
            INNER JOIN
                Forms AS f ON f.FormID = er.FormID 
			INNER JOIN
				Users as u on u.UserID = er.UserID
            WHERE 
                er.Status = 'False' 
                AND er.TableID = @ID
			Group BY  
				er.TableID , 
				m.MachineID,
				m.MachineName, 
				f.FormID, 
				f.FormName, 
				er.UserID, 
				er.CreateDate ,
				er.ApporvedID ,
				er.Status ,
				u.UserName
        )
        SELECT * 
        FROM ApporvedData;
    END

	ELSE IF @PageIndex IS NOT NULL AND @PageSize IS NOT NULL
	BEGIN
		DECLARE @Offset INT = @PageIndex * @PageSize;

		;WITH ApporvedData AS (
			SELECT 
				er.TableID , 
				m.MachineID ,
				m.MachineName , 
				f.FormID , 
				f.FormName ,
				er.UserID, 
				er.ApporvedID ,
				er.Status, 
				er.CreateDate,
				u.UserName,
				ROW_NUMBER() OVER (
					ORDER BY 
						er.CreateDate DESC, 
						CAST(SUBSTRING(er.TableID, PATINDEX('%[0-9]%', er.TableID), LEN(er.TableID)) AS INT) DESC
				) AS RowNum
			FROM 
				ExpectedResults As er
			INNER JOIN 
				Machines as m on m.MachineID = er.MachineID 
			INNER JOIN
				Forms as f on f.FormID = er.FormID 
			INNER JOIN
				Users as u on u.UserID = er.UserID
			WHERE er.Status = 'False' 
			Group BY  
				er.TableID , 
				m.MachineID,
				m.MachineName, 
				f.FormID, 
				f.FormName, 
				er.UserID, 
				er.CreateDate ,
				er.ApporvedID ,
				er.Status ,
				u.UserName
		)
		SELECT * 
		FROM ApporvedData 
		WHERE RowNum > @Offset AND RowNum <= (@Offset + @PageSize);
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetCheckListInForm]    Script Date: 1/12/2025 11:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCheckListInForm]
    @ID NVARCHAR(MAX)
AS
BEGIN
    IF @ID IS NOT NULL AND @ID <> ''
    BEGIN
        ;WITH CheckListData AS (
            SELECT 
                cl.CListID,
                cl.CListName,
                cl.IsActive,
                CASE WHEN COUNT(mcl.CListID) > 0 THEN 1 ELSE 0 END AS Disables
            FROM 
                CheckLists AS cl
            LEFT JOIN 
                MatchCheckList AS mcl ON mcl.CListID = cl.CListID
            WHERE 
                cl.CListID IN (SELECT Value FROM dbo.SplitString(@ID, ','))
            GROUP BY 
                cl.CListID,
                cl.CListName,
                cl.IsActive
        )
        SELECT * 
        FROM CheckListData; 
    END
END
GO
/****** Object:  StoredProcedure [dbo].[GetCheckListInPage]    Script Date: 1/12/2025 11:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCheckListInPage]
      @PageIndex INT = NULL,
    @PageSize INT = NULL,
    @ID NVARCHAR(9) = NULL
AS
BEGIN
    IF @ID IS NOT NULL AND @ID <> ''
    BEGIN
        ;WITH CheckListData AS (
            SELECT 
                cl.CListID,
                cl.CListName,
                cl.IsActive,
                CASE WHEN COUNT(mcl.CListID) > 0 THEN 1 ELSE 0 END AS Disables,
                ROW_NUMBER() OVER (
                    ORDER BY 
                        cl.IsActive DESC, 
                        CAST(SUBSTRING(cl.CListID, PATINDEX('%[0-9]%', cl.CListID), LEN(cl.CListID)) AS INT) DESC
                ) AS RowNum
            FROM 
                CheckLists As cl
            LEFT JOIN 
                MatchCheckList AS mcl ON mcl.CListID = cl.CListID
            WHERE 
                cl.CListID = @ID
            GROUP BY 
                cl.CListID,
                cl.CListName,
                cl.IsActive
        )
        SELECT * 
        FROM CheckListData 
        WHERE RowNum = 1; 
    END
    ELSE IF @PageIndex IS NOT NULL AND @PageSize IS NOT NULL
    BEGIN
        DECLARE @Offset INT = @PageIndex * @PageSize;

        ;WITH CheckListData AS (
            SELECT 
                cl.CListID,
                cl.CListName,
                cl.IsActive,
                CASE WHEN COUNT(mcl.CListID) > 0 THEN 1 ELSE 0 END AS Disables,
                ROW_NUMBER() OVER (
                    ORDER BY 
                        cl.IsActive DESC, 
                        CAST(SUBSTRING(cl.CListID, PATINDEX('%[0-9]%', cl.CListID), LEN(cl.CListID)) AS INT) DESC
                ) AS RowNum
            FROM 
                CheckLists As cl
            LEFT JOIN 
                MatchCheckList AS mcl ON mcl.CListID = cl.CListID
            GROUP BY 
                cl.CListID,
                cl.CListName,
                cl.IsActive
        )
        SELECT * 
        FROM CheckListData 
        WHERE RowNum > @Offset AND RowNum <= (@Offset + @PageSize);
    END
END
GO
/****** Object:  StoredProcedure [dbo].[GetCheckListOptionInPage]    Script Date: 1/12/2025 11:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCheckListOptionInPage]
     @PageIndex INT = NULL,
    @PageSize INT = NULL,
    @ID NVARCHAR(9) = NULL
AS
BEGIN
	IF @ID IS NOT NULL AND @ID <> ''
	BEGIN
	;WITH CheckListOptionData AS (
			SELECT 
				 clo.CLOptionID, 
				 clo.CLOptionName,
				 clo.IsActive,
				 CASE WHEN COUNT(CASE WHEN mclo.IsActive = 'True' THEN 1 END) > 0 THEN 1 ELSE 0 END AS Disables ,
				ROW_NUMBER() OVER (
					ORDER BY 
						clo.IsActive DESC, 
						CAST(SUBSTRING(clo.CLOptionID, PATINDEX('%[0-9]%', clo.CLOptionID), LEN(clo.CLOptionID)) AS INT) DESC
				) AS RowNum
			From 
				CheckListOptions As clo 
			LEFT JOIN 
				MatchCheckListOption AS mclo ON mclo.CLOptionID = clo.CLOptionID 
			WHERE
				clo.CLOptionID = @ID
			Group By 
				clo.CLOptionID, 
				clo.CLOptionName, 
				clo.IsActive  
		)
		SELECT * 
		FROM CheckListOptionData 
	END
	ELSE IF @PageIndex IS NOT NULL AND @PageSize IS NOT NULL
	BEGIN
		DECLARE @Offset INT = @PageIndex * @PageSize;

		;WITH CheckListOptionData AS (
			SELECT 
				 clo.CLOptionID, 
				 clo.CLOptionName,
				 clo.IsActive,
				 CASE WHEN COUNT(CASE WHEN mclo.IsActive = 'True' THEN 1 END) > 0 THEN 1 ELSE 0 END AS Disables ,
				ROW_NUMBER() OVER (
					ORDER BY 
						clo.IsActive DESC, 
						CAST(SUBSTRING(clo.CLOptionID, PATINDEX('%[0-9]%', clo.CLOptionID), LEN(clo.CLOptionID)) AS INT) DESC
				) AS RowNum
			From 
				CheckListOptions As clo 
			LEFT JOIN 
				MatchCheckListOption AS mclo ON mclo.CLOptionID = clo.CLOptionID 
			Group By 
				clo.CLOptionID, 
				clo.CLOptionName, 
				clo.IsActive  
		)
		SELECT * 
		FROM CheckListOptionData 
		WHERE RowNum > @Offset AND RowNum <= (@Offset + @PageSize);
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetExpectedResultInPage]    Script Date: 1/12/2025 11:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetExpectedResultInPage]
    @PageIndex INT = NULL,
    @PageSize INT = NULL,
	@ID NVARCHAR(9) = NULL
AS
BEGIN
	IF @ID IS NOT NULL AND @ID <> ''
	BEGIN
    ;WITH ExpedtedResultData AS (
        SELECT 
		er.TableID, 
		m.MachineID,
		m.MachineName, 
		f.FormID, 
		f.FormName,
		er.UserID, 
		er.ApporvedID,
		er.ApporvedTime,
		er.Status, 
		MAX(er.CreateDate) AS CreateDate, 
		u.UserName,
		(au.UserName) AS ApporvedName,
		ROW_NUMBER() OVER (
			ORDER BY 
				MAX(er.CreateDate) DESC, 
				CAST(SUBSTRING(er.TableID, PATINDEX('%[0-9]%', er.TableID), LEN(er.TableID)) AS INT) DESC
		) AS RowNum
	FROM 
		ExpectedResults AS er
	INNER JOIN 
		Machines AS m ON m.MachineID = er.MachineID 
	INNER JOIN
		Forms AS f ON f.FormID = er.FormID 
	INNER JOIN
		Users AS u ON u.UserID = er.UserID
	LEFT JOIN
		Users AS au ON au.UserID = er.ApporvedID
	WHERE
		er.Status = 'True'
	GROUP BY  
		er.TableID, 
		m.MachineID,
		m.MachineName, 
		f.FormID, 
		f.FormName, 
		er.UserID, 
		er.ApporvedID,
		er.ApporvedTime,
		er.Status,
		u.UserName,
		au.UserName

	)
    SELECT * 
    FROM ExpedtedResultData 
	END
	ELSE IF @PageIndex IS NOT NULL AND @PageSize IS NOT NULL
	BEGIN
	 DECLARE @Offset INT = @PageIndex * @PageSize;

    ;WITH ExpedtedResultData AS (
       SELECT 
		er.TableID, 
		m.MachineID,
		m.MachineName, 
		f.FormID, 
		f.FormName,
		er.UserID, 
		er.ApporvedID,
		er.ApporvedTime,
		er.Status, 
		MAX(er.CreateDate) AS CreateDate, 
		u.UserName,
		(au.UserName) AS ApporvedName,
		ROW_NUMBER() OVER (
			ORDER BY 
				MAX(er.CreateDate) DESC, 
				CAST(SUBSTRING(er.TableID, PATINDEX('%[0-9]%', er.TableID), LEN(er.TableID)) AS INT) DESC
		) AS RowNum
	FROM 
		ExpectedResults AS er
	INNER JOIN 
		Machines AS m ON m.MachineID = er.MachineID 
	INNER JOIN
		Forms AS f ON f.FormID = er.FormID 
	INNER JOIN
		Users AS u ON u.UserID = er.UserID
	LEFT JOIN
		Users AS au ON au.UserID = er.ApporvedID
	WHERE
		er.Status = 'True'
	GROUP BY  
		er.TableID, 
		m.MachineID,
		m.MachineName, 
		f.FormID, 
		f.FormName, 
		er.UserID, 
		er.ApporvedID,
		er.ApporvedTime,
		er.Status,
		u.UserName,
		au.UserName

		)
		SELECT * 
		FROM ExpedtedResultData 
		WHERE RowNum > @Offset AND RowNum <= (@Offset + @PageSize);
	END
END
   
GO
/****** Object:  StoredProcedure [dbo].[GetExpectedResultTable]    Script Date: 1/12/2025 11:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetExpectedResultTable]
    @ID NVARCHAR(9) = NULL
AS
BEGIN
    IF @ID IS NOT NULL AND @ID <> ''
    BEGIN
        DECLARE @cols NVARCHAR(MAX);
        DECLARE @sql NVARCHAR(MAX);
		DECLARE @query NVARCHAR(MAX);

		SET @cols = STUFF((SELECT DISTINCT ',' + QUOTENAME(mcl.MCListID)
                   FROM ExpectedResults AS er
                   JOIN MatchCheckList AS mcl ON mcl.MCListID = er.MCListID
                   WHERE mcl.MCListID IN (SELECT MCListID FROM ExpectedResults WHERE TableID = @ID)
                   FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 1, '');

		SET @query = 'SELECT 
				TableID,
				' + @cols + ',
				FormID, 
				FormName, 
				MachineID, 
				MachineName,
				UserID,
				ApporvedID,
				Status,
				CreateDate,
				ApporvedTime,
				UserName,
				ApporvedName 
			FROM (
				SELECT 
					er.TableID,
					er.MCListID,
					er.EResult,
					f.FormID,
					f.FormName,
					m.MachineID,
					m.MachineName,
					er.UserID, 
					er.ApporvedID,
					er.Status,
					er.CreateDate,
					er.ApporvedTime,
					u.UserName,
					(au.UserName) AS ApporvedName
				FROM 
					ExpectedResults AS er
				JOIN 
					MatchCheckList AS mcl ON mcl.MCListID = er.MCListID
				JOIN 
					Forms AS f ON f.FormID = er.FormID
				JOIN 
					Machines AS m ON m.MachineID = er.MachineID
				INNER JOIN
					Users AS u ON u.UserID = er.UserID 
				LEFT JOIN
					Users AS au ON au.UserID = er.ApporvedID
				WHERE
					er.TableID = @ID
			) AS SourceTable
			PIVOT (
				MAX(EResult) 
				FOR MCListID IN (' + @cols + ')
			) AS PivotTable
			ORDER BY 
				TableID, 
				MachineID, 
				FormID, 
				FormName, 
				MachineName,
				UserID,
				ApporvedID,
				Status,
				CreateDate,
				ApporvedTime,
				UserName,
				ApporvedName';

		EXEC sp_executesql @query, N'@ID NVARCHAR(9)', @ID;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetFormsInPage]    Script Date: 1/12/2025 11:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetFormsInPage]
    @PageIndex INT,
    @PageSize INT
AS
BEGIN
    DECLARE @Offset INT = @PageIndex * @PageSize;

    ;WITH FormsData AS (
        SELECT 
            f.FormID,
			f.FormName,
			f.Description,
			f.IsActive,
            CASE WHEN er.FormID IS NOT NULL THEN 'T'  
                 WHEN m.FormID IS NOT NULL THEN 'U' 
                 ELSE 'D' END AS FormState,
            CASE WHEN COUNT(CASE WHEN m.FormID IS NOT NULL THEN 1 END) > 0 THEN 1 ELSE 0 END AS Disables,
            ROW_NUMBER() OVER (
                ORDER BY 
                    f.IsActive DESC, 
                    CAST(SUBSTRING(f.FormID, PATINDEX('%[0-9]%', f.FormID), LEN(f.FormID)) AS INT) DESC
            ) AS RowNum
        FROM 
            Forms AS f
        Left Join 
			Machines As m On f.FormID = m.FormID 
		Left Join 
			ExpectedResults As er On f.FormID = er.FormID 
		Group BY 
			f.FormID , 
			f.FormName, 
			f.Description, 
			f.IsActive ,
			er.FormID , 
			m.FormID 
    )
    SELECT * 
    FROM FormsData 
    WHERE RowNum > @Offset AND RowNum <= (@Offset + @PageSize);
END
GO
/****** Object:  StoredProcedure [dbo].[GetGroupCheckListOptionInForm]    Script Date: 1/12/2025 11:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetGroupCheckListOptionInForm]
	@ID NVARCHAR(MAX)
AS
BEGIN
	IF @ID IS NOT NULL AND @ID <> ''
	BEGIN
		;WITH GroupCheckListOptionData AS (
		SELECT 
				gclo.GCLOptionID,
				gclo.GCLOptionName,
				gclo.IsActive,
				CASE When COUNT(Case When mclo.IsActive = 'True' OR mcl.GCLOptionID IS NOT NULL THEN 1 END) > 0 THEN 1 ELSE 0 END AS Disables ,
			ROW_NUMBER() OVER (
				ORDER BY 
					gclo.IsActive DESC, 
					CAST(SUBSTRING(gclo.GCLOptionID, PATINDEX('%[0-9]%', gclo.GCLOptionID), LEN(gclo.GCLOptionID)) AS INT) DESC
			) AS RowNum
		From 
			GroupCheckListOptions As gclo 
		Left Join 
			MatchCheckList AS mcl ON gclo.GCLOptionID = mcl.GCLOptionID 
		Left Join 
			MatchCheckListOption AS mclo ON gclo.GCLOptionID = mclo.GCLOptionID 
		WHERE
			gclo.GCLOptionID IN (SELECT Value FROM dbo.SplitString(@ID, ','))
		Group By 
			gclo.GCLOptionID, 
			gclo.GCLOptionName, 
			gclo.IsActive 
		)
		SELECT * 
		FROM GroupCheckListOptionData 
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetGroupCheckListOptionInPage]    Script Date: 1/12/2025 11:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetGroupCheckListOptionInPage]
     @PageIndex INT = NULL,
    @PageSize INT = NULL,
	@ID NVARCHAR(9) = NULL
AS
BEGIN
	IF @ID IS NOT NULL AND @ID <> ''
	BEGIN
		;WITH GroupCheckListOptionData AS (
		SELECT 
				gclo.GCLOptionID,
				gclo.GCLOptionName,
				gclo.IsActive,
				CASE When COUNT(Case When mclo.IsActive = 'True' OR mcl.GCLOptionID IS NOT NULL THEN 1 END) > 0 THEN 1 ELSE 0 END AS Disables ,
			ROW_NUMBER() OVER (
				ORDER BY 
					gclo.IsActive DESC, 
					CAST(SUBSTRING(gclo.GCLOptionID, PATINDEX('%[0-9]%', gclo.GCLOptionID), LEN(gclo.GCLOptionID)) AS INT) DESC
			) AS RowNum
		From 
			GroupCheckListOptions As gclo 
		Left Join 
			MatchCheckList AS mcl ON gclo.GCLOptionID = mcl.GCLOptionID 
		Left Join 
			MatchCheckListOption AS mclo ON gclo.GCLOptionID = mclo.GCLOptionID 
		WHERE
			gclo.GCLOptionID = @ID
		Group By 
			gclo.GCLOptionID, 
			gclo.GCLOptionName, 
			gclo.IsActive 
		)
		SELECT * 
		FROM GroupCheckListOptionData 
	END
	ELSE IF @PageIndex IS NOT NULL AND @PageSize IS NOT NULL
	BEGIN
		DECLARE @Offset INT = @PageIndex * @PageSize;

		;WITH GroupCheckListOptionData AS (
			SELECT 
				 gclo.GCLOptionID,
				 gclo.GCLOptionName,
				 gclo.IsActive,
				CASE 
					WHEN EXISTS (
						SELECT 1
						FROM MatchCheckListOption mclo
						WHERE mclo.IsActive = 'True' AND mclo.GCLOptionID = gclo.GCLOptionID
					) OR EXISTS (
						SELECT 1
						FROM MatchCheckList mcl
						WHERE mcl.GCLOptionID = gclo.GCLOptionID
					)
					THEN 1 ELSE 0
				END AS Disables,
				ROW_NUMBER() OVER (
					ORDER BY 
						gclo.IsActive DESC, 
						CAST(SUBSTRING(gclo.GCLOptionID, PATINDEX('%[0-9]%', gclo.GCLOptionID), LEN(gclo.GCLOptionID)) AS INT) DESC
				) AS RowNum
			From 
				GroupCheckListOptions As gclo 
			Left Join 
				MatchCheckList AS mcl ON gclo.GCLOptionID = mcl.GCLOptionID 
			Left Join 
				MatchCheckListOption AS mclo ON gclo.GCLOptionID = mclo.GCLOptionID 
			Group By 
				gclo.GCLOptionID, 
				gclo.GCLOptionName, 
				gclo.IsActive 
		)
		SELECT * 
		FROM GroupCheckListOptionData 
		WHERE RowNum > @Offset AND RowNum <= (@Offset + @PageSize);
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetGroupMachinesInPage]    Script Date: 1/12/2025 11:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetGroupMachinesInPage]
    @PageIndex INT = NULL,
    @PageSize INT = NULL,
	@ID NVARCHAR(9) = NULL
AS
BEGIN
	IF @ID IS NOT NULL AND @ID <> ''
	BEGIN
		;WITH GroupMachinesData AS (
			SELECT 
				gm.GMachineID, 
				gm.GMachineName, 
				gm.Description, 
				gm.IsActive,
				CASE 
					WHEN MAX(COALESCE(CAST(m.IsActive AS INT), 0)) = 1 THEN 1 
					ELSE 0 
				END AS Disables,
				Case 
					When COUNT(Case When m.GMachineID IS NOT NULL THEN 1 END) > 0 THEN 1 
					ELSE 0 
				END AS Deletes,
				ROW_NUMBER() OVER (
					ORDER BY 
						gm.IsActive DESC, 
						CAST(SUBSTRING(gm.GMachineID, PATINDEX('%[0-9]%', gm.GMachineID), LEN(gm.GMachineID)) AS INT) DESC
				) AS RowNum
			FROM 
				GroupMachines AS gm
			LEFT JOIN 
				Machines AS m ON m.GMachineID = gm.GMachineID
			WHERE 
				gm.GMachineID = @ID
			GROUP BY 
				gm.GMachineID, 
				gm.GMachineName, 
				gm.Description, 
				gm.IsActive
		)
		SELECT * 
		FROM GroupMachinesData 
	END
	ELSE IF @PageIndex IS NOT NULL AND @PageSize IS NOT NULL
	BEGIN
		DECLARE @Offset INT = @PageIndex * @PageSize;

		;WITH GroupMachinesData AS (
			SELECT 
				gm.GMachineID, 
				gm.GMachineName, 
				gm.Description, 
				gm.IsActive,
				CASE 
					WHEN MAX(COALESCE(CAST(m.IsActive AS INT), 0)) = 1 THEN 1 
					ELSE 0 
				END AS Disables,
				Case 
					When COUNT(Case When m.GMachineID IS NOT NULL THEN 1 END) > 0 THEN 1 
					ELSE 0 
				END AS Deletes,
				ROW_NUMBER() OVER (
					ORDER BY 
						gm.IsActive DESC, 
						CAST(SUBSTRING(gm.GMachineID, PATINDEX('%[0-9]%', gm.GMachineID), LEN(gm.GMachineID)) AS INT) DESC
				) AS RowNum
			FROM 
				GroupMachines AS gm
			LEFT JOIN 
				Machines AS m ON m.GMachineID = gm.GMachineID
			GROUP BY 
				gm.GMachineID, 
				gm.GMachineName, 
				gm.Description, 
				gm.IsActive
		)
		SELECT * 
		FROM GroupMachinesData 
		WHERE RowNum > @Offset AND RowNum <= (@Offset + @PageSize);
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetLogInPage]    Script Date: 1/12/2025 11:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLogInPage]
    @PageIndex INT = NULL,  
    @PageSize INT = NULL   
AS
BEGIN
    DECLARE @StartDate DATETIME, @EndDate DATETIME;
    SET @StartDate = CAST(CONVERT(VARCHAR(6), GETDATE(), 112) + '01' AS DATETIME);
    SET @EndDate = DATEADD(MONTH, 1, @StartDate);

	DECLARE @Offset INT = @PageIndex * @PageSize;

	;WITH LogData AS (
		SELECT 
			Create_Date, 
			Title, 
			Messages, 
			Type,
			ROW_NUMBER() OVER (ORDER BY Create_Date DESC) AS RowNum
		FROM 
			Logs
		WHERE 
			Create_Date >= @StartDate AND Create_Date < @EndDate 
	)
	SELECT 
		Create_Date, 
		Title, 
		Messages, 
		Type
	FROM LogData 
	WHERE RowNum > @Offset AND RowNum <= (@Offset + @PageSize);

END
GO
/****** Object:  StoredProcedure [dbo].[GetMachinesInPage]    Script Date: 1/12/2025 11:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetMachinesInPage]
    @PageIndex INT = NULL,
    @PageSize INT = NULL,
	@ID NVARCHAR(9) = NULL
AS
BEGIN
	IF @ID IS NOT NULL AND @ID <> ''
	BEGIN
		;WITH MachinesData AS (
			SELECT 
				m.MachineID, 
				m.GMachineID, 
				m.MachineCode, 
				m.FormID, 
				m.MachineName, 
				m.Description, 
				m.Area, 
				m.Building, 
				m.Floor, 
				m.IsActive, 
				gm.GMachineName,
				CASE WHEN COUNT(CASE WHEN gm.IsActive = 'True' THEN 1 END) OVER (PARTITION BY m.MachineID) > 0 THEN 0 ELSE 1 END AS Disables,
				ROW_NUMBER() OVER (
					ORDER BY 
						m.IsActive DESC, 
						CAST(SUBSTRING(m.MachineID, PATINDEX('%[0-9]%', m.MachineID), LEN(m.MachineID)) AS INT) DESC
				) AS RowNum
			FROM 
				Machines AS m
			LEFT JOIN 
				GroupMachines AS gm ON gm.GMachineID = m.GMachineID
			WHERE 
				m.MachineID = @ID
		)
		SELECT * 
		FROM MachinesData 
	END
	ELSE IF @PageIndex IS NOT NULL AND @PageSize IS NOT NULL
	BEGIN
		DECLARE @Offset INT = @PageIndex * @PageSize;

		;WITH MachinesData AS (
			SELECT 
				m.MachineID, 
				m.GMachineID, 
				m.MachineCode, 
				m.FormID, 
				m.MachineName, 
				m.Description, 
				m.Area, 
				m.Building, 
				m.Floor, 
				m.IsActive, 
				gm.GMachineName,
				CASE WHEN COUNT(CASE WHEN gm.IsActive = 'True' THEN 1 END) OVER (PARTITION BY m.MachineID) > 0 THEN 0 ELSE 1 END AS Disables,
				ROW_NUMBER() OVER (
					ORDER BY 
						m.IsActive DESC, 
						CAST(SUBSTRING(m.MachineID, PATINDEX('%[0-9]%', m.MachineID), LEN(m.MachineID)) AS INT) DESC
				) AS RowNum
			FROM 
				Machines AS m
			LEFT JOIN 
				GroupMachines AS gm ON gm.GMachineID = m.GMachineID
		)
		SELECT * 
		FROM MachinesData 
		WHERE RowNum > @Offset AND RowNum <= (@Offset + @PageSize);
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetMatchFormMachinesInPage]    Script Date: 1/12/2025 11:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetMatchFormMachinesInPage]
    @PageIndex INT = NULL,
    @PageSize INT = NULL,
	@ID NVARCHAR(9) = NULL
AS
BEGIN
	IF @ID IS NOT NULL AND @ID <> ''
	BEGIN
		;WITH MatchFormMachinesData AS (
			SELECT 
				m.MachineID,
				m.GMachineID, 
				m.MachineCode,
				m.FormID, 
				m.MachineName,
				m.Description, 
				m.Area,
				m.Building,
				m.Floor,
				m.IsActive,
				f.FormName,
				f.IsActive as IsActiveForm ,
				ROW_NUMBER() OVER (
					ORDER BY 
						m.MachineID DESC, 
						CAST(SUBSTRING(m.MachineID, PATINDEX('%[0-9]%', m.MachineID), LEN(m.MachineID)) AS INT) DESC
				) AS RowNum
			FROM 
				Forms AS f
			INNER Join 
				Machines as m on m.FormID = f.FormID 
			WHERE 
				m.MachineID = @ID
		)
		SELECT * 
		FROM MatchFormMachinesData 
	END
	ELSE IF @PageIndex IS NOT NULL AND @PageSize IS NOT NULL
	BEGIN
		DECLARE @Offset INT = @PageIndex * @PageSize;

		;WITH MatchFormMachinesData AS (
			SELECT 
				m.MachineID,
				m.GMachineID, 
				m.MachineCode,
				m.FormID, 
				m.MachineName,
				m.Description, 
				m.Area,
				m.Building,
				m.Floor,
				m.IsActive,
				f.FormName,
				f.IsActive as IsActiveForm ,
				ROW_NUMBER() OVER (
					ORDER BY 
						m.MachineID DESC, 
						CAST(SUBSTRING(m.MachineID, PATINDEX('%[0-9]%', m.MachineID), LEN(m.MachineID)) AS INT) DESC
				) AS RowNum
			FROM 
				Forms AS f
			INNER Join 
				Machines as m on m.FormID = f.FormID 
			WHERE 
				m.FormID Is Not null
		)
		SELECT * 
		FROM MatchFormMachinesData 
		WHERE RowNum > @Offset AND RowNum <= (@Offset + @PageSize);
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetMatchGroupCheckListAndOptionInPage]    Script Date: 1/12/2025 11:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetMatchGroupCheckListAndOptionInPage]
     @PageIndex INT = NULL,
    @PageSize INT = NULL,
	@ID NVARCHAR(9) = NULL
AS
BEGIN
	IF @ID IS NOT NULL AND @ID <> ''
	BEGIN
		;WITH MatchGroupCheckListAndOptionData AS (
			SELECT 
			mclo.MCLOptionID,
			mclo.IsActive,
			gclo.GCLOptionID,
			gclo.GCLOptionName,
			clo.CLOptionName,
			mclo.DisplayOrder,
			Case When COUNT(Case When gclo.IsActive = 'False' OR clo.IsActive = 'False' OR er.GCLOptionID IS NOT NULL OR m.FormID IS NOT NULL THEN 1 END) > 0 THEN 1 ELSE 0 END AS Disables ,
			Case When COUNT(Case When gclo.IsActive = 'False' OR clo.IsActive = 'False' OR er.GCLOptionID IS NOT NULL OR m.FormID IS NOT NULL OR f.FormID IS NOT NULL THEN 1 END) > 0 THEN 1 ELSE 0 END AS Deletes ,
			ROW_NUMBER() OVER (
			ORDER BY 
				mclo.IsActive DESC, 
				CAST(SUBSTRING(mclo.MCLOptionID, PATINDEX('%[0-9]%', mclo.MCLOptionID), LEN(mclo.MCLOptionID)) AS INT) DESC
			) AS RowNum
		From 
			MatchCheckListOption As mclo  
		Inner Join 
			GroupCheckListOptions AS gclo ON mclo.GCLOptionID = gclo.GCLOptionID  
		Left Join 
			ExpectedResults AS er ON er.GCLOptionID = mclo.GCLOptionID 
		Inner Join 
			CheckListOptions AS clo on mclo.CLOptionID = clo.CLOptionID 
		Left Join 
			MatchCheckList AS mcl on mclo.GCLOptionID = mcl.GCLOptionID
		Left Join 
			SubForms AS sf on sf.SFormID = mcl.SFormID 
		Left Join
			Forms As f on f.FormID = sf.FormID
		Left Join
			Machines As m on m.FormID = f.FormID 
		WHERE 
			mclo.MCLOptionID = @ID
		Group BY 
			mclo.MCLOptionID,
			mclo.IsActive,
			gclo.GCLOptionID,
			gclo.GCLOptionName,
			clo.CLOptionName,
			mclo.DisplayOrder
		)
		SELECT * 
		FROM MatchGroupCheckListAndOptionData 
	END
	ELSE IF @PageIndex IS NOT NULL AND @PageSize IS NOT NULL
	BEGIN
    DECLARE @Offset INT = @PageIndex * @PageSize;

    ;WITH MatchGroupCheckListAndOptionData AS (
        SELECT 
            mclo.MCLOptionID,
            mclo.IsActive,
            gclo.GCLOptionID,
            gclo.GCLOptionName,
            clo.CLOptionName,
            mclo.DisplayOrder,
            CASE 
                WHEN COUNT(CASE 
                            WHEN gclo.IsActive = 'False' 
                            OR clo.IsActive = 'False' 
                            OR er.GCLOptionID IS NOT NULL 
                            OR m.FormID IS NOT NULL THEN 1 
                        END) > 0 THEN 1 
                ELSE 0 
            END AS Disables,
            CASE 
                WHEN COUNT(CASE 
                            WHEN gclo.IsActive = 'False' 
                            OR clo.IsActive = 'False' 
                            OR er.GCLOptionID IS NOT NULL 
                            OR m.FormID IS NOT NULL 
                            OR f.FormID IS NOT NULL THEN 1 
                        END) > 0 THEN 1 
                ELSE 0 
            END AS Deletes,
            ROW_NUMBER() OVER (
                ORDER BY 
                    mclo.IsActive DESC, 
                    mclo.MCLOptionID DESC
            ) AS RowNum
        FROM 
            MatchCheckListOption AS mclo  
        INNER JOIN 
            GroupCheckListOptions AS gclo ON mclo.GCLOptionID = gclo.GCLOptionID  
        LEFT JOIN 
            ExpectedResults AS er ON er.GCLOptionID = mclo.GCLOptionID 
        INNER JOIN 
            CheckListOptions AS clo ON mclo.CLOptionID = clo.CLOptionID 
        LEFT JOIN 
            MatchCheckList AS mcl ON mclo.GCLOptionID = mcl.GCLOptionID
        LEFT JOIN 
            SubForms AS sf ON sf.SFormID = mcl.SFormID 
        LEFT JOIN
            Forms AS f ON f.FormID = sf.FormID
        LEFT JOIN
            Machines AS m ON m.FormID = f.FormID 
        GROUP BY 
            mclo.MCLOptionID,
            mclo.IsActive,
            gclo.GCLOptionID,
            gclo.GCLOptionName,
            clo.CLOptionName,
            mclo.DisplayOrder
    )
    SELECT * 
    FROM MatchGroupCheckListAndOptionData 
    WHERE RowNum > @Offset AND RowNum <= (@Offset + @PageSize);
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetMenuPermission]    Script Date: 1/12/2025 11:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetMenuPermission]
	@GUserID NVARCHAR(9) = NULL,
	@ParentMenuID INT = NULL
AS
BEGIN
	IF @ParentMenuID IS NOT NULL AND @ParentMenuID <> '' AND @GUserID IS NOT NULL AND @GUserID <> ''
	BEGIN 
        ;WITH MenuData AS (
			SELECT 
				m.MenuID ,
				gp.PermissionStatus, 
				m.MenuPermission , 
				m.MenuLabel , 
				m.ParentMenuID ,
				m.NavigationTo, 
				m.PermissionID , 
				m.Path , 
				m.OrderNo ,
				m.IsActive 
			FROM 
				Menu as m 
			LEFT JOIN 
				Permissions as p on m.PermissionID = p.PermissionID 
			INNER JOIN 
				GroupPermissions as gp on p.PermissionID = gp.PermissionID 
			WHERE 
				m.ParentMenuID IN (@ParentMenuID) AND gp.GUserID IN (@GUserID) AND gp.PermissionStatus = 1 AND p.IsActive = 1 AND m.IsActive = 1 
			GROUP BY 
				m.MenuID ,
				m.MenuPermission ,
				m.MenuLabel ,
				m.NavigationTo , 
				m.ParentMenuID , 
				m.PermissionID ,
				m.Path , 
				m.OrderNo ,
				m.IsActive,
				gp.PermissionStatus 
		)
        SELECT * 
        FROM MenuData;
    END

	ELSE IF @GUserID IS NOT NULL AND @GUserID <> ''
	BEGIN
		;WITH MenuData AS (
			SELECT 
				m.MenuID, 
				m.MenuPermission,
				m.MenuLabel, 
				m.ParentMenuID,
				m.NavigationTo, 
				m.PermissionID, 
				m.Path, 
				m.OrderNo,
				m.IsActive
			FROM 
				Menu as m
			LEFT JOIN 
				Permissions as p on m.PermissionID = p.PermissionID
			INNER JOIN 
				GroupPermissions as gp on p.PermissionID = gp.PermissionID
			WHERE 
				gp.GUserID IN (@GUserID)
				AND m.ParentMenuID IS NULL
				AND gp.PermissionStatus = 1
				AND p.IsActive = 1
				AND m.IsActive = 1
			GROUP BY 
				m.MenuID,
				m.MenuPermission,
				m.MenuLabel,
				m.ParentMenuID,
				m.NavigationTo,
				m.PermissionID,
				m.Path,
				m.OrderNo,
				m.IsActive
		)
		SELECT * 
		FROM MenuData 
		ORDER BY 
				CASE WHEN OrderNo IS NULL THEN 1 ELSE 0 END, OrderNo ASC
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetScheduleData]    Script Date: 1/12/2025 11:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetScheduleData]
    @ScheduleID NVARCHAR(50),
    @TypeSchedule NVARCHAR(50)
AS
BEGIN
    --SELECT ts.ScheduleID, ts.ScheduleName, ts.Type_schedule, ts.IsActive, ts.Tracking, ts.Custom
    --FROM TimeSchedules ts
    --WHERE ts.ScheduleID = @ScheduleID AND ts.Type_schedule = @TypeSchedule;
	--SET NOCOUNT ON

 --   SELECT GMachineID
 --   FROM GroupMachines
 --   WHERE ScheduleID = @ScheduleID;

    IF @TypeSchedule = 'Daily'
    BEGIN
        SELECT tsl.start, tsl.[end]
        FROM TimeSlots tsl
        JOIN TimeSchedules ts ON ts.ScheduleID = tsl.ScheduleID
        WHERE ts.ScheduleID = @ScheduleID AND ts.Type_schedule = 'Daily';
    END

    IF @TypeSchedule = 'Weekly'
    BEGIN
        SELECT tsl.Day, tsl.start, tsl.[end]
        FROM TimeSlots tsl
        JOIN TimeSchedules ts ON ts.ScheduleID = tsl.ScheduleID
        WHERE ts.ScheduleID = @ScheduleID AND ts.Type_schedule = 'Weekly';
    END

    IF @TypeSchedule = 'Custom'
    BEGIN
        SELECT tc.start, tc.[end]
        FROM TimeCustoms tc
        JOIN TimeSchedules ts ON ts.ScheduleID = tc.ScheduleID
        WHERE ts.ScheduleID = @ScheduleID AND ts.Type_schedule = 'Custom';
    END
END

GO
/****** Object:  StoredProcedure [dbo].[SearchApporvedWithPagination]    Script Date: 1/12/2025 11:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchApporvedWithPagination]
    @SearchTerm NVARCHAR(100) = NULL
AS
BEGIN
    ;WITH ApporvedsData AS (
        SELECT 
            er.TableID , 
			m.MachineID ,
			m.MachineName , 
			f.FormID , 
			f.FormName ,
			er.UserID, 
			er.ApporvedID ,
			er.Status, 
			u.UserName,
			er.CreateDate,
            ROW_NUMBER() OVER (
                ORDER BY 
                    er.CreateDate DESC, 
                    CAST(SUBSTRING(er.TableID, PATINDEX('%[0-9]%', er.TableID), LEN(er.TableID)) AS INT) DESC
            ) AS RowNum
        FROM 
            ExpectedResults As er
        INNER JOIN 
			Machines as m on m.MachineID = er.MachineID 
		INNER JOIN
			Forms as f on f.FormID = er.FormID 
		INNER JOIN
			Users as u on u.UserID = er.UserID
		WHERE
			er.Status = 'False' AND (@SearchTerm IS NULL OR m.MachineName LIKE '%' + @SearchTerm + '%' OR f.FormName LIKE '%' + @SearchTerm + '%')
        Group BY  
			er.TableID , 
			m.MachineID,
			m.MachineName, 
			f.FormID, 
			f.FormName, 
			er.UserID, 
			er.CreateDate ,
			er.ApporvedID ,
			er.Status ,
			u.UserName
    )
    SELECT * 
    FROM ApporvedsData 
END
GO
/****** Object:  StoredProcedure [dbo].[SearchCheckListOptionsWithPagination]    Script Date: 1/12/2025 11:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchCheckListOptionsWithPagination]
    @SearchTerm NVARCHAR(100) = NULL
AS
BEGIN
    ;WITH CheckListOptionData AS (
        SELECT 
             clo.CLOptionID, 
			 clo.CLOptionName,
			 clo.IsActive,
			 CASE WHEN COUNT(CASE WHEN mclo.IsActive = 'True' THEN 1 END) > 0 THEN 1 ELSE 0 END AS Disables ,
            ROW_NUMBER() OVER (
                ORDER BY 
                    clo.IsActive DESC, 
                    CAST(SUBSTRING(clo.CLOptionID, PATINDEX('%[0-9]%', clo.CLOptionID), LEN(clo.CLOptionID)) AS INT) DESC
            ) AS RowNum
        From 
			CheckListOptions As clo 
        LEFT JOIN 
			MatchCheckListOption AS mclo ON mclo.CLOptionID = clo.CLOptionID 
		 WHERE 
            (@SearchTerm IS NULL OR clo.CLOptionName LIKE '%' + @SearchTerm + '%')
		Group By 
			clo.CLOptionID, 
			clo.CLOptionName, 
			clo.IsActive  
    )
    SELECT * 
    FROM CheckListOptionData 
END
GO
/****** Object:  StoredProcedure [dbo].[SearchCheckListWithPagination]    Script Date: 1/12/2025 11:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SearchCheckListWithPagination]
    @SearchTerm NVARCHAR(100) = NULL
AS
BEGIN
        SELECT 
            cl.CListID,
			cl.CListName,
			cl.IsActive,
			CASE WHEN COUNT(mcl.CListID) > 0 THEN 1 ELSE 0 END AS Disables,
            ROW_NUMBER() OVER (
                ORDER BY 
                    cl.IsActive DESC, 
                    CAST(SUBSTRING(cl.CListID, PATINDEX('%[0-9]%', cl.CListID), LEN(cl.CListID)) AS INT) DESC
            ) AS RowNum
        FROM 
            CheckLists As cl
        LEFT JOIN 
            MatchCheckList AS mcl ON mcl.CListID = cl.CListID
		WHERE 
            (@SearchTerm IS NULL OR cl.CListName LIKE '%' + @SearchTerm + '%')
        GROUP BY 
            cl.CListID,
			cl.CListName,
			cl.IsActive
    
END
GO
/****** Object:  StoredProcedure [dbo].[SearchExpectedResultWithPagination]    Script Date: 1/12/2025 11:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchExpectedResultWithPagination]
    @SearchTerm NVARCHAR(100) = NULL
AS
BEGIN
    ;WITH ExpedtedResultData AS (
        SELECT 
            er.TableID , 
			m.MachineID ,
			m.MachineName , 
			f.FormID , 
			f.FormName ,
			er.UserID, 
			er.ApporvedID ,
			er.Status, 
			er.CreateDate,
			u.UserName,
			(au.UserName) As ApporvedName,
            ROW_NUMBER() OVER (
                ORDER BY 
                    er.CreateDate DESC, 
                    CAST(SUBSTRING(er.TableID, PATINDEX('%[0-9]%', er.TableID), LEN(er.TableID)) AS INT) DESC
            ) AS RowNum
        FROM 
            ExpectedResults As er
        INNER JOIN 
			Machines as m on m.MachineID = er.MachineID 
		INNER JOIN
			Forms as f on f.FormID = er.FormID 
		INNER JOIN
			Users as u on u.UserID = er.UserID
		LEFT JOIN
			Users as au on au.UserID = er.ApporvedID
		WHERE
			er.Status = 'True' AND (@SearchTerm IS NULL OR m.MachineName LIKE '%' + @SearchTerm + '%' OR f.FormName LIKE '%' + @SearchTerm + '%')
        Group BY  
			er.TableID , 
			m.MachineID,
			m.MachineName, 
			f.FormID, 
			f.FormName, 
			er.UserID, 
			er.CreateDate ,
			er.ApporvedID ,
			er.Status ,
			u.UserName,
			au.UserName
    )
    SELECT * 
    FROM ExpedtedResultData 
END
GO
/****** Object:  StoredProcedure [dbo].[SearchFormsPagination]    Script Date: 1/12/2025 11:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SearchFormsPagination]
    @SearchTerm NVARCHAR(100) = NULL
AS
BEGIN
     ;WITH FormsData AS (
        SELECT 
            f.FormID,
			f.FormName,
			f.Description,
			f.IsActive,
            CASE WHEN er.FormID Is Not NULL THEN 'InTran'  WHEN m.FormID IS NOT NULL THEN 'Used' ELSE 'Draft' END AS FormState ,
			Case When COUNT(Case When m.FormID IS NOT NULL THEN 1 END) > 0 THEN 1 ELSE 0 END AS Disables  ,
            ROW_NUMBER() OVER (
                ORDER BY 
                    f.IsActive DESC, 
                    CAST(SUBSTRING(f.FormID, PATINDEX('%[0-9]%', f.FormID), LEN(f.FormID)) AS INT) DESC
            ) AS RowNum
        FROM 
            Forms AS f
        Left Join 
			Machines As m On f.FormID = m.FormID 
		Left Join 
			ExpectedResults As er On f.FormID = er.FormID 
		WHERE 
            (@SearchTerm IS NULL OR f.FormID LIKE '%' + @SearchTerm + '%' OR f.FormName LIKE '%' + @SearchTerm + '%' OR f.Description LIKE '%' + @SearchTerm + '%' OR f.Description LIKE '%' + @SearchTerm + '%')
		Group BY 
			f.FormID , 
			f.FormName, 
			f.Description, 
			f.IsActive ,
			er.FormID , 
			m.FormID 
    )

    SELECT * 
    FROM FormsData 
END
GO
/****** Object:  StoredProcedure [dbo].[SearchGroupCheckListOptionsWithPagination]    Script Date: 1/12/2025 11:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchGroupCheckListOptionsWithPagination]
    @SearchTerm NVARCHAR(100) = NULL
AS
BEGIN
    ;WITH GroupCheckListOptionData AS (
        SELECT 
             gclo.GCLOptionID,
			 gclo.GCLOptionName,
			 gclo.IsActive,
			 CASE When COUNT(Case When mclo.IsActive = 'True' OR mcl.GCLOptionID IS NOT NULL THEN 1 END) > 0 THEN 1 ELSE 0 END AS Disables ,
            ROW_NUMBER() OVER (
                ORDER BY 
                    gclo.IsActive DESC, 
                    CAST(SUBSTRING(gclo.GCLOptionID, PATINDEX('%[0-9]%', gclo.GCLOptionID), LEN(gclo.GCLOptionID)) AS INT) DESC
            ) AS RowNum
        From 
			GroupCheckListOptions As gclo 
        Left Join 
			MatchCheckList AS mcl ON gclo.GCLOptionID = mcl.GCLOptionID 
		Left Join 
			MatchCheckListOption AS mclo ON gclo.GCLOptionID = mclo.GCLOptionID 
		 WHERE 
            (@SearchTerm IS NULL OR gclo.GCLOptionName LIKE '%' + @SearchTerm + '%' OR gclo.GCLOptionID LIKE '%' + @SearchTerm + '%')
		Group By 
			gclo.GCLOptionID, 
			gclo.GCLOptionName, 
			gclo.IsActive 
    )
    SELECT * 
    FROM GroupCheckListOptionData 
END
GO
/****** Object:  StoredProcedure [dbo].[SearchGroupMachinesWithPagination]    Script Date: 1/12/2025 11:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchGroupMachinesWithPagination]
    @SearchTerm NVARCHAR(100) = NULL
AS
BEGIN
    ;WITH GroupMachinesData AS (
	SELECT 
				gm.GMachineID, 
				gm.GMachineName, 
				gm.Description, 
				gm.IsActive,
				CASE 
					WHEN MAX(COALESCE(CAST(m.IsActive AS INT), 0)) = 1 THEN 1 
					ELSE 0 
				END AS Disables,
				ROW_NUMBER() OVER (
					ORDER BY 
						gm.IsActive DESC, 
						CAST(SUBSTRING(gm.GMachineID, PATINDEX('%[0-9]%', gm.GMachineID), LEN(gm.GMachineID)) AS INT) DESC
				) AS RowNum
			FROM 
				GroupMachines AS gm
			LEFT JOIN 
				Machines AS m ON m.GMachineID = gm.GMachineID
			 WHERE 
				(@SearchTerm IS NULL OR gm.GMachineID LIKE '%' + @SearchTerm + '%' OR gm.GMachineName LIKE '%' + @SearchTerm + '%' OR gm.Description LIKE '%' + @SearchTerm + '%' OR gm.ScheduleID LIKE '%' + @SearchTerm + '%')
			GROUP BY 
				gm.GMachineID, 
				gm.GMachineName, 
				gm.Description, 
				gm.IsActive
		)
    SELECT * 
    FROM GroupMachinesData 
END
GO
/****** Object:  StoredProcedure [dbo].[SearchMachinesWithPagination]    Script Date: 1/12/2025 11:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SearchMachinesWithPagination]
    @SearchTerm NVARCHAR(100) = NULL
AS
BEGIN
    ;WITH MachinesData AS (
	SELECT 
				m.MachineID, 
				m.GMachineID, 
				m.MachineCode, 
				m.FormID, 
				m.MachineName, 
				m.Description, 
				m.Area, 
				m.Building, 
				m.Floor, 
				m.IsActive, 
				gm.GMachineName,
				CASE WHEN COUNT(CASE WHEN gm.IsActive = 'True' THEN 1 END) OVER (PARTITION BY m.MachineID) > 0 THEN 0 ELSE 1 END AS Disables,
				ROW_NUMBER() OVER (
					ORDER BY 
						m.IsActive DESC, 
						CAST(SUBSTRING(m.MachineID, PATINDEX('%[0-9]%', m.MachineID), LEN(m.MachineID)) AS INT) DESC
				) AS RowNum
			FROM 
				Machines AS m
			LEFT JOIN 
				GroupMachines AS gm ON gm.GMachineID = m.GMachineID
			WHERE 
				(@SearchTerm IS NULL OR m.MachineID LIKE '%' + @SearchTerm + '%'  OR m.MachineName LIKE '%' + @SearchTerm + '%' OR m.Description LIKE '%' + @SearchTerm + '%' OR gm.GMachineName LIKE '%' + @SearchTerm + '%')
		)
    SELECT * 
    FROM MachinesData 
END
GO
/****** Object:  StoredProcedure [dbo].[SearchMatchFormMachineWithPagination]    Script Date: 1/12/2025 11:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchMatchFormMachineWithPagination]
    @SearchTerm NVARCHAR(100) = NULL
AS
BEGIN
;WITH MatchFormMachinesData AS (
			SELECT 
				m.MachineID,
				m.GMachineID, 
				m.MachineCode,
				m.FormID, 
				m.MachineName,
				m.Description, 
				m.Area,
				m.Building,
				m.Floor,
				m.IsActive,
				f.FormName,
				f.IsActive as IsActiveForm ,
				ROW_NUMBER() OVER (
					ORDER BY 
						m.MachineID DESC, 
						CAST(SUBSTRING(m.MachineID, PATINDEX('%[0-9]%', m.MachineID), LEN(m.MachineID)) AS INT) DESC
				) AS RowNum
			FROM 
				Forms AS f
			INNER Join 
				Machines as m on m.FormID = f.FormID 
			WHERE
				(@SearchTerm IS NULL OR m.MachineName LIKE '%' + @SearchTerm + '%' OR f.FormName LIKE '%' + @SearchTerm + '%')
		)
		SELECT * 
		FROM MatchFormMachinesData 
END
GO
/****** Object:  StoredProcedure [dbo].[SearchMatchGroupCheckListAndOptionWithPagination]    Script Date: 1/12/2025 11:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SearchMatchGroupCheckListAndOptionWithPagination]
    @SearchTerm NVARCHAR(100) = NULL
AS
BEGIN
    ;WITH MatchGroupCheckListAndOptionData AS (
        SELECT 
             mclo.MCLOptionID,
			 mclo.IsActive,
			 gclo.GCLOptionName,
			 clo.CLOptionName,
			 mclo.DisplayOrder,
			 Case When COUNT(Case When gclo.IsActive = 'False' OR clo.IsActive = 'False' OR er.GCLOptionID IS NOT NULL THEN 1 END) > 0 THEN 1 ELSE 0 END AS Disables ,
            ROW_NUMBER() OVER (
                ORDER BY 
                    mclo.IsActive DESC, 
                    CAST(SUBSTRING(mclo.MCLOptionID, PATINDEX('%[0-9]%', mclo.MCLOptionID), LEN(mclo.MCLOptionID)) AS INT) DESC
            ) AS RowNum
        From 
			 MatchCheckListOption As mclo  
        Left Join 
			GroupCheckListOptions AS gclo ON mclo.GCLOptionID = gclo.GCLOptionID  
		Left Join 
			ExpectedResults AS er ON er.GCLOptionID = mclo.GCLOptionID 
		Left Join 
			CheckListOptions AS clo on mclo.CLOptionID = clo.CLOptionID 
		WHERE 
            (@SearchTerm IS NULL OR gclo.GCLOptionName LIKE '%' + @SearchTerm + '%' OR clo.CLOptionName LIKE '%' + @SearchTerm + '%')
		Group BY 
			mclo.MCLOptionID,
			mclo.IsActive,
			gclo.GCLOptionName ,
			clo.CLOptionName,
			 mclo.DisplayOrder
    )
    SELECT * 
    FROM MatchGroupCheckListAndOptionData 
END
GO
/****** Object:  StoredProcedure [dbo].[SearchScheduleWithPagination]    Script Date: 1/12/2025 11:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchScheduleWithPagination]
     @SearchTerm NVARCHAR(100) = NULL
AS
BEGIN
   ;WITH ScheduleData AS (

        SELECT 
             ts.ScheduleID,
			 ts.ScheduleName,
			 ts.Type_schedule,
			 ts.IsActive,
			 ts.Tracking,
			 ts.Custom,
            ROW_NUMBER() OVER (
                ORDER BY 
                    ts.ScheduleID DESC
            ) AS RowNum
        FROM 
			TimeSchedules AS ts
		 WHERE 
            (@SearchTerm IS NULL OR ts.ScheduleID LIKE '%' + @SearchTerm + '%' OR ts.ScheduleName LIKE '%' + @SearchTerm + '%' OR ts.Type_schedule LIKE '%' + @SearchTerm + '%')
    )
    SELECT * 
    FROM ScheduleData 
END

GO
/****** Object:  StoredProcedure [dbo].[TransactionAppConfig]    Script Date: 1/12/2025 11:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TransactionAppConfig]
	@AppID NVARCHAR(2) = NULL,
    @AppName NVARCHAR(50) = NULL,  
    @GroupMachine NVARCHAR(9) = NULL,  
    @Machine NVARCHAR(9) = NULL,  
    @CheckList NVARCHAR(9) = NULL,  
    @GroupCheckList NVARCHAR(9) = NULL,  
    @CheckListOption NVARCHAR(9) = NULL,  
    @MatchCheckListOption NVARCHAR(9) = NULL,  
    @MatchFormMachine NVARCHAR(9) = NULL,  
    @Form NVARCHAR(9) = NULL,  
    @SubForm NVARCHAR(9) = NULL,  
    @ExpectedResult NVARCHAR(9) = NULL,  
    @UsersPermission NVARCHAR(9) = NULL
AS
BEGIN
	IF @AppID IS NOT NULL AND @AppID <> ''
	BEGIN
		UPDATE AppConfig SET 
		AppName = NULLIF(@AppName, NULL) ,
		GroupMachine = NULLIF(@GroupMachine , NULL) ,
		Machine = NULLIF(@Machine , NULL) ,
		CheckList = NULLIF(@CheckList , NULL) ,
		GroupCheckList = NULLIF(@GroupCheckList , NULL) ,
		CheckListOption = NULLIF(@CheckListOption , NULL) ,
		MatchFormMachine = NULLIF(@MatchFormMachine , NULL) ,
		Form = NULLIF(@Form , NULL) ,
		SubForm = NULLIF(@SubForm , NULL) ,
		ExpectedResult = NULLIF(@ExpectedResult , NULL) ,
		UsersPermission = NULLIF(@UsersPermission , NULL)
		WHERE AppID = @AppID
	END
END
GO
