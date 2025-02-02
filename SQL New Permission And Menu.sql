USE [m_checklist_dev2]
GO
/****** Object:  StoredProcedure [dbo].[GetApprovedInPage]    Script Date: 1/22/2025 12:21:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetApprovedInPage]
    @PageIndex INT = NULL,
    @PageSize INT = NULL,
	@ID NVARCHAR(9) = NULL
AS
BEGIN
	IF @ID IS NOT NULL AND @ID <> ''
	BEGIN 
        ;WITH ApprovedData AS (
            SELECT 
                er.TableID, 
                m.MachineID,
                m.MachineName, 
                f.FormID, 
                f.FormName,
                er.UserID, 
                er.ApprovedID,
                er.Status, 
                er.CreateDate,
				u.UserName,
                ROW_NUMBER() OVER (
                    ORDER BY 
                        er.CreateDate DESC, 
                        er.TableID DESC
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
				er.ApprovedID ,
				er.Status ,
				u.UserName
        )
        SELECT * 
        FROM ApprovedData;
    END

	ELSE IF @PageIndex IS NOT NULL AND @PageSize IS NOT NULL
	BEGIN
		DECLARE @Offset INT = @PageIndex * @PageSize;

		;WITH ApprovedData AS (
			SELECT 
				er.TableID , 
				m.MachineID ,
				m.MachineName , 
				f.FormID , 
				f.FormName ,
				er.UserID, 
				er.ApprovedID ,
				er.Status, 
				er.CreateDate,
				u.UserName,
				ROW_NUMBER() OVER (
					ORDER BY 
						er.CreateDate DESC, 
						er.TableID DESC
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
				er.ApprovedID ,
				er.Status ,
				u.UserName
		)
		SELECT * 
		FROM ApprovedData 
		WHERE RowNum > @Offset AND RowNum <= (@Offset + @PageSize);
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetCheckListInForm]    Script Date: 1/22/2025 12:21:52 AM ******/
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
				CASE WHEN EXISTS (SELECT 1 FROM MatchCheckList WHERE CListID = cl.CListID) THEN 1 ELSE 0 END AS Disables
            FROM 
                CheckLists AS cl
            WHERE 
                cl.CListID IN (SELECT Value FROM dbo.SplitString(@ID, ','))
        )
        SELECT * 
        FROM CheckListData; 
    END
END
GO
/****** Object:  StoredProcedure [dbo].[GetCheckListInPage]    Script Date: 1/22/2025 12:21:52 AM ******/
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
				CASE WHEN EXISTS (SELECT 1 FROM MatchCheckList WHERE CListID = cl.CListID) THEN 1 ELSE 0 END AS Disables,
				ROW_NUMBER() OVER (
					ORDER BY 
						cl.IsActive DESC, 
						cl.CListID DESC
				) AS RowNum
			FROM 
				CheckLists As cl
            WHERE 
                cl.CListID = @ID
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
				CASE WHEN EXISTS (SELECT 1 FROM MatchCheckList WHERE CListID = cl.CListID) THEN 1 ELSE 0 END AS Disables,
				ROW_NUMBER() OVER (
					ORDER BY 
						cl.IsActive DESC, 
						cl.CListID DESC
				) AS RowNum
			FROM 
				CheckLists As cl
        )
        SELECT * 
        FROM CheckListData 
        WHERE RowNum > @Offset AND RowNum <= (@Offset + @PageSize);
    END
END
GO
/****** Object:  StoredProcedure [dbo].[GetCheckListOptionInPage]    Script Date: 1/22/2025 12:21:52 AM ******/
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
				CASE WHEN EXISTS (SELECT 1 FROM MatchCheckListOption WHERE CLOptionID = clo.CLOptionID AND IsActive = 'True') THEN 1 ELSE 0 END AS Disables,
				ROW_NUMBER() OVER (
				ORDER BY 
					clo.IsActive DESC, 
					clo.CLOptionID DESC
				) AS RowNum
				FROM 
					CheckListOptions AS clo 
				WHERE 
					clo.CLOptionID = @ID
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
				CASE WHEN EXISTS (SELECT 1 FROM MatchCheckListOption WHERE CLOptionID = clo.CLOptionID AND IsActive = 'True') THEN 1 ELSE 0 END AS Disables,
				ROW_NUMBER() OVER (
				ORDER BY 
					clo.IsActive DESC, 
					clo.CLOptionID DESC
				) AS RowNum
				FROM 
					CheckListOptions AS clo 
        )
        SELECT * 
        FROM CheckListOptionData 
        WHERE RowNum > @Offset AND RowNum <= (@Offset + @PageSize);
    END
END
GO
/****** Object:  StoredProcedure [dbo].[GetExpectedResultInPage]    Script Date: 1/22/2025 12:21:52 AM ******/
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
			er.ApprovedID,
			er.ApprovedTime,
			er.Status, 
			MAX(er.CreateDate) AS CreateDate, 
			u.UserName,
			(au.UserName) AS ApprovedName,
			ROW_NUMBER() OVER (
				ORDER BY 
					MAX(er.CreateDate) DESC, 
					er.TableID DESC
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
			Users AS au ON au.UserID = er.ApprovedID
		WHERE
			er.Status = 'True'
		GROUP BY  
			er.TableID, 
			m.MachineID,
			m.MachineName, 
			f.FormID, 
			f.FormName, 
			er.UserID, 
			er.ApprovedID,
			er.ApprovedTime,
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
			er.ApprovedID,
			er.ApprovedTime,
			er.Status, 
			MAX(er.CreateDate) AS CreateDate, 
			u.UserName,
			(au.UserName) AS ApprovedName,
			ROW_NUMBER() OVER (
				ORDER BY 
					MAX(er.CreateDate) DESC, 
					er.TableID DESC
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
			Users AS au ON au.UserID = er.ApprovedID
		WHERE
			er.Status = 'True'
		GROUP BY  
			er.TableID, 
			m.MachineID,
			m.MachineName, 
			f.FormID, 
			f.FormName, 
			er.UserID, 
			er.ApprovedID,
			er.ApprovedTime,
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
/****** Object:  StoredProcedure [dbo].[GetExpectedResultTable]    Script Date: 1/22/2025 12:21:52 AM ******/
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
				ApprovedID,
				Status,
				CreateDate,
				ApprovedTime,
				UserName,
				ApprovedName 
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
					er.ApprovedID,
					er.Status,
					er.CreateDate,
					er.ApprovedTime,
					u.UserName,
					(au.UserName) AS ApprovedName
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
					Users AS au ON au.UserID = er.ApprovedID
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
				ApprovedID,
				Status,
				CreateDate,
				ApprovedTime,
				UserName,
				ApprovedName';

		EXEC sp_executesql @query, N'@ID NVARCHAR(9)', @ID;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetFormsInPage]    Script Date: 1/22/2025 12:21:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetFormsInPage]
     @PageIndex INT = NULL,
	 @PageSize INT = NULL,
     @ID NVARCHAR(9) = NULL
AS
BEGIN
	IF @ID IS NOT NULL AND @ID <> ''
	BEGIN
		;WITH FormsData AS (
			SELECT 
				f.FormID,
				f.FormNumber,
				f.FormName,
				f.Description,
				f.IsActive,
				CASE WHEN er.FormID IS NOT NULL THEN 'Tran'  
					 WHEN m.FormID IS NOT NULL THEN 'Used' 
					 ELSE 'Draf' END AS FormState,
				CASE 
					WHEN m.FormID IS NOT NULL THEN 1 
					ELSE 0 
				END AS Disables,
				CASE WHEN er.FormID IS NOT NULL THEN 1
					 WHEN m.FormID IS NOT NULL THEN 1
					 ELSE 0 END AS Deletes,
				ROW_NUMBER() OVER (
					ORDER BY 
						f.IsActive DESC, 
						f.FormID DESC
				) AS RowNum
			FROM 
				Forms AS f
			Left Join 
				Machines As m On f.FormID = m.FormID 
			Left Join 
				ExpectedResults As er On f.FormID = er.FormID 
			WHERE
				f.FormID = @ID
			Group BY 
				f.FormID , 
				f.FormNumber,
				f.FormName, 
				f.Description, 
				f.IsActive ,
				er.FormID , 
				m.FormID 
		)
		SELECT * 
		FROM FormsData 
	END
    ELSE IF @PageIndex IS NOT NULL AND @PageSize IS NOT NULL
    BEGIN
	DECLARE @Offset INT = @PageIndex * @PageSize;

		;WITH FormsData AS (
			SELECT 
				f.FormID,
				f.FormNumber,
				f.FormName,
				f.Description,
				f.IsActive,
				CASE WHEN er.FormID IS NOT NULL THEN 'Tran'  
					 WHEN m.FormID IS NOT NULL THEN 'Used' 
					 ELSE 'Draf' END AS FormState,
				CASE 
					WHEN m.FormID IS NOT NULL THEN 1 
					ELSE 0 
				END AS Disables,
				CASE WHEN er.FormID IS NOT NULL THEN 1
					 WHEN m.FormID IS NOT NULL THEN 1
					 ELSE 0 END AS Deletes,
				ROW_NUMBER() OVER (
					ORDER BY 
						f.IsActive DESC, 
						f.FormID DESC
				) AS RowNum
			FROM 
				Forms AS f
			Left Join 
				Machines As m On f.FormID = m.FormID 
			Left Join 
				ExpectedResults As er On f.FormID = er.FormID 
			Group BY 
				f.FormID , 
				f.FormNumber,
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
END
GO
/****** Object:  StoredProcedure [dbo].[GetGroupCheckListOptionInForm]    Script Date: 1/22/2025 12:21:52 AM ******/
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
				CASE 
					WHEN EXISTS (
						SELECT 1
						FROM MatchCheckListOption AS mclo
						WHERE mclo.GCLOptionID = gclo.GCLOptionID
						AND mclo.IsActive = 'True'
					) OR EXISTS (
						SELECT 1
						FROM MatchCheckList AS mcl
						WHERE mcl.GCLOptionID = gclo.GCLOptionID
					) THEN 1
					ELSE 0 
				END AS Disables,
				CASE 
					WHEN EXISTS (
						SELECT 1
						FROM MatchCheckListOption AS mclo
						WHERE mclo.GCLOptionID = gclo.GCLOptionID
						AND mclo.IsActive = 'True'
					) OR EXISTS (
						SELECT 1
						FROM MatchCheckList AS mcl
						WHERE mcl.GCLOptionID = gclo.GCLOptionID
					) THEN 1
					ELSE 0 
				END AS Deletes,
				ROW_NUMBER() OVER (
					ORDER BY 
						gclo.IsActive DESC,
						gclo.GCLOptionID DESC
				) AS RowNum
			FROM 
				GroupCheckListOptions AS gclo
			WHERE
				gclo.GCLOptionID IN (SELECT Value FROM dbo.SplitString(@ID, ','))
			)
			SELECT * 
			FROM GroupCheckListOptionData 
		END
END
GO
/****** Object:  StoredProcedure [dbo].[GetGroupCheckListOptionInPage]    Script Date: 1/22/2025 12:21:52 AM ******/
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
				CASE 
					WHEN EXISTS (
						SELECT 1
						FROM MatchCheckListOption AS mclo
						WHERE mclo.GCLOptionID = gclo.GCLOptionID
						AND mclo.IsActive = 'True'
					) OR EXISTS (
						SELECT 1
						FROM MatchCheckList AS mcl
						WHERE mcl.GCLOptionID = gclo.GCLOptionID
					) THEN 1
					ELSE 0 
				END AS Disables,
				CASE 
					WHEN EXISTS (
						SELECT 1
						FROM MatchCheckListOption AS mclo
						WHERE mclo.GCLOptionID = gclo.GCLOptionID
					) OR EXISTS (
						SELECT 1
						FROM MatchCheckList AS mcl
						WHERE mcl.GCLOptionID = gclo.GCLOptionID
					) THEN 1
					ELSE 0 
				END AS Deletes,
				ROW_NUMBER() OVER (
					ORDER BY 
						gclo.IsActive DESC,
						gclo.GCLOptionID DESC
				) AS RowNum
			FROM 
				GroupCheckListOptions AS gclo 
			WHERE
				gclo.GCLOptionID = @ID
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
						FROM MatchCheckListOption AS mclo
						WHERE mclo.GCLOptionID = gclo.GCLOptionID
						AND mclo.IsActive = 'True'
					) OR EXISTS (
						SELECT 1
						FROM MatchCheckList AS mcl
						WHERE mcl.GCLOptionID = gclo.GCLOptionID
					) THEN 1
					ELSE 0 
				END AS Disables,
				CASE 
					WHEN EXISTS (
						SELECT 1
						FROM MatchCheckListOption AS mclo
						WHERE mclo.GCLOptionID = gclo.GCLOptionID
					) OR EXISTS (
						SELECT 1
						FROM MatchCheckList AS mcl
						WHERE mcl.GCLOptionID = gclo.GCLOptionID
					) THEN 1
					ELSE 0 
				END AS Deletes,
				ROW_NUMBER() OVER (
					ORDER BY 
						gclo.IsActive DESC,
						gclo.GCLOptionID DESC
				) AS RowNum
			FROM 
				GroupCheckListOptions AS gclo 
		)
		SELECT * 
		FROM GroupCheckListOptionData 
		WHERE RowNum > @Offset AND RowNum <= (@Offset + @PageSize);
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetGroupMachinesInPage]    Script Date: 1/22/2025 12:21:52 AM ******/
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
					WHEN EXISTS (
						SELECT 1
						From Machines WHERE GMachineID = gm.GMachineID AND IsActive = 'True'
					) THEN 1
					ELSE 0 
				END AS Disables,
				CASE 
					WHEN EXISTS (SELECT 1 FROM Machines WHERE GMachineID = gm.GMachineID) OR
					EXISTS (SELECT 1 FROM ExpectedResults WHERE MachineID IN (SELECT MachineID From Machines WHERE GMachineID = gm.GMachineID)) THEN 1 
					ELSE 0 
				END AS Deletes,
				ROW_NUMBER() OVER (
					ORDER BY 
						gm.IsActive DESC, 
						gm.GMachineID DESC
				) AS RowNum
			FROM 
				GroupMachines AS gm
			WHERE 
				gm.GMachineID = @ID
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
					WHEN EXISTS (
						SELECT 1
						From Machines WHERE GMachineID = gm.GMachineID AND IsActive = 'True'
					) THEN 1
					ELSE 0 
				END AS Disables,
				CASE 
					WHEN EXISTS (SELECT 1 FROM Machines WHERE GMachineID = gm.GMachineID) OR
					EXISTS (SELECT 1 FROM ExpectedResults WHERE MachineID IN (SELECT MachineID From Machines WHERE GMachineID = gm.GMachineID)) THEN 1 
					ELSE 0 
				END AS Deletes,
				ROW_NUMBER() OVER (
					ORDER BY 
						gm.IsActive DESC, 
						gm.GMachineID DESC
				) AS RowNum
			FROM 
				GroupMachines AS gm
		)
		SELECT * 
		FROM GroupMachinesData 
		WHERE RowNum > @Offset AND RowNum <= (@Offset + @PageSize);
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetGroupTypeCheckListsInPage]    Script Date: 1/22/2025 12:21:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetGroupTypeCheckListsInPage]
	@ID NVARCHAR(9) = NULL
AS
BEGIN
	IF @ID IS NOT NULL AND @ID <> ''
	BEGIN 
        ;WITH GroupTypeCheckListData AS (
			SELECT 
				clt.CTypeID, 
				clt.CTypeName, 
				clt.Icon, 
				clt.CTypeTitle,
				clt.IsActive,
				ROW_NUMBER() OVER (
                    ORDER BY 
                        clt.Displayorder 
                ) AS RowNum
            From 
				CheckListTypes As clt 
            LEFT JOIN 
				GroupTypeCheckLists As gclt On gclt.GTypeID = clt.GTypeID 
            WHERE 
				clt.GTypeID IN (@ID)
        )
        SELECT * 
        FROM GroupTypeCheckListData;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[GetLogInPage]    Script Date: 1/22/2025 12:21:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLogInPage]
    --@PageIndex INT = NULL,  
    --@PageSize INT = NULL,
    @Month INT = NULL,
    @FiscalYear INT = NULL,
    @SearchKeyword NVARCHAR(100) = NULL
AS
BEGIN
    DECLARE @StartDate DATETIME, @EndDate DATETIME;
    
    IF @Month IS NOT NULL AND @FiscalYear IS NOT NULL AND @FiscalYear <> 0
    BEGIN
        SET @StartDate = CAST(CAST(@FiscalYear AS NVARCHAR(4)) + RIGHT('00' + CAST(@Month AS NVARCHAR(2)), 2) + '01' AS DATETIME);
        SET @EndDate = DATEADD(MONTH, 1, @StartDate); 
    END
    ELSE
    BEGIN
        SET @StartDate = CAST(CONVERT(VARCHAR(6), GETDATE(), 112) + '01' AS DATETIME);
        SET @EndDate = DATEADD(MONTH, 1, @StartDate);
    END

    --DECLARE @Offset INT = @PageIndex * @PageSize; 

    ;WITH LogData AS (
        SELECT 
            Create_Date, 
            Title, 
            Messages, 
            Type
            --ROW_NUMBER() OVER (ORDER BY Create_Date DESC) AS RowNum
        FROM 
            Logs
        WHERE 
            Create_Date >= @StartDate AND Create_Date < @EndDate
            AND (@SearchKeyword IS NULL OR CHARINDEX(@SearchKeyword, Messages) > 0) 
    )
    SELECT 
        Create_Date, 
        Title, 
        Messages, 
        Type
    FROM LogData 
    --WHERE RowNum > @Offset AND RowNum <= (@Offset + @PageSize);
END
GO
/****** Object:  StoredProcedure [dbo].[GetMachinesInPage]    Script Date: 1/22/2025 12:21:52 AM ******/
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
				CASE 
					WHEN gm.IsActive = 'False' THEN 1 
					ELSE 0 
				END AS Disables,
				CASE 
					WHEN EXISTS (
						SELECT 1
						FROM ExpectedResults
						WHERE MachineID = m.MachineID
					) THEN 1 
					ELSE 0 
				END AS Deletes,
				ROW_NUMBER() OVER (
					ORDER BY 
						m.IsActive DESC, 
						m.MachineID DESC
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
				CASE 
					WHEN gm.IsActive = 'False' THEN 1 
					ELSE 0 
				END AS Disables,
				CASE 
					WHEN EXISTS (
						SELECT 1
						FROM ExpectedResults
						WHERE MachineID = m.MachineID
					) THEN 1 
					ELSE 0 
				END AS Deletes,
				ROW_NUMBER() OVER (
					ORDER BY 
						m.IsActive DESC, 
						m.MachineID DESC
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
/****** Object:  StoredProcedure [dbo].[GetMatchCheckListFromSubForm]    Script Date: 1/22/2025 12:21:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetMatchCheckListFromSubForm]
	@ID NVARCHAR(9) = NULL
AS
BEGIN
	IF @ID IS NOT NULL AND @ID <> ''
	BEGIN 
        ;WITH MatchCheckListData AS (
			SELECT 
				mcl.MCListID, 
				mcl.CListID, 
				mcl.GCLOptionID, 
				mcl.CTypeID, 
				mcl.DTypeID, 
				mcl.DTypeValue, 
				mcl.SFormID, 
				mcl.Important, 
				mcl.Required, 
				mcl.Rowcolumn, 
				mcl.Description, 
				mcl.Placeholder, 
				mcl.Hint, 
				mcl.DisplayOrder,
				ROW_NUMBER() OVER (
						ORDER BY 
							mcl.DisplayOrder
					) AS RowNum
			FROM 
				SubForms AS sf 
			INNER JOIN 
				MatchCheckList AS mcl ON sf.SFormID = mcl.SFormID 
			WHERE 
				sf.SFormID = @ID 
			)
        SELECT * 
        FROM MatchCheckListData;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[GetMatchFormMachinesInPage]    Script Date: 1/22/2025 12:21:52 AM ******/
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
						m.MachineID DESC
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
						m.MachineID DESC
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
/****** Object:  StoredProcedure [dbo].[GetMatchGroupCheckListAndOptionInPage]    Script Date: 1/22/2025 12:21:52 AM ******/
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
				CASE 
					WHEN EXISTS (SELECT 1 FROM ExpectedResults WHERE GCLOptionID = mclo.GCLOptionID) 
						 OR gclo.IsActive = 'False' 
						 OR clo.IsActive = 'False' 
					THEN 1 
					ELSE 0 
				END AS Disables,
				CASE 
					WHEN EXISTS (SELECT 1 FROM ExpectedResults WHERE GCLOptionID = mclo.GCLOptionID) 
						OR EXISTS (SELECT 1 FROM MatchCheckList As mcl 
						Inner Join SubForms As sf ON sf.SFormID = mcl.SFormID 
						Inner Join Forms As f On f.FormID = sf.FormID 
						Inner Join Machines As m On m.FormID = f.FormID 
						WHERE mclo.GCLOptionID = mcl.GCLOptionID)

						OR gclo.IsActive = 'False' 
						OR clo.IsActive = 'False' THEN 1 
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
			INNER JOIN 
				CheckListOptions AS clo ON mclo.CLOptionID = clo.CLOptionID
			WHERE 
				mclo.MCLOptionID = @ID
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
				WHEN EXISTS (SELECT 1 FROM ExpectedResults WHERE GCLOptionID = mclo.GCLOptionID) 
					 OR gclo.IsActive = 'False' 
					 OR clo.IsActive = 'False' 
				THEN 1 
				ELSE 0 
			END AS Disables,
			CASE 
				WHEN EXISTS (SELECT 1 FROM ExpectedResults WHERE GCLOptionID = mclo.GCLOptionID) 
					OR EXISTS (SELECT 1 FROM MatchCheckList As mcl 
					Inner Join SubForms As sf ON sf.SFormID = mcl.SFormID 
					Inner Join Forms As f On f.FormID = sf.FormID 
					Inner Join Machines As m On m.FormID = f.FormID 
					WHERE mclo.GCLOptionID = mcl.GCLOptionID)

					OR gclo.IsActive = 'False' 
					OR clo.IsActive = 'False' THEN 1 
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
		INNER JOIN 
			CheckListOptions AS clo ON mclo.CLOptionID = clo.CLOptionID
    )
    SELECT * 
    FROM MatchGroupCheckListAndOptionData 
    WHERE RowNum > @Offset AND RowNum <= (@Offset + @PageSize);
	END
END
--BEGIN
--    IF @ID IS NOT NULL AND @ID <> ''
--    BEGIN
--        ;WITH MatchGroupCheckListAndOptionData AS (
--            SELECT 
--                mclo.MCLOptionID,
--                mclo.IsActive,
--                gclo.GCLOptionID,
--                gclo.GCLOptionName,
--                clo.CLOptionName,
--                mclo.DisplayOrder,
--                CASE 
--                    WHEN gclo.IsActive = 'False' OR clo.IsActive = 'False' OR er.GCLOptionID IS NOT NULL THEN 1 
--                    ELSE 0 
--                END AS Disables,
--                CASE 
--                    WHEN gclo.IsActive = 'False' OR clo.IsActive = 'False' OR er.GCLOptionID IS NOT NULL OR m.FormID IS NOT NULL THEN 1 
--                    ELSE 0 
--                END AS Deletes,
--                ROW_NUMBER() OVER (
--                    ORDER BY 
--						mclo.IsActive DESC, 
--						mclo.MCLOptionID DESC
--                ) AS RowNum
--            FROM 
--                MatchCheckListOption AS mclo
--            INNER JOIN 
--                GroupCheckListOptions AS gclo ON mclo.GCLOptionID = gclo.GCLOptionID
--            LEFT JOIN 
--                ExpectedResults AS er ON er.GCLOptionID = mclo.GCLOptionID
--            INNER JOIN 
--                CheckListOptions AS clo ON mclo.CLOptionID = clo.CLOptionID
--            LEFT JOIN 
--                MatchCheckList AS mcl ON mclo.GCLOptionID = mcl.GCLOptionID
--            LEFT JOIN 
--                SubForms AS sf ON sf.SFormID = mcl.SFormID
--            LEFT JOIN 
--                Forms AS f ON f.FormID = sf.FormID
--            LEFT JOIN 
--                Machines AS m ON m.FormID = f.FormID
--            WHERE 
--                mclo.MCLOptionID = @ID
--			Group BY 
--				mclo.MCLOptionID,
--				mclo.IsActive,
--				mclo.DisplayOrder,
--				clo.CLOptionName,
--				clo.IsActive,
--				gclo.GCLOptionName ,
--				gclo.GCLOptionID,
--				gclo.IsActive,
--				er.GCLOptionID,
--				m.FormID
--        )
--        SELECT * 
--        FROM MatchGroupCheckListAndOptionData;
--    END
--    ELSE IF @PageIndex IS NOT NULL AND @PageSize IS NOT NULL
--    BEGIN
--        DECLARE @Offset INT = @PageIndex * @PageSize;

--        ;WITH MatchGroupCheckListAndOptionData AS (
--            SELECT 
--                mclo.MCLOptionID,
--                mclo.IsActive,
--                gclo.GCLOptionID,
--                gclo.GCLOptionName,
--                clo.CLOptionName,
--                mclo.DisplayOrder,
--                CASE 
--                    WHEN gclo.IsActive = 'False' OR clo.IsActive = 'False' OR er.GCLOptionID IS NOT NULL THEN 1 
--                    ELSE 0 
--                END AS Disables,
--                CASE 
--                    WHEN gclo.IsActive = 'False' OR clo.IsActive = 'False' OR er.GCLOptionID IS NOT NULL OR m.FormID IS NOT NULL THEN 1 
--                    ELSE 0 
--                END AS Deletes,
--                ROW_NUMBER() OVER (
--                    ORDER BY 
--						mclo.IsActive DESC, 
--						mclo.MCLOptionID DESC
--                ) AS RowNum
--            FROM 
--                MatchCheckListOption AS mclo
--            INNER JOIN 
--                GroupCheckListOptions AS gclo ON mclo.GCLOptionID = gclo.GCLOptionID
--            LEFT JOIN 
--                ExpectedResults AS er ON er.GCLOptionID = mclo.GCLOptionID
--            INNER JOIN 
--                CheckListOptions AS clo ON mclo.CLOptionID = clo.CLOptionID
--            LEFT JOIN 
--                MatchCheckList AS mcl ON mclo.GCLOptionID = mcl.GCLOptionID
--            LEFT JOIN 
--                SubForms AS sf ON sf.SFormID = mcl.SFormID
--            LEFT JOIN 
--                Forms AS f ON f.FormID = sf.FormID
--            LEFT JOIN 
--                Machines AS m ON m.FormID = f.FormID
--			Group BY 
--				mclo.MCLOptionID,
--				mclo.IsActive,
--				mclo.DisplayOrder,
--				clo.CLOptionName,
--				clo.IsActive,
--				gclo.GCLOptionName ,
--				gclo.GCLOptionID,
--				gclo.IsActive,
--				er.GCLOptionID,
--				m.FormID
--        )
--        SELECT * 
--        FROM MatchGroupCheckListAndOptionData 
--        WHERE RowNum > @Offset AND RowNum <= (@Offset + @PageSize);
--    END
--END
GO
/****** Object:  StoredProcedure [dbo].[GetMenuPermission]    Script Date: 1/22/2025 12:21:52 AM ******/
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
				m.Icon,
				m.IsActive 
			FROM 
				Menu as m 
			LEFT JOIN 
				Permissions as p on m.PermissionID = p.PermissionID 
			INNER JOIN 
				GroupPermissions as gp on p.PermissionID = gp.PermissionID 
			WHERE 
				m.ParentMenuID IN (@ParentMenuID) AND gp.GUserID IN (@GUserID) AND gp.PermissionStatus = 1 AND p.IsActive = 1 AND m.IsActive = 1 
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
				m.Icon,
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
		)
		SELECT * 
		FROM MenuData 
		ORDER BY 
				CASE WHEN OrderNo IS NULL THEN 1 ELSE 0 END, OrderNo ASC
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetScheduleData]    Script Date: 1/22/2025 12:21:52 AM ******/
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
/****** Object:  StoredProcedure [dbo].[SearchApprovedWithPagination]    Script Date: 1/22/2025 12:21:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchApprovedWithPagination]
    @SearchTerm NVARCHAR(100) = NULL
AS
BEGIN
    ;WITH ApprovedsData AS (
        SELECT 
            er.TableID , 
			m.MachineID ,
			m.MachineName , 
			f.FormID , 
			f.FormName ,
			er.UserID, 
			er.ApprovedID ,
			er.Status, 
			u.UserName,
			er.CreateDate,
            ROW_NUMBER() OVER (
                ORDER BY 
                    er.CreateDate DESC, 
                    er.TableID DESC
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
			er.ApprovedID ,
			er.Status ,
			u.UserName
    )
    SELECT * 
    FROM ApprovedsData 
END
GO
/****** Object:  StoredProcedure [dbo].[SearchCheckListOptionsWithPagination]    Script Date: 1/22/2025 12:21:52 AM ******/
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
			CASE WHEN EXISTS (SELECT 1 FROM MatchCheckListOption WHERE CLOptionID = clo.CLOptionID AND IsActive = 'True') THEN 1 ELSE 0 END AS Disables,
			CASE WHEN EXISTS (SELECT 1 FROM MatchCheckListOption WHERE CLOptionID = clo.CLOptionID AND IsActive = 'True') THEN 1 ELSE 0 END AS Deletes,
			ROW_NUMBER() OVER (
			ORDER BY 
				clo.IsActive DESC, 
				clo.CLOptionID DESC
			) AS RowNum
			FROM 
				CheckListOptions AS clo 
			WHERE 
				(@SearchTerm IS NULL OR clo.CLOptionName LIKE '%' + @SearchTerm + '%')
    )
    SELECT * 
    FROM CheckListOptionData 
END
GO
/****** Object:  StoredProcedure [dbo].[SearchCheckListWithPagination]    Script Date: 1/22/2025 12:21:52 AM ******/
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
		CASE WHEN EXISTS (SELECT 1 FROM MatchCheckList WHERE CListID = cl.CListID) THEN 1 ELSE 0 END AS Disables,
		ROW_NUMBER() OVER (
			ORDER BY 
				cl.IsActive DESC, 
				cl.CListID DESC
		) AS RowNum
	FROM 
		CheckLists As cl
	WHERE 
        (@SearchTerm IS NULL OR cl.CListName LIKE '%' + @SearchTerm + '%')
END
GO
/****** Object:  StoredProcedure [dbo].[SearchExpectedResultWithPagination]    Script Date: 1/22/2025 12:21:52 AM ******/
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
			er.ApprovedID ,
			er.Status, 
			er.CreateDate,
			u.UserName,
			(au.UserName) As ApprovedName,
            ROW_NUMBER() OVER (
                ORDER BY 
                    er.CreateDate DESC, 
                    er.TableID DESC
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
			Users as au on au.UserID = er.ApprovedID
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
			er.ApprovedID ,
			er.Status ,
			u.UserName,
			au.UserName
    )
    SELECT * 
    FROM ExpedtedResultData 
END
GO
/****** Object:  StoredProcedure [dbo].[SearchFormsPagination]    Script Date: 1/22/2025 12:21:52 AM ******/
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
            f.FormNumber,
			f.FormName,
			f.Description,
			f.IsActive,
            CASE WHEN er.FormID IS NOT NULL THEN 'Tran'  
                 WHEN m.FormID IS NOT NULL THEN 'Used' 
                 ELSE 'Draf' END AS FormState,
			CASE 
                WHEN m.FormID IS NOT NULL THEN 1 
                ELSE 0 
            END AS Disables,
			CASE WHEN er.FormID IS NOT NULL THEN 1
                 WHEN m.FormID IS NOT NULL THEN 1
                 ELSE 0 END AS Deletes,
            ROW_NUMBER() OVER (
                ORDER BY 
                    f.IsActive DESC, 
                    f.FormID DESC
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
            f.FormNumber,
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
/****** Object:  StoredProcedure [dbo].[SearchGroupCheckListOptionsWithPagination]    Script Date: 1/22/2025 12:21:52 AM ******/
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
			CASE 
				WHEN EXISTS (
					SELECT 1
					FROM MatchCheckListOption AS mclo
					WHERE mclo.GCLOptionID = gclo.GCLOptionID
					AND mclo.IsActive = 'True'
				) OR EXISTS (
					SELECT 1
					FROM MatchCheckList AS mcl
					WHERE mcl.GCLOptionID = gclo.GCLOptionID
				) THEN 1
				ELSE 0 
			END AS Disables,
			ROW_NUMBER() OVER (
				ORDER BY 
					gclo.IsActive DESC,
					gclo.GCLOptionID DESC
			) AS RowNum
		FROM 
			GroupCheckListOptions AS gclo 
				WHERE 
		(@SearchTerm IS NULL OR gclo.GCLOptionName LIKE '%' + @SearchTerm + '%' OR gclo.GCLOptionID LIKE '%' + @SearchTerm + '%')
    )
    SELECT * 
    FROM GroupCheckListOptionData 
END
GO
/****** Object:  StoredProcedure [dbo].[SearchGroupMachinesWithPagination]    Script Date: 1/22/2025 12:21:52 AM ******/
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
				WHEN EXISTS (
					SELECT 1
					From Machines WHERE GMachineID = gm.GMachineID AND IsActive = 'True'
				) THEN 1
				ELSE 0 
			END AS Disables,
			CASE 
				WHEN EXISTS (SELECT 1 FROM Machines WHERE GMachineID = gm.GMachineID) OR
				EXISTS (SELECT 1 FROM ExpectedResults WHERE MachineID IN (SELECT MachineID From Machines WHERE GMachineID = gm.GMachineID)) THEN 1 
				ELSE 0 
			END AS Deletes,
			ROW_NUMBER() OVER (
				ORDER BY 
					gm.IsActive DESC, 
					gm.GMachineID DESC
			) AS RowNum
		FROM 
			GroupMachines AS gm
		WHERE 
			(@SearchTerm IS NULL OR gm.GMachineID LIKE '%' + @SearchTerm + '%' OR gm.GMachineName LIKE '%' + @SearchTerm + '%' OR gm.Description LIKE '%' + @SearchTerm + '%' OR gm.ScheduleID LIKE '%' + @SearchTerm + '%')
		)
    SELECT * 
    FROM GroupMachinesData 
END
GO
/****** Object:  StoredProcedure [dbo].[SearchMachinesWithPagination]    Script Date: 1/22/2025 12:21:52 AM ******/
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
			CASE 
				WHEN gm.IsActive = 'False' THEN 1 
				ELSE 0 
			END AS Disables,
			CASE 
				WHEN EXISTS (
					SELECT 1
					FROM ExpectedResults
					WHERE MachineID = m.MachineID
				) THEN 1 
				ELSE 0 
			END AS Deletes,
			ROW_NUMBER() OVER (
				ORDER BY 
					m.IsActive DESC, 
					m.MachineID DESC
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
/****** Object:  StoredProcedure [dbo].[SearchMatchFormMachineWithPagination]    Script Date: 1/22/2025 12:21:52 AM ******/
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
					m.MachineID DESC
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
/****** Object:  StoredProcedure [dbo].[SearchMatchGroupCheckListAndOptionWithPagination]    Script Date: 1/22/2025 12:21:52 AM ******/
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
			gclo.GCLOptionID,
			gclo.GCLOptionName,
			clo.CLOptionName,
			mclo.DisplayOrder,
			CASE 
				WHEN EXISTS (SELECT 1 FROM ExpectedResults WHERE GCLOptionID = mclo.GCLOptionID) 
						OR gclo.IsActive = 'False' 
						OR clo.IsActive = 'False' 
				THEN 1 
				ELSE 0 
			END AS Disables,
			CASE 
				WHEN EXISTS (SELECT 1 FROM ExpectedResults WHERE GCLOptionID = mclo.GCLOptionID) 
					OR EXISTS (SELECT 1 FROM MatchCheckList As mcl 
					Inner Join SubForms As sf ON sf.SFormID = mcl.SFormID 
					Inner Join Forms As f On f.FormID = sf.FormID 
					Inner Join Machines As m On m.FormID = f.FormID 
					WHERE mclo.GCLOptionID = mcl.GCLOptionID)

					OR gclo.IsActive = 'False' 
					OR clo.IsActive = 'False' THEN 1 
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
		INNER JOIN 
			CheckListOptions AS clo ON mclo.CLOptionID = clo.CLOptionID
		WHERE 
            (@SearchTerm IS NULL OR gclo.GCLOptionName LIKE '%' + @SearchTerm + '%' OR clo.CLOptionName LIKE '%' + @SearchTerm + '%')
	)
    SELECT * 
    FROM MatchGroupCheckListAndOptionData 
END
GO
/****** Object:  StoredProcedure [dbo].[SearchScheduleWithPagination]    Script Date: 1/22/2025 12:21:52 AM ******/
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
/****** Object:  StoredProcedure [dbo].[TransactionAppConfig]    Script Date: 1/22/2025 12:21:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TransactionAppConfig]
	@AppIDPara NVARCHAR(2) = NULL,
    @AppNamePara NVARCHAR(50) = NULL,  
    @GroupMachinePara NVARCHAR(100) = NULL,  
    @MachinePara NVARCHAR(100) = NULL,  
    @CheckListPara NVARCHAR(100) = NULL,  
    @GroupCheckListPara NVARCHAR(100) = NULL,  
    @CheckListOptionPara NVARCHAR(100) = NULL,  
    @MatchCheckListOptionPara NVARCHAR(100) = NULL,  
    @MatchFormMachinePara NVARCHAR(100) = NULL,  
    @FormPara NVARCHAR(100) = NULL,  
    @SubFormPara NVARCHAR(100) = NULL,  
    @ExpectedResultPara NVARCHAR(100) = NULL,  
    @UsersPermissionPara NVARCHAR(100) = NULL,
	@TimeSchedulePara NVARCHAR(100) = NULL,

    @PF_GroupMachinePara NVARCHAR(9) = NULL,  
    @PF_MachinePara NVARCHAR(9) = NULL,  
    @PF_CheckListPara NVARCHAR(9) = NULL,  
    @PF_GroupCheckListPara NVARCHAR(9) = NULL,  
    @PF_CheckListOptionPara NVARCHAR(9) = NULL,  
    @PF_MatchCheckListOptionPara NVARCHAR(9) = NULL,  
    @PF_MatchFormMachinePara NVARCHAR(9) = NULL,  
    @PF_FormPara NVARCHAR(9) = NULL,  
    @PF_SubFormPara NVARCHAR(9) = NULL,  
    @PF_ExpectedResultPara NVARCHAR(9) = NULL,  
    @PF_UsersPermissionPara NVARCHAR(9) = NULL,
	@PF_TimeSchedulePara NVARCHAR(9) = NULL
AS
BEGIN
	IF @AppIDPara IS NOT NULL AND @AppIDPara <> ''
	BEGIN
		UPDATE AppConfig SET 
		AppName = NULLIF(@AppNamePara, NULL) ,
		GroupMachine = NULLIF(@GroupMachinePara , NULL) ,
		Machine = NULLIF(@MachinePara , NULL) ,
		CheckList = NULLIF(@CheckListPara , NULL) ,
		GroupCheckList = NULLIF(@GroupCheckListPara , NULL) ,
		CheckListOption = NULLIF(@CheckListOptionPara , NULL) ,
		MatchFormMachine = NULLIF(@MatchFormMachinePara , NULL) ,
		Form = NULLIF(@FormPara , NULL) ,
		SubForm = NULLIF(@SubFormPara , NULL) ,
		ExpectedResult = NULLIF(@ExpectedResultPara , NULL) ,
		UsersPermission = NULLIF(@UsersPermissionPara , NULL),
		TimeSchedule = NULLIF(@TimeSchedulePara , NULL),
		
		PF_GroupMachine = NULLIF(@PF_GroupMachinePara , NULL) ,
		PF_Machine = NULLIF(@PF_MachinePara , NULL) ,
		PF_CheckList = NULLIF(@PF_CheckListPara , NULL) ,
		PF_GroupCheckList = NULLIF(@PF_GroupCheckListPara , NULL) ,
		PF_CheckListOption = NULLIF(@PF_CheckListOptionPara , NULL) ,
		PF_MatchCheckListOption = NULLIF(@PF_MatchCheckListOptionPara , NULL) ,
		PF_MatchFormMachine = NULLIF(@PF_MatchFormMachinePara , NULL) ,
		PF_Form = NULLIF(@PF_FormPara , NULL) ,
		PF_SubForm = NULLIF(@PF_SubFormPara , NULL) ,
		PF_ExpectedResult = NULLIF(@PF_ExpectedResultPara , NULL) ,
		PF_UsersPermission = NULLIF(@PF_UsersPermissionPara , NULL),
		PF_TimeSchedule = NULLIF(@PF_TimeSchedulePara , NULL)

		WHERE AppID = @AppIDPara

		UPDATE Menu SET MenuLabel = @MachinePara WHERE MenuID = 3
		UPDATE Menu SET MenuLabel = @GroupMachinePara WHERE MenuID = 4
		UPDATE Menu SET MenuLabel = @MachinePara WHERE MenuID = 5
		UPDATE Menu SET MenuLabel = @CheckListPara WHERE MenuID = 6
		UPDATE Menu SET MenuLabel = @CheckListPara WHERE MenuID = 7
		UPDATE Menu SET MenuLabel = @GroupCheckListPara WHERE MenuID = 8
		UPDATE Menu SET MenuLabel = @CheckListOptionPara WHERE MenuID = 9
		UPDATE Menu SET MenuLabel = @MatchCheckListOptionPara WHERE MenuID = 10
		UPDATE Menu SET MenuLabel = @MatchFormMachinePara WHERE MenuID = 11
		UPDATE Menu SET MenuLabel = @FormPara WHERE MenuID = 13
		UPDATE Menu SET MenuLabel = @ExpectedResultPara WHERE MenuID = 14
		UPDATE Menu SET MenuLabel = @UsersPermissionPara WHERE MenuID = 22
		UPDATE Menu SET MenuLabel = @TimeSchedulePara WHERE MenuID = 27
	END
END
GO
