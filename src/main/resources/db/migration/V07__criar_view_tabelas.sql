CREATE VIEW VW_TABLE_NAMES    
AS   
SELECT    
  t.Name AS TABELA   
FROM    
  sys.tables t    
  INNER JOIN sys.indexes i ON t.object_id = i.object_id    
  INNER JOIN sys.partitions p ON i.object_id = p.object_id AND i.index_id = p.index_id    
  WHERE p.Rows > 0 AND t.Name <> 'flyway_schema_history'
GROUP BY t.Name, p.Rows;