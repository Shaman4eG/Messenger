-- Returns "TRUE", if finds a personal chat between users with given ids.
-- Returns "FALSE", if such chat was not found.

IF EXISTS
(
	SELECT [ChatId]
	FROM [ChatMembers], 
	(
		SELECT [Id]
		FROM [Chat],
		(
			SELECT [ChatId]	
			FROM [ChatMembers]
			WHERE [UserId] = @user1
		) AS [UserChats]
		WHERE 
		(
			[Id] = [ChatId] AND
			[Type] = 'personal'
		)
	) AS [UserPersonalChats]
	WHERE 
	(
		[ChatId] = [Id] AND
		[UserId] = @user2
	)
)
	SELECT 'TRUE' AS [RESULT]
ELSE
	SELECT 'FALSE' AS [RESULT]