# PORP LAB : ProxySQL/Orchestrator/Replication/PMM

### Install VirtualBox
```bash
Version 5.2.22 or Later 
```
### Install Vagrant
```bash
Version 2.2.2 or Later
```
### Install Vagrant plugin hostmanager
```bash
vagrant plugin install vagrant-hostmanager
```
### Update Vagrant Plugin
```bash
vagrant plugin update
```
### Clone the repo
```bash
git clone https://github.com/abhinavbit/PORP-LAB.git

```
### Create Lab
```bash
vagrant up --provision 
```
### Connect to each node
```bash
vagrant ssh app

vagrant ssh mysql1

vagrant ssh mysql2

vagrant ssh mysql3
```
### Verify Replication 
```bash
vagrrant ssh mysql2
mysql -e"show slave status\G"

vagrant ssh mysql3
mysql -e"show slave status\G"
```
### Verify ProxySQL 
```bash
vagrant ssh app

service proxysql restart 

mysql -u admin -padmin -h 127.0.0.1 -P6032 --prompt='ProxySQL> '

ProxySQL> select * from runtime_mysql_servers;
+--------------+----------+------+--------+--------+-------------+-----------------+---------------------+---------+----------------+---------+
| hostgroup_id | hostname | port | status | weight | compression | max_connections | max_replication_lag | use_ssl | max_latency_ms | comment |
+--------------+----------+------+--------+--------+-------------+-----------------+---------------------+---------+----------------+---------+
| 1            | mysql1   | 3306 | ONLINE | 1      | 0           | 1000            | 0                   | 0       | 0              |         |
| 2            | mysql3   | 3306 | ONLINE | 1      | 0           | 1000            | 0                   | 0       | 0              |         |
| 2            | mysql2   | 3306 | ONLINE | 1      | 0           | 1000            | 0                   | 0       | 0              |         |
+--------------+----------+------+--------+--------+-------------+-----------------+---------------------+---------+----------------+---------+
3 rows in set (0.00 sec)

root@app:~# mysql -uproxysql -pproxysql -h 127.0.0.1 -P6033 -e "START TRANSACTION; SELECT @@hostname; ROLLBACK;"
mysql: [Warning] Using a password on the command line interface can be insecure.
+------------+
| @@hostname |
+------------+
| mysql1     |
+------------+
root@app:~# mysql -uproxysql -pproxysql -h 127.0.0.1 -P6033 -e "SELECT @@hostname;"
mysql: [Warning] Using a password on the command line interface can be insecure.
+------------+
| @@hostname |
+------------+
| mysql2     |
+------------+
root@app:~# mysql -uproxysql -pproxysql -h 127.0.0.1 -P6033 -e "SELECT @@hostname;"
mysql: [Warning] Using a password on the command line interface can be insecure.
+------------+
| @@hostname |
+------------+
| mysql3     |
+------------+
```
### Verify Orchestrator 
-- Open below link on web browser 
```bash
http://192.168.135.101:3000
```
-- Go to Clusters > Discover. 
-- Enter all db nodes under `Enter Host Name` field and then click on submit.
```bash
mysql1
mysql2
mysql3
```
-- Got to Clusters > Dashboard. Now replication between nodes will be visible over dashboard.
![Orchestrator_Dashboard](https://github.com/abhinavbit/PORP-LAB/blob/master/Orchestrator_Dashboard.png)
### Verify PMM 
-- Open PMM dashbaord link on web browser
```bash
http://192.168.135.101:80
```
### NOTES 
1. If due to any reason like slow ISP, network issues, if create lab `vagrant up --provision` got failed, then just re-run the `vagrant up --provision` command to create lab.
 
2. Once you done with usage of PORP LAB, you can just simply run `vagrant halt` command to power off the nodes and Next time when you need again PORP LAB then just run `vagrant up --provision` to start all lab nodes.  
