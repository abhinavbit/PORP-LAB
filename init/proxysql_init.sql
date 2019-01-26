#Setting mysql-monitor credential 
SET mysql-monitor_username='repl';
SET mysql-monitor_password='repl';

LOAD MYSQL VARIABLES TO RUNTIME;
SAVE MYSQL VARIABLES TO DISK;

#Setting backend proxysql user credential 
INSERT INTO mysql_users (username,password, default_hostgroup) VALUES ('proxysql','proxysql',1);
LOAD MYSQL USERS TO RUNTIME;
SAVE MYSQL USERS TO DISK;

#Replication hostgroup & MySQL Server 
INSERT INTO mysql_replication_hostgroups (writer_hostgroup, reader_hostgroup) VALUES(1,2);
INSERT INTO mysql_servers (hostgroup_id, hostname, port, weight) VALUES (1,'mysql1',3306,1);
INSERT INTO mysql_servers (hostgroup_id, hostname, port, weight) VALUES (2,'mysql2',3306,1);
INSERT INTO mysql_servers (hostgroup_id, hostname, port, weight) VALUES (2,'mysql3',3306,1);
LOAD MYSQL SERVERS TO RUNTIME;
SAVE MYSQL SERVERS TO DISK;

#Query Rules 
INSERT INTO mysql_query_rules (active, match_pattern, destination_hostgroup, cache_ttl) VALUES (1, '^SELECT .* FOR UPDATE', 1, NULL);
INSERT INTO mysql_query_rules (active, match_pattern, destination_hostgroup, cache_ttl) VALUES (1, '^SELECT .*', 2, NULL);
LOAD MYSQL QUERY RULES TO RUNTIME;
SAVE MYSQL QUERY RULES TO DISK;
